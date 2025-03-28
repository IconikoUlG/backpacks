##say function : use_backpack
from @builders import genTickTag, recallableFunction
from @jsons import IM_set_open, IM_set_close, IM_set_inventory, _P_shulker_boxes_check, _P_bundles_check, _P_backpacks_check, P_boxes_check

#say executed: use_backpack

def _inventorySwitch():
    in minecraft:overworld positioned 829999 -64 829999:
        setblock ~ ~ ~ minecraft:barrel replace
        data modify block ~ ~ ~ Items set value []
        setblock ~-1 ~ ~ minecraft:barrel replace
        data modify block ~-1 ~ ~ Items set value []
        data modify block ~ ~ ~ Items set from storage ulg:backpack intick.BackPackInventorySource
        execute positioned ~-1 ~ ~:
            for n in range(27):
                item replace block ~ ~ ~ f"container.{n}" from entity @s f"container.{n+9}"
        data modify storage ulg:backpack intick.BackPackInventory set from block ~-1 ~ ~ Items
        execute :
            for n in range(27):
                item replace entity @s f"container.{n+9}" from block ~ ~ ~ f"container.{n}"
switch_inventory = recallableFunction(_inventorySwitch)

def _fClose():
    data remove storage ulg:backpack intick

    # data modify storage ulg:backpack intick.isLegacyBackpack set from entity @s equipment.offhand.components."minecraft:custom_data".ulg.isLegacyBackpack
    # data modify storage ulg:backpack intick.BackPackName set from entity @s equipment.offhand.components."minecraft:custom_data".display.Name

    data modify storage ulg:backpack intick.BackPackInventorySource set from entity @s equipment.offhand.components."minecraft:custom_data".bp.Inventory
    switch_inventory()

    item modify entity @s weapon.offhand IM_set_close()
    item modify entity @s weapon.offhand IM_set_inventory()

    # set lore
    function ulg:bp/sub/set_lore/exe {dataPath:'equipment.offhand',containerString:"weapon.offhand"}
close = recallableFunction(_fClose)


def _fTryClose():
    if score $NO_BOX_CHEAT ulg_gen matches 1.. run return:
        #say no box cheat check
        if predicate _P_backpacks_check() run title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.nodoublebackpack","color":"#9D6F3D"}
        if predicate _P_bundles_check() run title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.nobundlesinside","color":"#9D6F3D"}
        if predicate _P_shulker_boxes_check() run title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.noshboxesinside","color":"#9D6F3D"}

        unless predicate P_boxes_check() run return:
            close()
        #say not closed, check failed!
    #say no check, just close
    close()
try_close = recallableFunction(_fTryClose)

def _fOpen():
    data remove storage ulg:backpack intick
    data modify storage ulg:backpack intick.BackPackName set from entity @s equipment.offhand.components."minecraft:custom_data".display.Name

    data modify storage ulg:backpack intick.BackPackInventorySource set from entity @s equipment.offhand.components."minecraft:custom_data".bp.Inventory
    switch_inventory()

    item modify entity @s weapon.offhand IM_set_open()
    item modify entity @s weapon.offhand IM_set_inventory()

    #FINALING
    #loot replace entity @s weapon.offhand loot ulg:bp/replace/opened_backpack

    #tag @s add ulg_intick516

    execute unless entity @s[tag=ulg_knowsbackpack] run tellraw @s {"translate":"ulg.alert.checkyourinventory","color":"#ed7666"}
    tag @s[tag=!ulg_knowsbackpack] add ulg_knowsbackpack
open = recallableFunction(_fOpen)


ttag = genTickTag()
if data entity @s equipment.offhand.components."minecraft:custom_data".bp{Opened:false} run tag @s add (ttag)
execute as @s[tag=(ttag)]:
    open()
execute as @s[tag=!(ttag)] if data entity @s equipment.offhand.components."minecraft:custom_data".bp{Opened:true}:
    try_close()
tag @s remove (ttag)