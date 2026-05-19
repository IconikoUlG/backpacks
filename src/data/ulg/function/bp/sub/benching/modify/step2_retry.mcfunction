scoreboard players set @s ulg_gen -1
title @p[gamemode=!spectator,distance=..6] actionbar {"translate":"ulg.alert.editing","fallback":"Editing: %s","with":["All"]}
return run function ulg:bp/sub/benching/modify/m_step2 with storage ulg:macro table_modify_s2