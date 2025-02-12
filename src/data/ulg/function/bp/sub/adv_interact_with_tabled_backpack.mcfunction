advancement (~/) {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:player_interacted_with_entity",
      "conditions": {
        "entity": {
          "type": "minecraft:interaction",
          "nbt": "{Tags:[\"ulg.backpackModifiable.hitbox\"]}"
        }
      }
    }
  },
  "rewards": {
    "function": (~/)
  }
}

#say interact with tabled

execute as @s run tag @s add ulg.intick.target

execute as @s at @s positioned ^ ^ ^2 as @e[tag=ulg.backpackModifiable.hitbox,distance=..2,sort=nearest,limit=1] if data entity @s interaction.player at @s run function ulg:bp/sub/benching/try_on_interaction

advancement revoke @s only (~/)
execute as @s run tag @s remove ulg.intick.target