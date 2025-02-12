summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stick",count:1,components:{}},Tags:["ulg_intick41"]}

$data modify entity @e[type=item,tag=ulg_intick41,sort=nearest,limit=1] Item set from entity @s Item.components."minecraft:custom_data".bp.Inventory[{Slot:$(Slot)b}]
$data remove entity @s Item.components."minecraft:custom_data".bp.Inventory[{Slot:$(Slot)b}]

tag @e remove ulg_intick41