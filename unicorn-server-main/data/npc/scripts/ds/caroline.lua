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
	
	value0 = getPlayerStorageValue(cid,9653)
  value1 = getPlayerStorageValue(cid,9654)
  value2 = getPlayerStorageValue(cid,9655)
  msg = string.lower(msg)
  if msgcontains(msg,'spider silk yarn') and value0 == -1 or
  msgcontains(msg,'spool of yarn') and value0 == -1 then
  selfSay('I do create spools of yarn out of spider silk yarn. I can make one for you too, but you will have to make me a favour first.')
  talk_state = 1
  
  elseif talk_state == 1 and msgcontains(msg,'favour') then
  selfSay('If you get me 50 honeycombs which I can use as glue incase my feather from my hat happens to come loose I will thereafter make you spools of yarn for giant spider silk. Is this fine with you?')
  talk_state = 2
  
  elseif talk_state == 2 and msgcontains(msg,'no') then
  selfSay('Then I can\'t help you, I\'m afraid.')
  talk_state = 0
  
  elseif talk_state == 2 and msgcontains(msg,'yes') then
  selfSay('Good. Then return to me when you have the 50 honeycombs.')
  setPlayerStorageValue(cid,9653,1)
  setPlayerStorageValue(cid,9654,1)
  talk_state = 0
  
  elseif msgcontains(msg,'spider silk yarn') and value1 == 1 or
  msgcontains(msg,'honeycomb') and value1 == 1 or
  msgcontains(msg,'mission') and value1 == 1 or
  msgcontains(msg,'spool of yarn') and value1 == 1 then
  selfSay('Have you obtained 50 honeycombs for me?')
  talk_state = 3
  
  elseif talk_state == 3 and msgcontains(msg,'no') then
  selfSay('Come back later when you have them then.')
  talk_state = 0
  
  elseif talk_state == 3 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5902) >= 50 then
  doPlayerRemoveItem(cid,5902,50)
  npcHandler:say('Thank you. Now, just bring me 10 giant spider silks and I will happily turn them into a spool of yarn.')
  setPlayerStorageValue(cid,9654,-1)
  setPlayerStorageValue(cid,9655,1)
  talk_state = 0
  else
  selfSay('Come back when you actually have the 50 honeycombs I requested.')
  talk_state = 0
  end
  
  elseif msgcontains(msg,'giant spider silk') and value2 == 1 or
  msgcontains(msg,'spool of yarn') and value2 == 1 then
  selfSay('Have you brought 10 giant spider silks which you want me to turn into a spool of yarn?')
  talk_state = 4
  
  elseif talk_state == 4 and msgcontains(msg,'no') then
  selfSay('No? Alright, then.')
  talk_state = 0
  
  elseif talk_state == 4 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5879) >= 10 then
  doPlayerRemoveItem(cid,5879,10)
  doPlayerAddItem(cid,5886,1)
  npcHandler:say('Deal!')
  talk_state = 0
  else
  talk_state = 0
  selfSay('You don\'t have the giant spider silks.')
  end
  

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
