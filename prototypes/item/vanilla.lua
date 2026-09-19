local tiers = require "lib.tiers"
local items = require "lib.items"

data:extend{
  items.accumulator_farm{
    tier = tiers.vanilla.tier_1,
    order = "e[accumulator]-b[small-accumulator-farm]",
  },
  items.accumulator_farm{
    tier = tiers.vanilla.tier_2,
    order = "e[accumulator]-c[medium-accumulator-farm]",
  },
  items.accumulator_farm{
    tier = tiers.vanilla.tier_3,
    order = "e[accumulator]-d[large-accumulator-farm]",
  },
}
