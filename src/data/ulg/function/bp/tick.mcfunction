from @builders import handleCondition

function_tag minecraft:tick {"values": [(~/)]}

def coasClick():
    if data entity @s equipment.offhand.components."minecraft:custom_data".bp.newV:
        function ulg:bp/sub/use_backpack
    if data entity @s equipment.offhand.components."minecraft:custom_data".ulg.BackPack:
        unless data entity @s equipment.offhand.components."minecraft:custom_data".ulg.BackPack.newV:
            tellraw @s {"translate":"ulg.alert.oldversionbackpack","color":"#ed7666","clickEvent": {"action":"open_url","value":"https://sites.google.com/view/ultroghasthub/datapacks/backpacks/open_mouldy_backpack","underlined":true}}

def playerTick():
    from @jsons import IM_make_mouldy, IM_append_slots_lore

    if data entity @s equipment.offhand.components."minecraft:custom_data".ulg.BackPack:
        unless data entity @s equipment.offhand.components."minecraft:custom_data".ulg.BackPack.newV:
            item modify entity @s weapon.offhand IM_make_mouldy()

    if data entity @s Inventory[].components."minecraft:custom_data".bp{Opened:1b}:
        unless data entity @s equipment.offhand.components."minecraft:custom_data".bp{Opened:1b}:
            function ulg:bp/sub/convert_openedbackpacks/player_inventory_case
    if data entity @s equipment.offhand.components."minecraft:custom_data".bp.newV:
        unless data entity @s equipment.offhand.components."minecraft:custom_data".bp{isLoreInit:true}:
            item modify entity @s weapon.offhand IM_append_slots_lore()
            function ulg:bp/sub/set_lore/macro {Slot:-106,containerString:"weapon.offhand"}

    if data entity @s Inventory[{components:{"minecraft:custom_data":{ulg:{BackPack:{newV:true}}}}}]:
        function ulg:bp/sub/fix25/act

    # handle COAS click
    if score @s ulg_bp_coas matches 1..: 
        coasClick()
        scoreboard players reset @s ulg_bp_coas

def entityTick():
    bTables = (~/tables)
    block_tag (bTables) {
        "values": [
            "minecraft:crafting_table",
            "#bpconfig:tables"
        ]
    }
    bTables = ('#'+bTables)

    if score $CAN_PLACE_BACKPACKS ulg_gen matches 1 as @s[tag=!global.ignore,nbt={Item:{components:{"minecraft:custom_data":{bp:{Opened:0b}}}}}] at @s if block ~ ~-0.3 ~ (bTables) align xyz positioned ~0.5 ~ ~0.5 run function ulg:bp/sub/benching/tryplace
    as @s[tag=!global.ignore,nbt={Item:{components:{"minecraft:custom_data":{ulg:{BackPack:{}}}}}}] at @s if block ~ ~-0.3 ~ (bTables) align xyz positioned ~0.5 ~ ~0.5 run function ulg:bp/sub/benching/tryplace

    as @s[tag=!global.ignore,nbt={Item:{components:{"minecraft:custom_data":{bp:{Opened:1b}}}}}] at @s run function ulg:bp/sub/convert_openedbackpacks/item_tag_entity_case

    if score $TABLE_BACKPACKS_TICK ulg_gen matches 1 as @s[type=minecraft:armor_stand,tag=ulg.backpackModifiable] at @s run function ulg:bp/sub/benching/asbackpack
    
    as @s[type=player] at @s:
        playerTick()

eTickable = (~/entities)
entity_type_tag (eTickable) {
  "replace": false,
  "values": [
    "minecraft:player",
    "minecraft:item",
    "minecraft:item_frame",
    "minecraft:armor_stand",
    "minecraft:interaction"
  ]
}

## MAIN
execute as @e[type=('#'+eTickable)]:
    entityTick()