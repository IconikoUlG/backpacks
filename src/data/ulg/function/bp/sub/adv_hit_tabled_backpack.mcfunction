advancement (~/v26_1) {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:player_hurt_entity",
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
advancement (~/v26_2) {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:player_hurt_entity",
      "conditions": {
        "entity": {
          "minecraft:entity_type": "minecraft:interaction",
          "minecraft:nbt": "{Tags:[\"ulg.backpackModifiable.hitbox\"]}"
        }
      }
    }
  },
  "rewards": {
    "function": (~/)
  }
}

##say attack with tabled

execute as @s run tag @s add ulg.intick.target

execute as @s at @s positioned ^ ^ ^2 as @e[tag=ulg.backpackModifiable.hitbox,distance=..2,sort=nearest,limit=1] if data entity @s attack.player at @s run function ulg:bp/sub/benching/hit

advancement revoke @s only (~/v26_1)
advancement revoke @s only (~/v26_2)
execute as @s run tag @s remove ulg.intick.target