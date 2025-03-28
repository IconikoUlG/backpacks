$data modify storage ulg:macro set_lore.packet.slot$(x)_pre set value ","
$data modify storage ulg:macro set_last_text.packet set value {x:$(x)}

scoreboard players remove @s ulg_intick 3
execute store result storage ulg:macro set_last_text.packet.rest int 1 run scoreboard players get @s ulg_intick

function (~/macro):
    #say set_last_text!
    $data modify storage ulg:macro set_lore.packet.slot$(x)_text set value '[{\
    type: "translatable",\
    translate: "ulg.lore.more",\
    with:[\
        {text:"$(rest)"}\
        ],\
        color: "#B1B3B3",\
        italic: false\
    }\
    ]'
function (~/macro) with storage ulg:macro set_last_text.packet