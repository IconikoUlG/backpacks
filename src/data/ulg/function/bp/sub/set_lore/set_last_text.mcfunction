$data modify storage ulg:macro set_lore.packet.slot$(x)_pre set value ","
$data modify storage ulg:macro set_last_text.packet set value {x:$(x)}

scoreboard players remove @s ulg_intick 3
execute store result storage ulg:macro set_last_text.packet.rest int 1 run scoreboard players get @s ulg_intick

function ulg:bp/sub/set_lore/set_last_text_sub with storage ulg:macro set_last_text.packet