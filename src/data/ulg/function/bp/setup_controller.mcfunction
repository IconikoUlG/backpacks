from @util/builders import load
import @configs as configs
import @backpacks/access as backpacks

from @configs import CURRENT_VERSION_FULLSTR, CURRENT_VERSION_STR, CURRENT_VERSION, BETA_NUMBER

def fPreSetup():
    pass

def fSetup():
    configs.load()
    TINFO = {main_variants: [], all: []}
    for bp in backpacks.getMainVariants():
        TINFO["main_variants"].append({id: bp.Id(),translation: bp.Translation(),fallback: bp.FallbackName()})
    for bp in backpacks.getAll():
        TINFO["all"].append({id: bp.Id(),translation: bp.Translation(),fallback: bp.FallbackName()})
    data modify storage ulg:backpack intick.tinfo set value (TINFO)

def fFirstSetup():
    tellraw @a [{"text":"--- ","bold":true,"color":"#FFC000"},{"text":f"[Working Backpacks {CURRENT_VERSION_STR}]","bold":true,"color":"#FFFF00"},{"text":" ---","bold":true,"color":"#FFC000"},{"text":" \n"},{"translate":"ulg.bp.ad.installed","fallback":"was installed correctly\nStay tuned for updates! \u0020","color":"#FFC000"},{"text":"UltroGhast©","color":"yellow"}]

def fNextSetup():
    tellraw @a [{"text":"--- ","bold":true,"color":"#FFC000"},{"text":"[Working Backpacks]","bold":true,"color":"#FFFF00"},{"text":" ---","bold":true,"color":"#FFC000"},{"text":" \n"},{"translate":"ulg.bp.ad.updated","fallback":"was updated to version ","color":"#FFC000"},{"text":f"{CURRENT_VERSION_STR}","bold":true,"color":"#FFFF00","underlined":true,"hover_event":{"action":"show_text","value":f"{CURRENT_VERSION_FULLSTR}"}}]
def fPostSetup():
    data modify storage ulg:backpack info set from storage ulg:backpack intick.tinfo
    tellraw @a {"translate":"ulg.bp.empty","fallback":"Remember to update the required Resources as well","color":"red","bold":true}
    tellraw @a [{"text":"\n- ","color":"#FFC000"},{"translate":"ulg.bp.ad.help","fallback":"HELP","bold":true,"underlined":true,"color":"red","click_event":{"action":"open_url","url":"https://sites.google.com/view/ultroghasthub/datapacks/backpacks"}},{"text":" - ","color":"#FFC000"},{"text":"WIKI","bold":true,"underlined":true,"color":"aqua","click_event":{"action":"open_url","url":"https://sites.google.com/view/ultroghasthub/datapacks/backpacks"}},{"text":" - ","color":"#FFC000"},{"translate":"ulg.bp.ad.donate","fallback":"DONATE","bold":true,"italic":true,"underlined":true,"color":"gold","click_event":{"action":"open_url","url":"https://paypal.me/coradonation"}},{"text":" -","color":"#FFC000"}]
    if BETA_NUMBER in range(1,99):
        tellraw @a ["",{"text":"Backpacks & More","bold":true,"color":"yellow"},{"text":" - BETA","bold":true,"color":"gold"},{"text":"\nThis version of the 'Backpacks&More' datapack is experimental.\n\nCheck "},{"text":"HERE","underlined":true,"color":"green","clickEvent":{"action":"open_url","value":"https://modrinth.com/datapack/backpacksdp"}},{"text":" for the stable versions and updates.\n\n"},{"text":"Report any bug to my","color":"gold"},{"text":" ","color":"green"},{"text":"Discord","color":"blue","clickEvent":{"action":"open_url","value":"https://discord.com/invite/Q9xpaCtxGs"}},{"text":"\n"},{"text":"Thx a lot -UltroGhast","color":"yellow"}]


load('BP_VERSION', CURRENT_VERSION, fSetup, fFirstSetup, fNextSetup, fPreSetup, fPostSetup)

#[{text:"- "},{translate:"ulg.bp.ad.help",fallback:"HELP",bold:1,underlined:1,color:"red"},{text:" - "},{text:"WIKI",bold:1,underlined:1,color:"aqua"},{text:" - "},{text:"Custom backpacks!",bold:1,italic:1,underlined:1,color:"gold"},{text:" -"}]

# #ffc000

#["",{"text":"- ","color":"#FFC000"},{"translate":"ulg.bp.ad.help","fallback":"HELP","bold":true,"underlined":true,"color":"red","clickEvent":{"action":"open_url","url":"https://sites.google.com/view/ultroghasthub/datapacks/backpacks"}},{"text":" - ","color":"#FFC000"},{"text":"WIKI","bold":true,"underlined":true,"color":"aqua","clickEvent":{"action":"open_url","url":"https://sites.google.com/view/ultroghasthub/datapacks/backpacks"}},{"text":" - ","color":"#FFC000"},{"translate":"ulg.bp.ad.custom_backpacks","fallback":"Custom backpacks!","bold":true,"italic":true,"underlined":true,"color":"gold","clickEvent":{"action":"open_url","url":"https://sites.google.com/view/ultroghasthub/datapacks/backpacks/customize"}},{"text":" -","color":"#FFC000"}]