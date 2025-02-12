#$say custom_name = $(custom_name)
$data modify storage ulg:macro prepare_slot_x.text set value '[\
  {\
    "text": "",\
    "color": "#FFFFFF",\
    "italic": false,\
    "extra":[$(custom_name)]\
  },\
  {\
    "text": " x$(count)",\
    "color": "#FFFFFF",\
    "italic": false\
  }\
]\
'