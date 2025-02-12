$data modify storage ulg:macro prepare_slot_x.item set from storage ulg:macro set_lore.item.components."minecraft:custom_data".bp.Inventory[$(x)]
function ulg:bp/sub/set_lore/prepare_slot_x/exe
$data modify storage ulg:macro set_lore.packet.slot$(x)_text set from storage ulg:macro prepare_slot_x.text
$data modify storage ulg:macro set_lore.packet.slot$(x)_pre set value ","
return 1