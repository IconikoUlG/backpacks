$data modify storage ulg:macro prepare_slot_x.text set value '[{\
  type: "translatable",\
  translate: "ulg.lore.item_row",\
  with:[\
  {\
    translate: "$(type).$(namespace).$(path)",\
    fallback: "Item"\
    },\
    {text:"$(count)"}\
    ],\
    color: "#FFFFFF",\
    italic: false\
  }\
]'