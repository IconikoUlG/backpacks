# containerString: -> string, ex container.0 / weapon.offhand
# amount: -> int, ex 0,1...27

#say set_macro
#$say on $(containerString) -> amount = $(amount)

$item modify entity @s $(containerString) [\
{"function":"minecraft:set_lore","lore":[[{"translate":"mco.configure.world.slot.empty","fallback":"Empty","color":"gray","italic":false}]],"mode":"replace_section","offset":0,"size":$(size)},\
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