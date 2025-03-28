# containerString: -> string, ex container.0 / weapon.offhand
# amount: -> int, ex 0,1...27

##say set_macro
##$say on $(containerString) -> amount = $(amount)

# #say set_macro!
# #say tellrawing lore
# $tellraw @a [$(slot0_text)$(slot1_pre)$(slot1_text)$(slot2_pre)$(slot2_text)$(slot3_pre)$(slot3_text)]

$item modify entity @s $(containerString) [\
{"function":"minecraft:set_lore","lore":[$(slot0_text)$(slot1_pre)$(slot1_text)$(slot2_pre)$(slot2_text)$(slot3_pre)$(slot3_text)],"mode":"replace_section","offset":0,"size":$(size)},\
{\
    "function": "minecraft:copy_custom_data",\
    "source": {\
      "type": "minecraft:storage",\
      "source": "ulg:macro"\
    },\
    "ops": [\
      {\
        "source": "set_lore.packet.newSize",\
        "target": "bp.loreSize",\
        "op": "replace"\
      }\
    ]\
  }\
]