-- Space Age (Fulgora) variant of the three farm tiers.
-- Only loaded when Space Age is active (see data.lua); patches the vanilla
-- prototypes in place so the base-game values stay untouched otherwise.

local tiers = require "lib.tiers"

local function require_prototype(kind, name)
  assert(data.raw[kind] and data.raw[kind][name],
    "AccumulatorFarmPlus: Space Age is active but " .. kind .. " '" .. name .. "' does not exist")
end

require_prototype("item", "superconductor")
require_prototype("item", "supercapacitor")
require_prototype("fluid", "electrolyte")

local function item(name, amount) return {type = "item", name = name, amount = amount} end
local function fluid(name, amount) return {type = "fluid", name = name, amount = amount} end

local ingredients = {
  tier_1 = {
    item("accumulator", 10),
    item("superconductor", 20),
  },
  tier_2 = {
    item("small-accumulator-farm", 2),
    item("supercapacitor", 20),
  },
  tier_3 = {
    item("medium-accumulator-farm", 2),
    item("superconductor", 40),
    item("supercapacitor", 40),
    fluid("electrolyte", 100),
  },
}

for tier_key, ingredient_list in pairs(ingredients) do
  local vanilla = tiers.vanilla[tier_key]
  local override = tiers.space_age[tier_key]
  local name = vanilla.target

  local recipe = data.raw.recipe[name]
  recipe.ingredients = ingredient_list
  recipe.categories = {"electromagnetics"}

  local source = data.raw.accumulator[name].energy_source
  source.buffer_capacity = override.buffer_capacity
  source.input_flow_limit = override.input_flow_limit
  source.output_flow_limit = override.output_flow_limit

  data.raw.item[name].localised_description = {"item-description." .. name .. "-space-age"}

  -- The original solar-energy based technology would unlock the Electromagnetic
  -- Plant recipe far too early; it is replaced by the tier technologies below.
  data.raw.technology[name] = nil
end

require_prototype("technology", "electromagnetic-plant")
require_prototype("technology", "electromagnetic-science-pack")
require_prototype("item", "electromagnetic-science-pack")
require ("prototypes.technology.space-age")
