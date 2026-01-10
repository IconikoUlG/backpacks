function_tag minecraft:load {"values": [(~/)]}
execute run function ./setup_controller

scoreboard objectives add ulg_gen dummy
scoreboard players set #-1 ulg_gen -1
scoreboard players set #0 ulg_gen 0
scoreboard players set #65536 ulg_gen 65536
scoreboard players set #256 ulg_gen 256
scoreboard players set #100 ulg_gen 100
scoreboard players set #10 ulg_gen 10
scoreboard players set #2 ulg_gen 2
scoreboard players set #225 ulg_gen 225

data merge storage ulg:backpack {false:false,true:true,intick:{},first_lore_size:1}
scoreboard objectives add ulg_bp_coas minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add ulg_bp_using dummy
execute in minecraft:overworld run forceload add 829999 829999
forceload add 829999 829999

unless score $ULG_BP_WORLDID ulg_gen matches 1..:
    store result score $ULG_BP_WORLDID ulg_gen run random value 1..99999
    scoreboard players set $ULG_BP_IDCOUNT ulg_gen 0
