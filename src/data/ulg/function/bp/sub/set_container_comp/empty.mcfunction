# containerString: -> string, ex container.0 / weapon.offhand

$item modify entity @s $(containerString) {function:"minecraft:set_components",components:{"minecraft:container":[]}}