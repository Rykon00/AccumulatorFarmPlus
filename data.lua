local branch = "vanilla"

require ("prototypes.entity.vanilla")
require ("prototypes.item.vanilla")
require ("prototypes.recipe.vanilla")
require ("prototypes.technology.vanilla" )

if mods["space-age"] then
  require ("prototypes.space-age")
end
