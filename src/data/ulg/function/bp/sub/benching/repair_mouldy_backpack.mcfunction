playsound minecraft:block.anvil.use block @a[distance=..6] ~ ~ ~ 1 0.6 0.7

execute if data entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.Inventory[0] run function ulg:bp/sub/benching/rpmbp_recursive

kill @e[type=interaction,tag=ulg.backpackModifiable.hitbox,distance=..0.1,sort=nearest,limit=1]
kill @s

loot spawn ~ ~1 ~ loot ulg:backpack/vintage

return 1