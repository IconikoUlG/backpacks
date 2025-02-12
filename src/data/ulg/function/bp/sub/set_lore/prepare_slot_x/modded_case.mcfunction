#find colon init
data modify storage ulg:macro find_colon set value {packet:{idx:0,next:1}}
data modify storage ulg:macro find_colon.text set from storage ulg:macro prepare_slot_x.packet.id
scoreboard players set #find_colon_next ulg_intick 1

function ulg:bp/sub/set_lore/prepare_slot_x/find_colon_macro with storage ulg:macro find_colon.packet

execute unless data storage ulg:macro find_colon.result run return run function ulg:bp/sub/set_lore/prepare_slot_x/set with storage ulg:macro prepare_slot_x.packet

function ulg:bp/sub/set_lore/prepare_slot_x/modded_case_sub with storage ulg:macro find_colon.result

function ulg:bp/sub/set_lore/prepare_slot_x/test_block with storage ulg:macro prepare_slot_x.packet
execute if score #test_block ulg_intick matches 1 run data modify storage ulg:macro prepare_slot_x.packet.type set value "block"

function ulg:bp/sub/set_lore/prepare_slot_x/set with storage ulg:macro prepare_slot_x.packet