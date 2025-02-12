#find colon init
#data modify storage ulg:macro find_colon set value {packet:{idx:0,next:1}}
#scoreboard players set #find_colon_next ulg_intick 1


$data modify storage ulg:macro find_colon.t set string storage ulg:macro find_colon.text $(idx) $(next)

execute if data storage ulg:macro find_colon{t:":"} run return run data modify storage ulg:macro find_colon.result set from storage ulg:macro find_colon.packet

data modify storage ulg:macro find_colon.packet.idx set from storage ulg:macro find_colon.packet.next
scoreboard players add #find_colon_next ulg_intick 1
execute store result storage ulg:macro find_colon.packet.next int 1 run scoreboard players get #find_colon_next ulg_intick

function ulg:bp/sub/set_lore/prepare_slot_x/find_colon_macro with storage ulg:macro find_colon.packet