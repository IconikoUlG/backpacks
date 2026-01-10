
# dataPath: -> string, ex equipment.offhand
# containerString: -> string, ex container.0 / weapon.offhand
# $container = []

$item modify entity @s $(containerString) {function:"minecraft:set_components",components:{"minecraft:container":$(container)}}