scoreboard objectives add ulg_gen dummy
scoreboard objectives add ulg_intick dummy
scoreboard objectives add ulg_intick1 dummy
scoreboard objectives add ulg_intick2 dummy
scoreboard objectives add ulg_macro dummy

data merge storage ulg:backpack {false:false,true:true,intick:{},first_lore_size:1}
scoreboard objectives add ulg_bk_usecar minecraft.used:minecraft.carrot_on_a_stick

execute in minecraft:overworld run forceload add 829999 829999
forceload add 829999 829999

execute unless score #BP_VERSION ulg_gen matches 3 run function ulg:backpack/setup