$item modify entity @s armor.head {\
    "function": "minecraft:set_components", \
    "components": { \
      "minecraft:custom_data": "{bp:{newV:2,Opened:false}}", \
      "minecraft:custom_model_data": { \
        "floats": [], \
        "strings": [ \
          "closed" \
        ], \
        "colors": $(colors) \
      }, \
      "minecraft:item_model": "$(model)" \
    } \
}

item modify entity @s armor.head ulg:set_backpack_inventory