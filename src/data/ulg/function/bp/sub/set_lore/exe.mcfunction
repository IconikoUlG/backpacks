#say set_lore_exe

# containerString: -> string, ex container.0 / weapon.offhand
# Slot: -> byte, ex -106, 0, etc.

$execute unless data entity @s Inventory[{Slot:$(Slot)b}].components."minecraft:custom_data".bp{isLoreInit:true} run return fail


$data modify storage ulg:macro set_lore set value {Slot:$(Slot),containerString:$(containerString)}

$data modify storage ulg:macro set_lore.item set from entity @s Inventory[{Slot:$(Slot)b}]

#say prepacket
## packet
$data modify storage ulg:macro set_lore.packet set value {containerString:$(containerString),slot0_pre:"",slot0_text:"",slot1_pre:"",slot1_text:"",slot2_pre:"",slot2_text:"",slot3_pre:"",slot3_text:""}
execute store result storage ulg:macro set_lore.packet.amount int 1 run data get storage ulg:macro set_lore.item.components."minecraft:custom_data".bp.Inventory

data modify storage ulg:macro set_lore.packet.size set from storage ulg:macro set_lore.item.components."minecraft:custom_data".bp.loreSize

execute if score $BACKPACK_LORE_MODE ulg_gen matches 0 run return run function ulg:bp/sub/set_lore/without_preview

scoreboard players reset @s ulg_intick
execute store result score @s ulg_intick run data get storage ulg:macro set_lore.item.components."minecraft:custom_data".bp.Inventory

execute if score @s ulg_intick matches 0 run return run function ulg:bp/sub/set_lore/empty

#say with preview
#with preview
execute if score @s ulg_intick matches 1 run data modify storage ulg:macro set_lore.packet.newSize set value 1
execute if score @s ulg_intick matches 1.. run function ulg:bp/sub/set_lore/prepare_slot_x {x:0}
execute if score @s ulg_intick matches 2 run data modify storage ulg:macro set_lore.packet.newSize set value 2
execute if score @s ulg_intick matches 2.. run function ulg:bp/sub/set_lore/prepare_slot_x {x:1}
execute if score @s ulg_intick matches 3 run data modify storage ulg:macro set_lore.packet.newSize set value 3
execute if score @s ulg_intick matches 3.. run function ulg:bp/sub/set_lore/prepare_slot_x {x:2}
execute if score @s ulg_intick matches 4.. run data modify storage ulg:macro set_lore.packet.newSize set value 4
execute if score @s ulg_intick matches 4.. run function ulg:bp/sub/set_lore/set_last_text {x:3}

#say with preview - pre set
function ulg:bp/sub/set_lore/set_macro with storage ulg:macro set_lore.packet

#scoreboard players operation #newsize ulg_intick = @s ulg_intick
#scoreboard players add #newsize ulg_intick 1
#execute if score #newsize ulg_intick matches 4.. run scoreboard players set #newsize ulg_intick 3
#execute store result storage ulg:macro set_lore.packet.newSize int 1 run scoreboard players get #newsize ulg_intick

#execute if score @s ulg_intick matches 1 run return run function ulg:bp/sub/set_lore/with_preview1
#execute if score @s ulg_intick matches 2.. run function ulg:bp/sub/set_lore/with_preview2