# AccumulatorFarm+

Factorio mod: one item is a whole accumulator farm, instead of a lot of accumulators taking up space on the map.

Mod portal: https://mods.factorio.com/mod/AccumulatorFarmPlus

An extended fork of [AccumulatorFarm](https://mods.factorio.com/mod/AccumulatorFarm) by EliteRamsay, adding a
Space Age / Fulgora progression on top of the original's three accumulator tiers.

## What it does

- Three accumulator farms (Small, Medium, Large), each storing the energy of many accumulators in one building.
- Without Space Age, the mod behaves like the original AccumulatorFarm.
- With **Space Age**, the three farms are crafted in the **Electromagnetic Plant** from Superconductor,
  Supercapacitor and Electrolyte, store far more energy and are unlocked by three own technologies right after the
  Electromagnetic Plant. The original early-game technologies no longer unlock them.

## Tiers (with Space Age)

| Tier | Recipe | Buffer | Flow |
|---|---|---|---|
| Small | 10x Accumulator + 20x Superconductor | 10GJ | 1GW |
| Medium | 2x Small + 20x Supercapacitor | 100GJ | 10GW |
| Large | 2x Medium + 40x Superconductor + 40x Supercapacitor + 100x Electrolyte | 1TJ | 100GW |

## Credits

Based on [AccumulatorFarm](https://mods.factorio.com/mod/AccumulatorFarm) (MIT) by EliteRamsay. The tiering concept
and the base sprites are from the original mod; this fork adds the Space Age / Electromagnetic Plant progression on
top.

## License

MIT, see [LICENSE](LICENSE) (with the original AccumulatorFarm copyright notice).
