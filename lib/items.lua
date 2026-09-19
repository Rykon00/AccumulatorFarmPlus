local function accumulator_farm_item(data)
    local order = data.order
    local tier  = data.tier

  return {
    type = "item",
    name = tier.target,
    icons = {{icon = "__base__/graphics/icons/accumulator.png", tint = tier.color}},
    icon_size = 64, icon_mipmaps = 4,
    order = order,
    subgroup = "energy",
    place_result = tier.target,
    stack_size = 10
  }
end

return {
  accumulator_farm = accumulator_farm_item
  }