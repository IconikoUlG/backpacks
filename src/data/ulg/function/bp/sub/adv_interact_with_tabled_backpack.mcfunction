advancement (~/v26_3) {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:player_interacted_with_entity",
      "conditions": {
         "entity": {
            "type": "minecraft:entity_properties",
            "entity": "this",
            "predicate": {
              "minecraft:entity_type": "minecraft:interaction",
              "minecraft:nbt": "{Tags:[\"ulg.backpackModifiable.hitbox\"]}"
            }
        }
      }
    }
  },
  "rewards": {
    "function": (~/)
  }
}

##say interact with tabled

execute as @s run tag @s add ulg.intick.target

execute as @s at @s positioned ^ ^ ^2 as @e[tag=ulg.backpackModifiable.hitbox,distance=..2,sort=nearest,limit=1] if data entity @s interaction.player at @s run function ulg:bp/sub/benching/interaction

advancement revoke @s only (~/v26_3)

execute as @s run tag @s remove ulg.intick.target