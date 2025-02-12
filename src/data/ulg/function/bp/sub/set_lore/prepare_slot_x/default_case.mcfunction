data modify storage ulg:macro prepare_slot_x.packet.path set string storage ulg:macro prepare_slot_x.packet.id 10

function ulg:bp/sub/set_lore/prepare_slot_x/test_block with storage ulg:macro prepare_slot_x.packet

#execute if score #test_block ulg_intick matches 1 run say modify type to block
execute if score #test_block ulg_intick matches 1 run data modify storage ulg:macro prepare_slot_x.packet.type set value "block"

function ulg:bp/sub/set_lore/prepare_slot_x/set with storage ulg:macro prepare_slot_x.packet