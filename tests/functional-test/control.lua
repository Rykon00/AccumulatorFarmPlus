-- Functional test for AccumulatorFarmPlus, run by tools/load_check.py --test-mod tests/functional-test.
-- Checks per tier (vanilla values without Space Age, Space Age values with it): buffer capacity, flow limits,
-- recipe category, unlock by the right technology, and that a placed farm charges from solar panels.
-- Writes "[functional-test] PASS|FAIL ..." and ends with DONE.

local TAG = "[functional-test] "
local START = 10
local CHECK = START + 600

local function pass(msg) log(TAG .. "PASS " .. msg) end
local function fail(msg) log(TAG .. "FAIL " .. msg) end

local TIERS = {
  {name = "small-accumulator-farm",  vanilla = {500e6, 30e6},  space_age = {10e9, 1e9},    sa_tech = "accumulator-farm-plus-tier-1"},
  {name = "medium-accumulator-farm", vanilla = {1e9, 60e6},    space_age = {100e9, 10e9},  sa_tech = "accumulator-farm-plus-tier-2"},
  {name = "large-accumulator-farm",  vanilla = {2e9, 120e6},   space_age = {1e12, 100e9},  sa_tech = "accumulator-farm-plus-tier-3"},
}

local farms = {}

local function near(a, b) return math.abs(a - b) <= math.max(1, math.abs(b) * 1e-6) end

local function setup()
  local sa = script.active_mods["space-age"] ~= nil
  local force = game.forces.player
  local surface = game.surfaces[1]

  for _, t in ipairs(TIERS) do
    local proto = prototypes.entity[t.name]
    if not proto then fail(t.name .. ": entity missing") goto continue end
    local values = sa and t.space_age or t.vanilla
    local src = proto.electric_energy_source_prototype
    local buffer = src.buffer_capacity
    local flow = src.get_input_flow_limit() * 60
    if near(buffer, values[1]) then pass(string.format("%s: buffer %.3g J", t.name, buffer))
    else fail(string.format("%s: buffer %.3g J, expected %.3g", t.name, buffer, values[1])) end
    if near(flow, values[2]) then pass(string.format("%s: input flow %.3g W", t.name, flow))
    else fail(string.format("%s: input flow %.3g W, expected %.3g", t.name, flow, values[2])) end

    local recipe = force.recipes[t.name]
    local tech_name = sa and t.sa_tech or t.name
    local tech = force.technologies[tech_name]
    if not recipe then fail(t.name .. ": recipe missing")
    elseif not tech then fail(t.name .. ": technology " .. tech_name .. " missing")
    else
      if sa then
        local cats = recipe.prototype.categories or {recipe.prototype.category}
        local em = false
        for _, c in pairs(cats) do if c == "electromagnetics" then em = true end end
        if em then pass(t.name .. ": crafted in the electromagnetic plant")
        else fail(t.name .. ": recipe category is not electromagnetics") end
      end
      tech.researched = true
      if recipe.enabled then pass(t.name .. ": unlocked by " .. tech_name)
      else fail(t.name .. ": not unlocked by " .. tech_name) end
    end
    ::continue::
  end

  -- Accumulators only charge from primary/secondary producers (not from an electric-energy-interface,
  -- which is tertiary like them), so every farm gets its own network with solar panels (daytime at tick 0).
  surface.always_day = true
  for i, t in ipairs(TIERS) do
    if prototypes.entity[t.name] then
      local x = (i - 2) * 60
      local area = {{x - 12, -12}, {x + 12, 12}}
      for _, e in pairs(surface.find_entities_filtered{area = area}) do
        if e.valid and e.type ~= "character" then e.destroy() end
      end
      local tiles = {}
      for tx = x - 12, x + 11 do for ty = -12, 11 do tiles[#tiles + 1] = {name = "lab-dark-1", position = {tx, ty}} end end
      surface.set_tiles(tiles)
      surface.create_entity{name = "substation", position = {x, 0}, force = force}
      for j = 0, 3 do
        surface.create_entity{name = "solar-panel", position = {x - 6 + j * 4 + 0.5, -5.5}, force = force}
      end
      farms[#farms + 1] = surface.create_entity{name = t.name, position = {x + 4, 3}, force = force}
    end
  end
end

local function check()
  for _, farm in ipairs(farms) do
    if farm.energy > 0 then pass(string.format("%s: charged to %.3g J", farm.name, farm.energy))
    else fail(farm.name .. ": did not charge") end
  end
  log(TAG .. "DONE")
end

script.on_nth_tick(START, function(e) if e.tick == START then setup() end end)
script.on_nth_tick(CHECK, function(e) if e.tick == CHECK then check() end end)
