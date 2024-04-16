local QUEST = 1
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end




function greetCallback(cid)
	if(getPlayerStorageValue(cid,4311) == QUEST) then
		return true
	else
		return false
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'Greetings, human. What can I do for you?')




npcHandler:addModule(FocusModule:new())

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- You can buy
shopModule:addBuyableItem({'war hammer', 'war hammer'}, 		2391, 10000, 	1, 	'war hammer')
shopModule:addBuyableItem({'spike sword', 'spike sword'}, 		2383, 8000, 	1, 	'spike sword')
shopModule:addBuyableItem({'noble armor', 'noble armor'}, 		2486, 8000, 	1, 	'noble armor')
shopModule:addBuyableItem({'beholder shield', 'beholder shield'}, 		2518, 7000, 	1, 	'beholder shield')


-- You can sell
shopModule:addSellableItem({'dragon lance', 'dragon lance'}, 		2414, 9000, 	'dragon lance')
shopModule:addSellableItem({'fire axe', 'fire axe'}, 		2432, 8000, 	'fire axe')
shopModule:addSellableItem({'fire sword', 'fire sword'}, 		2392, 4000, 	'fire sword')
shopModule:addSellableItem({'war hammer', 'war hammer'}, 		2391, 1200, 	'war hammer')
shopModule:addSellableItem({'spike sword', 'spike sword'}, 		2383, 1000, 	'spike sword')
shopModule:addSellableItem({'ice rapier', 'ice rapier'}, 		2396, 1000, 	'ice rapier')
shopModule:addSellableItem({'broad sword', 'broad sword'}, 		2413, 500, 	'broad sword')
shopModule:addSellableItem({'obsidian lance', 'obsidian lance'}, 		2425, 500, 	'obsidian lance')
shopModule:addSellableItem({'crown armor', 'crown armor'}, 		2487, 1200, 	'crown armor')
shopModule:addSellableItem({'blue robe', 'blue robe'}, 		2656, 1000, 	'blue robe')
shopModule:addSellableItem({'noble armor', 'noble armor'}, 		2486, 900, 	'noble armor')
shopModule:addSellableItem({'royal helmet', 'royal helmet'}, 		2498, 30000, 	'royal helmet')
shopModule:addSellableItem({'crusader helmet', 'crusader helmet'}, 		2497, 6000, 	'crusader helmet')
shopModule:addSellableItem({'crown helmet', 'crown helmet'}, 		2491, 2500, 	'crown helmet')
shopModule:addSellableItem({'crown legs', 'crown legs'}, 		2488, 12000, 	'crown legs')
shopModule:addSellableItem({'boots of haste', 'boots of haste'}, 		2195, 30000, 	'boots of haste')
shopModule:addSellableItem({'phoenix shield', 'phoenix shield'}, 		2539, 16000, 	'phoenix shield')
shopModule:addSellableItem({'crown shield', 'crown shield'}, 		2519, 8000, 	'crown shield')
shopModule:addSellableItem({'dragon shield', 'dragon shield'}, 		2516, 4000, 	'dragon shield')
shopModule:addSellableItem({'guardian shield', 'guardian shield'}, 		2515, 2000, 	'guardian shield')
shopModule:addSellableItem({'beholder shield', 'beholder shield'}, 		2518, 1200, 	'beholder shield')
npcHandler:addModule(FocusModule:new())
