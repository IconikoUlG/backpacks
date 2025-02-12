$item modify entity @s $(cstring) {\
    "function": "minecraft:set_components", \
    "components": { \
      "minecraft:custom_data": "{bp:{newV:2,Opened:$(opened)b}}", \
      "minecraft:custom_model_data": { \
        "floats": [], \
        "strings": [ \
          "$(string)" \
        ], \
        "colors": $(colors) \
      }, \
      "minecraft:item_model": "$(model)" \
    } \
}

$item modify entity @s $(cstring) ulg:set_backpack_inventory