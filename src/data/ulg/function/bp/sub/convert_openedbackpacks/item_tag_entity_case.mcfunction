drop_macro = (~/drop_macro)

data modify entity @s Item.components."minecraft:custom_data".bp.Opened set value false
data modify entity @s Item.components."minecraft:custom_model_data".strings set value ["closed"]

particle minecraft:dust{color:[1.000,0.827,0.129],scale:1} ~ ~ ~ 0.1 0.1 0.1 1 20 normal @a[distance=..6]
tellraw @a[distance=..4] {"translate":"ulg.alert.changedinventory","color":"#ed7666"}

from nbtlib import Byte
for n in range(0,27):
    if data entity @s Item.components."minecraft:custom_data".bp.Inventory[{Slot:Byte(n),components:{"minecraft:custom_data":{bp:{}}}}] run function (drop_macro) {Slot:(n)}
    if data entity @s Item.components."minecraft:custom_data".bp.Inventory[{Slot:Byte(n),components:{"minecraft:container":[{item:{}}]}}] run function (drop_macro) {Slot:(n)}

function (drop_macro):
    #say dropMacro!!
    summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stick",count:1,components:{}},Tags:["ulg_intick41"]}

    $data modify entity @e[type=item,tag=ulg_intick41,sort=nearest,limit=1] Item set from entity @s Item.components."minecraft:custom_data".bp.Inventory[{Slot:$(Slot)b}]
    $data remove entity @s Item.components."minecraft:custom_data".bp.Inventory[{Slot:$(Slot)b}]

    tag @e remove ulg_intick41