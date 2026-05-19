from @util/builders import wrap
from bolt_expressions import Data
from @jsons import P_is_sneaking
from @backpacks/lock import setOwner, checkOwner #, fCheckOwnerIfSuperYes

@wrap(~/interact)
def interact(): # the return from this function changes the behaviour
    player = Data.entity('@a[tag=ulg.intick.target,limit=1]')
    this = Data.entity('@s')
    #say interaction
    execute unless data entity @a[tag=ulg.intick.target,limit=1] SelectedItem run return fail
    if player.SelectedItem.components."minecraft:custom_data".ulg.item_id == "bp/lock":
        if score $LOCK_BACKPACKS ulg_gen matches 0 run return fail
    
    if player.SelectedItem.components."minecraft:custom_data".ulg.item_id == "bp/lock":
        return:
            if this.equipment.head.components."minecraft:custom_data".bp.Owner:
                return run title @a[tag=ulg.intick.target,limit=1] actionbar {"translate": "ulg.alert.already_owned", "fallback": "This backpack is already owned!", "color": "#ff1e00"}
            setOwner(this.equipment.head,player,'@a[tag=ulg.intick.target,limit=1]')
            title @a[tag=ulg.intick.target,limit=1] actionbar {"translate": "ulg.alert.owner_set", "fallback": "Owner set! Now only you can open this backpack", "color": "#00ff15"}
            playsound minecraft:ui.cartography_table.take_result master @a[tag=ulg.intick.target,limit=1]
            clear @a[tag=ulg.intick.target,gamemode=!creative,limit=1] minecraft:gold_nugget[minecraft:custom_data={ulg:{item_id:"bp/lock"}}] 1
            particle minecraft:wax_on ~ ~ ~ 0.3 0.3 0.3 0.5 15

    if score $CAN_MODIFY_BACKPACKS ulg_gen matches 0 run return fail
    if checkOwner(Data.entity('@s').equipment.head,Data.entity('@a[tag=ulg.intick.target,limit=1]')) == false:
        return run title @a[tag=ulg.intick.target,limit=1] actionbar {"translate": "ulg.alert.not_yours", "fallback": "This backpack is not yours!", "color": "#ff1e00"}

    vars = Data.storage(ulg:macro).table_modify
    vars = {
        no_consume:false,  doSelect:false, isVirgin:true, didModify:false, didSelect:false,
        itemId:player.SelectedItem.id,
        itemCount:player.SelectedItem.count,
        currentModel:this.equipment.head.components."minecraft:item_model",
        # itemComponents = player.SelectedItem.components
    }
    if entity @p[tag=ulg.intick.target,predicate=(P_is_sneaking())]:
        vars.doSelect = true
    if this.equipment.head.components."minecraft:custom_data".bp.dirty:
        vars.isVirgin = false

    #say calling step0
    return run function ulg:bp/sub/benching/modify/m_step0 with storage ulg:macro table_modify

from @jsons import P_is_sneaking
from ./remove import discard

@wrap(~/noaction)
def noaction():
    # unless function (fCheckOwnerIfSuperYes) run return run title @a[tag=ulg.intick.target,limit=1] actionbar {"translate": "ulg.alert.not_yours", "fallback": "This backpack is not yours!", "color": "#ff1e00"}
    if entity @p[tag=ulg.intick.target,predicate=(P_is_sneaking())] unless data entity @p[tag=ulg.intick.target] equipment.offhand.id:
        # direct equip
        item replace entity @p weapon.offhand from entity @s armor.head
        discard()
        

#say tryoninteraction

data modify storage ulg:backpack intick.check set from entity @s interaction.player
scoreboard players set @s ulg_intick -1
execute store result score @s ulg_intick run data modify storage ulg:backpack intick.check set from entity @a[tag=ulg.intick.target,limit=1] UUID
if score @s ulg_intick matches 0 if entity @a[tag=ulg.intick.target] at @s as @e[tag=ulg.backpackModifiable,sort=nearest,limit=1] at @s unless function (~/interact) run function (~/noaction)

data modify entity @s interaction set value {}