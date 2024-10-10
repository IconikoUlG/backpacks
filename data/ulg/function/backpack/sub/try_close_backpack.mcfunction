#say function : try_close_backpack

execute if predicate ulg:bp_tryclose/backpacks_check run title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.nodoublebackpack","color":"#9D6F3D"}
execute if predicate ulg:bp_tryclose/bundles_check run title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.nobundlesinside","color":"#9D6F3D"}
execute if predicate ulg:bp_tryclose/shboxes_check run title @s[tag=!global.ignore.gui] actionbar {"translate":"ulg.alert.noshboxesinside","color":"#9D6F3D"}

execute unless predicate ulg:bp_tryclose/backpacks_check \
unless predicate ulg:bp_tryclose/bundles_check \
unless predicate ulg:bp_tryclose/shboxes_check \
run function ulg:backpack/sub/close_backpack
