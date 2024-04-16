local QUEST = 1
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()

    end
-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

------------------------------------
msg = string.lower(msg)
	if msgcontains(msg, 'magic sulphur') then
			selfSay('Do you want to trade one magic sulphur for 3 fire swords?')
			talk_state = 1
			
			elseif talk_state == 1 and msgcontains(msg,'no') then
			selfSay('Very well.')
			talk_state = 0
			
			elseif talk_state == 1 and msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,2392) >= 3 then
			doPlayerTakeItem(cid,2392,3)
			doPlayerAddItem(cid,5904,1)
			selfSay('And here it is!')
			talk_state = 0
			else
			selfSay('You don\'t have enough fire swords.')
			talk_state = 0
end


	elseif msgcontains(msg, 'enchanted chicken wing') then
			selfSay('Do you want to trade one enchanted chicken wing for one pair of boots of haste?')
			talk_state = 2
			
			elseif talk_state == 2 and msgcontains(msg,'no') then
			selfSay('Very well, that\'s your loss.')
			talk_state = 0
			
			elseif talk_state == 2 and msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,2195) >= 1 then
			doPlayerTakeItem(cid,2195,1)
			doPlayerAddItem(cid,5891,1)
			selfSay('One enchanted chicken wing for you, as you wish!')
			talk_state = 0
			else
			selfSay('Come back when you have the boots of haste for me.')
			talk_state = 0
end

------------------------------------

	elseif msgcontains(msg, 'sweat') then
			selfSay('Do you want to trade one bottle of warrior\'s sweat for 4 warrior helmet\'s?')
			talk_state = 3
			
			elseif talk_state == 3 and msgcontains(msg,'no') then
			selfSay('Hm, maybe next time.')
			talk_state = 0
			
			elseif talk_state == 3 and msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,2475) >= 4 then
			doPlayerTakeItem(cid,2475,4)
			doPlayerAddItem(cid,5885,1)
			selfSay('Here you are.')
			talk_state = 0
			else
			selfSay('Sorry you don\'t have enough warrior helmet\'s for me.')
			talk_state = 0
end
------------------------------------

		elseif msgcontains(msg, 'fighting spirit') then
			selfSay('Do you want to trade one flask of fighting spirit for 2 royal helmet\'s?')
			talk_state = 4
			
			elseif talk_state == 4 and msgcontains(msg,'no') then
			selfSay('How can I help you then?')
			talk_state = 0
			
			elseif talk_state == 4 and msgcontains(msg,'yes') then
		  if getPlayerItemCount(cid,2498)  >= 2 then
			doPlayerTakeItem(cid,2498,2)
			doPlayerAddItem(cid,4839,1)
			selfSay('Here you go.')
			else
		  selfSay('Sorry, you don\'t have the royal helmets.')
			talk_state = 0
end

end
return true
end
function greetCallback(cid)
	if(getPlayerStorageValue(cid,4311) == QUEST) then
		return true
	else
		return false
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'Welcome, human. What can I do for you?')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)



local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- You can buy
shopModule:addBuyableItem({'sword ring', 'sword ring'}, 		2207, 500, 	1, 	'sword ring')
shopModule:addBuyableItem({'club ring', 'club ring'}, 		2209, 500, 	1, 	'club ring')
shopModule:addBuyableItem({'axe ring', 'axe ring'}, 		2208, 500, 	1, 	'axe ring')
shopModule:addBuyableItem({'power ring', 'power ring'}, 		2166, 100, 	1, 	'power ring')
shopModule:addBuyableItem({'stealth ring', 'stealth ring'}, 		2165, 5000, 	1, 	'stealth ring')
shopModule:addBuyableItem({'stone skin amulet', 'stone skin amulet'}, 		2197, 5000, 	1, 	'stone skin amulet')
shopModule:addBuyableItem({'elven amulet', 'elven amulet'}, 		2198, 500, 	1, 	'elven amulet')
shopModule:addBuyableItem({'bronze amulet', 'bronze amulet'}, 		2172, 100, 	1, 	'bronze amulet')
shopModule:addBuyableItem({'garlic necklace', 'garlic necklace'}, 		2199, 100, 	1, 	'garlic necklace')


-- You can sell
shopModule:addSellableItem({'sword ring', 'sword ring'}, 		2207, 100, 	'sword ring')
shopModule:addSellableItem({'club ring', 'club ring'}, 		2209, 100, 	'club ring')
shopModule:addSellableItem({'axe ring', 'axe ring'}, 		2208, 100, 	'axe ring')
shopModule:addSellableItem({'power ring', 'power ring'}, 		2166, 50, 	'power ring')
shopModule:addSellableItem({'stealth ring', 'stealth ring'}, 		2165, 200, 	'stealth ring')
shopModule:addSellableItem({'stone skin amulet', 'stone skin amulet'}, 		2197, 500, 	'stone skin amulet')
shopModule:addSellableItem({'elven amulet', 'elven amulet'}, 		2198, 100, 	'elven amulet')
shopModule:addSellableItem({'bronze amulet', 'bronze amulet'}, 		2172, 50, 	'bronze amulet')
shopModule:addSellableItem({'garlic necklace', 'garlic necklace'}, 		2199, 50, 	'garlic necklace')
shopModule:addSellableItem({'magic light Wand', 'magic light wand'}, 		2162, 35, 	'magic light wand')
shopModule:addSellableItem({'wand of vortex', 'wand of vortex'}, 		2190, 100, 	'wand of vortex')
shopModule:addSellableItem({'wand of dragonbreath', 'wand of dragonbreath'}, 		2191, 200, 	'wand of dragonbreath')
shopModule:addSellableItem({'wand of plague', 'wand of plague'}, 		2188, 1000, 	'wand of plague')
shopModule:addSellableItem({'wand of cosmic energy', 'wand of cosmic energy'}, 		2189, 2000, 	'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno', 'wand of inferno'}, 		2187, 3000, 	'wand of inferno')
shopModule:addSellableItem({'orb', 'orb'}, 		5944, 750, 	'orb')
shopModule:addSellableItem({'mind stone', 'mind stone'}, 		4852, 100, 	'mind stone')
shopModule:addSellableItem({'life crystal', 'life crystal'}, 		7242, 50, 	'life crystal')
npcHandler:addModule(FocusModule:new())
