##say test_block
execute in minecraft:overworld run forceload add 0 0 0 0
scoreboard players reset #test_block ulg_intick
##$say before sub < checking block for id $(id)
$execute store result score #test_block ulg_intick run function ulg:bp/sub/set_lore/prepare_slot_x/test_block_sub {id:"$(id)"}