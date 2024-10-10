#SET_VERSION
scoreboard players set #BP_VERSION ulg_gen 3

#SET DEFAULT CONFIGS
execute unless score #CAN_PLACE_BACKPACKS ulg_gen matches 0.. run scoreboard players set #CAN_PLACE_BACKPACKS ulg_gen 1
execute unless score #CAN_MODIFY_BACKPACKS ulg_gen matches 0.. run scoreboard players set #CAN_MODIFY_BACKPACKS ulg_gen 1
execute unless score #BACKPACK_LORE_MODE ulg_gen matches 0.. run scoreboard players set #BACKPACK_LORE_MODE ulg_gen 1
execute unless score #TABLE_BACKPACKS_TICK ulg_gen matches 0.. run scoreboard players set #TABLE_BACKPACKS_TICK ulg_gen 0

#data modify storage ulg:backpack table_modifs.tag_map merge value {}
#data modify storage ulg:backpack table_modifs.specifics append value {}
#data modify storage ulg:backpack table_modifs.tagged append value {}

data modify storage ulg:backpack table_modifs set value {\
    "tag_map":{822300:"base",822302:"base_colored",822304:"base_colored",822306:"base_colored",\
    822308:"base_colored",822310:"base_colored",822312:"base_colored",822314:"base_colored",\
    822316:"base_colored",822318:"base_colored",822320:"base_colored",822322:"base_colored",\
    822324:"base_colored",822326:"base_colored",822328:"base_colored",822330:"base_colored",\
    822332:"base_colored",822334:"rare",822346:"rare"},\
    "specifics":[],\
    "tagged":[\
        {"tags":["base","base_colored"],"item":"minecraft:blue_dye","cmd":822302},\
        {"tags":["base","base_colored"],"item":"minecraft:yellow_dye","cmd":822304},\
        {"tags":["base","base_colored"],"item":"minecraft:white_dye","cmd":822306},\
        {"tags":["base","base_colored"],"item":"minecraft:orange_dye","cmd":822308},\
        {"tags":["base","base_colored"],"item":"minecraft:black_dye","cmd":822310},\
        {"tags":["base","base_colored"],"item":"minecraft:magenta_dye","cmd":822312},\
        {"tags":["base","base_colored"],"item":"minecraft:light_blue_dye","cmd":822314},\
        {"tags":["base","base_colored"],"item":"minecraft:lime_dye","cmd":822316},\
        {"tags":["base","base_colored"],"item":"minecraft:pink_dye","cmd":822318},\
        {"tags":["base","base_colored"],"item":"minecraft:gray_dye","cmd":822320},\
        {"tags":["base","base_colored"],"item":"minecraft:light_gray_dye","cmd":822322},\
        {"tags":["base","base_colored"],"item":"minecraft:cyan_dye","cmd":822324},\
        {"tags":["base","base_colored"],"item":"minecraft:purple_dye","cmd":822326},\
        {"tags":["base","base_colored"],"item":"minecraft:brown_dye","cmd":822328},\
        {"tags":["base","base_colored"],"item":"minecraft:green_dye","cmd":822330},\
        {"tags":["base","base_colored"],"item":"minecraft:red_dye","cmd":822332},\
        {"tags":["base","base_colored"],"item":"minecraft:emerald","cmd":822334}\
    ]\
}









