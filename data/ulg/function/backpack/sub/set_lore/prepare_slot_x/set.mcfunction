$data modify storage ulg:macro prepare_slot_x.text set value '[{\
  "translate": "container.shulkerBox.itemCount",\
  "with":[\
  {\
    "translate": "$(type).$(namespace).$(path)",\
    "fallback": "Item"\
    },\
    {"text":"$(count)"}\
    ],\
    "color": "#FFFFFF",\
    "italic": false\
  }\
]'