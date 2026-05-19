$execute if data storage ulg:macro table_modify{didModify:true} run clear @a[gamemode=!creative,tag=ulg.intick.target,limit=1] $(itemId) 1
execute if data storage ulg:macro table_modify{didModify:true} at @s run playsound minecraft:item.dye.use block @a[distance=..10] ~ ~ ~ 0.5 0.5

##say step3 completed
##$say step3 completed, lastRgbResult = $(lastRgbResult)

execute if data storage ulg:macro table_modify{didModify:true} run data modify entity @s equipment.head.components."minecraft:custom_data".bp.dirty set value 1b

return 1