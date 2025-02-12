$clear @a[tag=ulg.intick.target,limit=1] $(itemId) 1

#say step3 completed
#$say step3 completed, lastRgbResult = $(lastRgbResult)

data modify entity @s ArmorItems[3].components."minecraft:custom_data".bp.dirty set value 1b

return 1