# Retrieve Original RGB Value
$execute store result score $OGrgb ulg_intick run data get entity @s ArmorItems[3].components."minecraft:custom_model_data".colors[$(idx)]

# Retrieve Force
execute store result score $force ulg_intick run data get storage ulg:macro tick.modify.colorEntry.force
execute if data storage ulg:macro table_modify{isVirgin:true} run scoreboard players set $force ulg_intick 100

# Clamp Force Between 0 and 100
execute if score $force ulg_intick > #100 ulg_gen run scoreboard players set $force ulg_intick 100
execute if score $force ulg_intick < #0 ulg_gen run scoreboard players set $force ulg_intick 0

# Extract Red Component
scoreboard players operation $red ulg_intick = $OGrgb ulg_intick
scoreboard players operation $red ulg_intick /= #65536 ulg_gen
scoreboard players operation $red ulg_intick %= #256 ulg_gen

# Extract Green Component
scoreboard players operation $green ulg_intick = $OGrgb ulg_intick
scoreboard players operation $green ulg_intick /= #256 ulg_gen
scoreboard players operation $green ulg_intick %= #256 ulg_gen

# Extract Blue Component
scoreboard players operation $blue ulg_intick = $OGrgb ulg_intick
scoreboard players operation $blue ulg_intick %= #256 ulg_gen

# Set Target Values
$scoreboard players set $dRed ulg_intick $(rValue)
$scoreboard players set $dGreen ulg_intick $(gValue)
$scoreboard players set $dBlue ulg_intick $(bValue)

# Debug Original and Target Values
#$say Target RGB: R=$(rValue), G=$(gValue), B=$(bValue)

# Red Channel Lerp
scoreboard players operation $temp ulg_intick = $dRed ulg_intick
scoreboard players operation $temp ulg_intick -= $red ulg_intick
scoreboard players operation $temp ulg_intick *= $force ulg_intick
scoreboard players operation $temp ulg_intick /= #100 ulg_gen
scoreboard players operation $resultRed ulg_intick = $red ulg_intick
scoreboard players operation $resultRed ulg_intick += $temp ulg_intick
scoreboard players operation $resultRed ulg_intick %= #256 ulg_gen

# Green Channel Lerp
scoreboard players operation $temp ulg_intick = $dGreen ulg_intick
scoreboard players operation $temp ulg_intick -= $green ulg_intick
scoreboard players operation $temp ulg_intick *= $force ulg_intick
scoreboard players operation $temp ulg_intick /= #100 ulg_gen
scoreboard players operation $resultGreen ulg_intick = $green ulg_intick
scoreboard players operation $resultGreen ulg_intick += $temp ulg_intick
scoreboard players operation $resultGreen ulg_intick %= #256 ulg_gen

# Blue Channel Lerp
scoreboard players operation $temp ulg_intick = $dBlue ulg_intick
scoreboard players operation $temp ulg_intick -= $blue ulg_intick
scoreboard players operation $temp ulg_intick *= $force ulg_intick
scoreboard players operation $temp ulg_intick /= #100 ulg_gen
scoreboard players operation $resultBlue ulg_intick = $blue ulg_intick
scoreboard players operation $resultBlue ulg_intick += $temp ulg_intick
scoreboard players operation $resultBlue ulg_intick %= #256 ulg_gen

# Combine into Packed RGB Value
scoreboard players operation $packedResult ulg_intick = $resultRed ulg_intick
scoreboard players operation $packedResult ulg_intick *= #65536 ulg_gen
scoreboard players operation $temp ulg_intick = $resultGreen ulg_intick
scoreboard players operation $temp ulg_intick *= #256 ulg_gen
scoreboard players operation $packedResult ulg_intick += $temp ulg_intick
scoreboard players operation $packedResult ulg_intick += $resultBlue ulg_intick
scoreboard players operation $packedResult ulg_intick %= #2147483647 ulg_gen

# Store Packed RGB Result
execute store result storage ulg:macro table_modify.lastRgbResult int 1 run scoreboard players get $packedResult ulg_intick

# Apply Packed RGB to Item
$execute store result entity @s ArmorItems[3].components."minecraft:custom_model_data".colors[$(idx)] int 1 run scoreboard players get $packedResult ulg_intick