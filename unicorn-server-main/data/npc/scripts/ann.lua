local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local storyMessage = {}
local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 9 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

        end
            
    end
    return true
    end
    npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	value1 = getPlayerStorageValue(cid,9945) 
	value2 = getPlayerStorageValue(cid,9946) 
	msg = string.lower(msg)
	if value1 == -1 and value2 == -1 and msgcontains(msg,'quest') then
	selfSay('I actually need some help. Could you help me?')
	talk_state = 1
		
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Fine. I am interested in flowers, as you might have noticed on my backyard. Well, there\'s a very special flower which I want the seeds from. Could you obtain it for me if I told you where it was?')
	talk_state = 2
	
	elseif value1 == 1 and value2 == -1 and msgcontains(msg,'quest') or
  value1 == 1 and value2 == -1 and msgcontains(msg,'rose') or
  value1 == 1 and value2 == -1 and msgcontains(msg,'seed') then
	selfSay('Have you collected the seeds from the giant jungle rose in Laudegrance?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,7244) >= 1 then
	setPlayerStorageValue(cid,9946,1)
	doPlayerAddItem(cid,2152,11)
	doPlayerRemoveItem(cid,7244,1)
	selfSay('Thank you. This is a rare plant, and therefore the price of its seeds are high. Take this money as a reward.')
	talk_state = 0
	else
	selfSay('No, you don\'t have them.')
	end
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Good. First, take this jug. You can collect the seeds from the giant jungle rose in it, which is exclusively blooming in Laudegrance. Thereafter, bring it back to me.')
	doPlayerAddItem(cid,7243,1)
	setPlayerStorageValue(cid,9945,1)
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Ah, okay then.')
	talk_state = 0
	
	elseif value1 == 1 and value2 == 1 and msgcontains(msg,'quest') or
  value1 == 1 and value2 == 1 and msgcontains(msg,'rose') or
  value1 == 1 and value2 == 1 and msgcontains(msg,'seed') then
	selfSay('You are finished helping me already.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Well, thanks anyway.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Return to me when you have done that.')
	talk_state = 0

	

end
return true
end

function returnVials(cid, message, keywords, parameters, node)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	local amount = removePlayerItemsWithCharges(cid, parameters.itemid, parameters.charges)
	if(amount <= 0) then
		npcHandler:say('You do not have any.')
	else
		local price = amount*parameters.cost
		if(doPlayerAddMoney(cid, price) == LUA_NO_ERROR) then
			npcHandler:say('Here are your reward of ' .. price .. ' gold coins. It was a pleasure doing business with you.')
		else
			error('[Error] returnVials:', 'Could not give ' .. price .. ' gold coins to player ' .. getPlayerName(cid))
		end
	end
	npcHandler:resetNpc()
	return true
end
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 	2006, 55, 	7,	'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 		2006, 25, 	10, 	'life fluid')
local node = keywordHandler:addKeyword({'flask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Alright then.'})
local node = keywordHandler:addKeyword({'vial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Alright then.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())



