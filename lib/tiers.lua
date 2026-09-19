local colors = require("colors")

local vanilla_tiers =
{
    tier_1 = {
        index        = 1,
        color        = colors.tier_1,
        target       = "small-accumulator-farm",
        buffer_capacity = "500MJ",
        usage_priority = "tertiary",
        input_flow_limit = "30MW",
        output_flow_limit = "30MW"
      },
      tier_2 = {
        index        = 2,
        color        = colors.tier_2,
        target       = "medium-accumulator-farm",
        buffer_capacity = "1GJ",
        usage_priority = "tertiary",
        input_flow_limit = "60MW",
        output_flow_limit = "60MW"
      },
      tier_3 = {
        index        = 3,
        color        = colors.tier_3,
        target       = "large-accumulator-farm",
        buffer_capacity = "2GJ",
        usage_priority = "tertiary",
        input_flow_limit = "120MW",
        output_flow_limit = "120MW"
      },
}

-- Overrides applied on top of vanilla_tiers when Space Age is active
-- (see prototypes/space-age.lua). Keys match the tier keys above.
local space_age_tiers =
{
    tier_1 = {
        buffer_capacity = "10GJ",
        input_flow_limit = "1GW",
        output_flow_limit = "1GW"
      },
      tier_2 = {
        buffer_capacity = "100GJ",
        input_flow_limit = "10GW",
        output_flow_limit = "10GW"
      },
      tier_3 = {
        buffer_capacity = "1TJ",
        input_flow_limit = "100GW",
        output_flow_limit = "100GW"
      },
}

return {
    vanilla = vanilla_tiers,
    space_age = space_age_tiers,
  }