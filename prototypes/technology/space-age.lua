-- Space Age technologies for the three farm tiers.
-- Replaces the original solar-energy based technologies (removed in
-- prototypes/space-age.lua) with a chain that starts after the Electromagnetic Plant.

local tiers = require "lib.tiers"

local function tier_technology(data)
  local tier = data.tier
  local name = tier.target

  return {
    type = "technology",
    name = data.name,
    -- Explicit because Factorio would otherwise split the trailing "-<number>" off as a tech level
    localised_name = {"technology-name." .. data.name},
    localised_description = {"technology-description." .. data.name},
    icons = {{icon = "__base__/graphics/technology/electric-energy-acumulators.png", icon_size = 256, tint = tier.color}},
    effects = {
      {type = "unlock-recipe", recipe = name},
    },
    prerequisites = data.prerequisites,
    unit = {
      count = data.count,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", data.electromagnetic},
      },
      time = 60,
    },
    order = data.order,
  }
end

data:extend{
  tier_technology{
    name = "accumulator-farm-plus-tier-1",
    tier = tiers.vanilla.tier_1,
    prerequisites = {"electromagnetic-plant"},
    count = 1000,
    electromagnetic = 1,
    order = "e-g-a",
  },
  tier_technology{
    name = "accumulator-farm-plus-tier-2",
    tier = tiers.vanilla.tier_2,
    prerequisites = {"accumulator-farm-plus-tier-1"},
    count = 2500,
    electromagnetic = 2,
    order = "e-g-b",
  },
  tier_technology{
    name = "accumulator-farm-plus-tier-3",
    tier = tiers.vanilla.tier_3,
    prerequisites = {"accumulator-farm-plus-tier-2"},
    count = 5000,
    electromagnetic = 3,
    order = "e-g-c",
  },
}
