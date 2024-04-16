local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'heavy magic missile rune', 'heavy magic missile rune'}, 	2311, 125, 	5,	'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball rune', 'great fireball rune'}, 		2304, 180, 	2, 	'great fireball rune')
shopModule:addBuyableItem({'ultimate healing rune', 'ultimate healing rune'}, 		2273, 175, 	1, 	'ultimate healing rune')
shopModule:addBuyableItem({'sudden death rune', 'sudden death rune'}, 		2268, 325, 	1, 	'sudden death rune')
shopModule:addBuyableItem({'destroy field rune', 'destroy field rune'}, 		2261, 85, 	3, 	'destroy field rune')
shopModule:addBuyableItem({'firebomb rune', 'firebomb rune'}, 		2305, 235, 	2, 	'firebomb rune')
shopModule:addBuyableItem({'antidote rune', 'antidote rune'}, 		2266, 65, 	1, 	'antidote rune')
shopModule:addBuyableItem({'intense healing rune', 'intense healing rune'}, 		2265, 95, 	1, 	'intense healing rune')
shopModule:addBuyableItem({'poisonbomb rune', 'poisonbomb rune'}, 		2286, 170, 	2, 	'poisonbomb rune')
shopModule:addBuyableItem({'magicwall rune', 'magic wall rune'}, 		2293, 350, 	3, 	'magic wall rune')
shopModule:addBuyableItem({'soulfire rune', 'soulfire rune'}, 		2308, 210, 	2, 	'soulfire rune')
shopModule:addBuyableItem({'wand of vortex', 'wand of vortex'}, 		2190, 500, 		'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'wand of dragonbreath'}, 		2191, 1000, 		'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'wand of plague'}, 		2188, 5000, 		'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'wand of cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'wand of inferno'}, 2187,  15000, 'wand of inferno')
shopModule:addBuyableItem({'snakebite rod', 'snakebite rod'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight rod'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic rod'}, 2185, 5000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire rod'}, 2181, 10000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest rod'}, 2183, 15000, 'tempest rod')
shopModule:addBuyableItem({'blank', 'rune'}, 			2260, 10, 		'blank rune')

npcHandler:addModule(FocusModule:new())
