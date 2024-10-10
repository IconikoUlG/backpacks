$execute if data storage ulg:backpack table_modifs.specifics[{item:"$(itemId)",from:$(currentModel)}] run return 1
$execute if data storage ulg:backpack table_modifs.tagged[{item:"$(itemId)",tags:["$(backpackTag)"]}] run return 2
return 0