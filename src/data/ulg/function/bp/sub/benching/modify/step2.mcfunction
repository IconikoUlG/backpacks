#say step_2

data modify storage ulg:macro table_modify_s2 set value {idx:0}
data modify storage ulg:macro table_modify_s2.rgb set from storage ulg:macro tick.modify.colorEntry.rgb
data modify storage ulg:macro table_modify_s2.rValue set from storage ulg:macro tick.modify.colorEntry.rgbValues[0]
data modify storage ulg:macro table_modify_s2.gValue set from storage ulg:macro tick.modify.colorEntry.rgbValues[1]
data modify storage ulg:macro table_modify_s2.bValue set from storage ulg:macro tick.modify.colorEntry.rgbValues[2]
data modify storage ulg:macro table_modify_s2.itemGroupId set from storage ulg:macro table_modify.itemGroupId

return run function ulg:bp/sub/benching/modify/m_step2r with storage ulg:macro table_modify_s2