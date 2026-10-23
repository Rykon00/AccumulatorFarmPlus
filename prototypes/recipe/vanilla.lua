data:extend({
  {
    type = "recipe",
    name = "small-accumulator-farm",
    enabled = false,
    ingredients = 
    {
      {type ="item", name="accumulator", amount=100},
    },
    results = -- Use results as a list (table), even for one result
    {
      {type ="item", name="small-accumulator-farm", amount=1},
    },
  },
  {
    type = "recipe",
    name = "medium-accumulator-farm",
    enabled = false,
    ingredients = 
    {
      {type ="item", name="small-accumulator-farm", amount=2},
    },
    results = 
    { -- Wrap this in curly brackets to make it a list
      {type ="item", name="medium-accumulator-farm", amount=1},
    },
  },
  {
    type = "recipe",
    -- 2.0's "basic-crafting" (assembling machines only, no hand crafting) became "advanced-crafting" in 2.1
    categories = {"advanced-crafting"},
    name = "large-accumulator-farm",
    enabled = false,
    ingredients = 
    {
      {type ="item", name="medium-accumulator-farm", amount=2},
    },
    results = 
    { -- Wrap this in curly brackets to make it a list
      {type ="item", name="large-accumulator-farm", amount=1},
    },
  },
})
