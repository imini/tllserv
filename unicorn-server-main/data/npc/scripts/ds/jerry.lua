local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function returnVials(cid, message, keywords, parameters, node)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	local amount = removePlayerItemsWithCharges(cid, parameters.itemid, parameters.charges)
	if(amount <= 0) then
		npcHandler:say('You don\'t have any empty vials.')
	else
		local price = amount*parameters.cost
		if(doPlayerAddMoney(cid, price) == LUA_NO_ERROR) then
			npcHandler:say('Here you are ' .. price .. ' gold coins.')
		else
			error('[Error] returnVials:', 'Could not give ' .. price .. ' gold coins to player ' .. getPlayerName(cid))
		end
	end
	npcHandler:resetNpc()
	return true
end


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'heavy magic missile rune', 'heavy magic missile rune'}, 	2311, 125, 	5,	'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball rune', 'great fireball rune'}, 		2304, 180, 	2, 	'great fireball rune')
shopModule:addBuyableItem({'ultimate healing rune', 'ultimate healing rune'}, 		2273, 175, 	1, 	'ultimate healing rune')
shopModule:addBuyableItem({'sudden death rune', 'sudden death rune'}, 		2268, 325, 	1, 	'sudden death rune')


local node = keywordHandler:addKeyword({'flask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Allright then.'})



npcHandler:addModule(FocusModule:new())
