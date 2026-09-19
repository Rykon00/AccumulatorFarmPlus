local tiers = require "lib.tiers"
local entities = require "lib.entities"

data:extend{
  entities.accumulator_farm{
    tier = tiers.vanilla.tier_1,
  },
  entities.accumulator_farm{
    tier = tiers.vanilla.tier_2,
  },
  entities.accumulator_farm{
    tier = tiers.vanilla.tier_3,
  },
}
