from ../../../jsons import _P_shulker_boxes_check, _P_bundles_check, _P_backpacks_check, P_boxes_check

if score $NO_BOX_CHEAT ulg_gen matches 1.. if predicate P_boxes_check() run return:
    #say boxes_check is true
    if predicate _P_backpacks_check() run return run function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/switch_hands_macro {command:'title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.nodoublebackpack","color":"#9D6F3D"}'}
    if predicate _P_bundles_check() run return run function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/switch_hands_macro {command:'title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.nobundlesinside","color":"#9D6F3D"}'}
    if predicate _P_shulker_boxes_check() run return run function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/switch_hands_macro {command:'title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.noshboxesinside","color":"#9D6F3D"}'}

function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/auto_close_macro with storage ulg:macro auto_close