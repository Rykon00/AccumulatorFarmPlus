local function accumulator_farm_entity(data)
    local tier = data.tier
return
{
    type = "accumulator",
    name = tier.target,
    icons = {{icon = "__base__/graphics/icons/accumulator.png", tint = tier.color}},
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = tier.target},
    max_health = 150,
    corpse = "accumulator-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = tier.buffer_capacity,
      usage_priority = tier.usage_priority,
      input_flow_limit = tier.input_flow_limit,
      output_flow_limit = tier.output_flow_limit,
    },
    chargable_graphics =
    {
      picture = {
        layers = {
          {
            filename = "__base__/graphics/entity/accumulator/accumulator.png",
            priority = "high",
            width = 130,
            height = 189,
            scale = 0.5,
            shift = util.by_pixel(0, -11),
            tint = tier.color,
            
          },
          {
            filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
            priority = "high",
            width = 234,
            height = 106,
            scale = 0.5,
            shift = util.by_pixel(28, 5),
            draw_as_shadow = true,
          }
        }
      },
      charge_animation = {
        filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",  -- Base animation
        width = 178,    -- Width of each frame
        height = 210,   -- Height of each frame
        line_length = 6,   -- Number of frames in each row
        frame_count = 24,  -- Total number of frames in the animation
        animation_speed = 0.5,  -- Speed of the animation
        scale=0.5,
        shift = {0, -0.65},  -- Position offset
      },
  
      charge_cooldown = 30,
      discharge_animation = {
        filename = "__base__/graphics/entity/accumulator/accumulator-discharge.png",  -- Base animation
        width = 174,    -- Width of each frame
        height = 214,   -- Height of each frame
        line_length = 6,   -- Number of frames in each row
        frame_count = 24,  -- Total number of frames in the animation
        animation_speed = 0.5,  -- Speed of the animation
        scale=0.5,
        shift = {0, -0.65},  -- Position offset
      },
      discharge_cooldown = 60,
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound =
      {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },

    circuit_connector = circuit_connector_definitions["accumulator"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_output_signal = {type = "virtual", name = "signal-A"},
}
end

return
{
  accumulator_farm = accumulator_farm_entity,
}