data:extend({
  {
      type = "technology",
      name = "small-accumulator-farm",
      localised_description = {"technology-description.small-solar-farm"},
      icon_size = 256,
      icon_mipmaps = 4,
      icon = "__base__/graphics/technology/electric-energy-acumulators.png",
      effects = {
          { type = "unlock-recipe", recipe = "small-accumulator-farm" }
      },
      prerequisites = {"solar-energy"},
      unit = {
          count = 25,
          ingredients = {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1}
          },
          time = 15
      },
      order = "a-h-c"
  },
  {
      type = "technology",
      name = "medium-accumulator-farm",
      localised_description = {"technology-description.medium-solar-farm"},
      icon_size = 256,
      icon_mipmaps = 4,
      icon = "__base__/graphics/technology/electric-energy-acumulators.png",
      effects = {
          { type = "unlock-recipe", recipe = "medium-accumulator-farm" }
      },
      prerequisites = {"small-accumulator-farm"},
      unit = {
          count = 50,
          ingredients = {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1}
          },
          time = 15
      },
      order = "a-h-d"
  },
  {
      type = "technology",
      name = "large-accumulator-farm",
      localised_description = {"technology-description.large-solar-farm"},
      icon_size = 256,
      icon_mipmaps = 4,
      icon = "__base__/graphics/technology/electric-energy-acumulators.png",
      effects = {
          { type = "unlock-recipe", recipe = "large-accumulator-farm" }
      },
      prerequisites = {"medium-accumulator-farm"},
      unit = {
          count = 100,
          ingredients = {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1}
          },
          time = 15
      },
      order = "a-h-e"
  }
})
