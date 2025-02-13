from @builders import load
import @configs as configs

function_tag minecraft:load {"values": [(~/)]}

def fSetup():
    configs.load()

load('BP_VERSION', 25, fSetup)

scoreboard players set #65536 ulg_gen 65536
scoreboard players set #256 ulg_gen 256
scoreboard players set #100 ulg_gen 100

data merge storage ulg:backpack {false:false,true:true,intick:{},first_lore_size:1}
scoreboard objectives add ulg_bp_coas minecraft.used:minecraft.carrot_on_a_stick
execute in minecraft:overworld run forceload add 829999 829999
forceload add 829999 829999