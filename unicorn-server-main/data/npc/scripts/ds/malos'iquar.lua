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
	if(getPlayerStorageValue(cid,4321) == QUEST) then
		return true
	else
		return false
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'Okay, human. What is it that you want me?')




npcHandler:addModule(FocusModule:new())

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- You can buy
shopModule:addBuyableItem({'ice rapier', 'ice rapier'}, 		2396, 5000, 	1, 	'ice rapier')
shopModule:addBuyableItem({'serpent sword', 'serpent sword'}, 		2409, 6000, 	1, 	'serpent sword')
shopModule:addBuyableItem({'dark Armor', 'dark Armor'}, 		2489, 1500, 	1, 	'dark Armor')
shopModule:addBuyableItem({'dark helmet', 'dark helmet'}, 		2490, 1000, 	1, 	'dark helmet')
shopModule:addBuyableItem({'ancient shield', 'ancient shield'}, 		2532, 5000, 	1, 	'ancient shield')


-- You can sell
shopModule:addSellableItem({'Scimitar', 'Scimitar'}, 		2419, 150, 	'Scimitar')
shopModule:addSellableItem({'Giant Sword', 'Giant Sword'}, 		2393, 17000, 	'Giant Sword')
shopModule:addSellableItem({'Serpent Sword', 'Serpent Sword'}, 		2409, 900, 	'Serpent Sword')
shopModule:addSellableItem({'Poison Dagger', 'Poison Dagger'}, 		2411, 50, 	'Poison Dagger')
shopModule:addSellableItem({'Knight Axe', 'Knight Axe'}, 		2430, 2000, 	'Knight Axe')
shopModule:addSellableItem({'Dragon Hammer', 'Dragon Hammer'}, 		2434, 2000, 	'Dragon Hammer')
shopModule:addSellableItem({'Skull Staff', 'Skull Staff'}, 		2436, 6000, 	'Skull Staff')
shopModule:addSellableItem({'Dark Armor', 'Dark Armor'}, 		2489, 400, 	'Dark Armor')
shopModule:addSellableItem({'Knight Armor', 'Knight Armor'}, 		2476, 5000, 	'Knight Armor')
shopModule:addSellableItem({'Dark Helmet', 'Dark Helmet'}, 		2490, 250, 	'Dark Helmet')
shopModule:addSellableItem({'Warrior Helmet', 'Warrior Helmet'}, 		2475, 5000, 	'Warrior Helmet')
shopModule:addSellableItem({'Strange Helmet', 'Strange Helmet'}, 		2479, 500, 	'Strange Helmet')
shopModule:addSellableItem({'Mystic Turban', 'Mystic Turban'}, 		2663, 150, 	'Mystic Turban')
shopModule:addSellableItem({'Knight Legs', 'Knight Legs'}, 		2477, 5000, 	'Knight Legs')
shopModule:addSellableItem({'Tower Shield', 'Tower Shield'}, 		2528, 8000, 	'Tower Shield')
shopModule:addSellableItem({'Black Shield', 'Black Shield'}, 		2529, 800, 	'Black Shield')
shopModule:addSellableItem({'Ancient Shield', 'Ancient Shield'}, 		2532, 900, 	'Ancient Shield')
shopModule:addSellableItem({'Vampire Shield', 'Vampire Shield'}, 		2534, 15000, 	'Vampire Shield')
npcHandler:addModule(FocusModule:new())
