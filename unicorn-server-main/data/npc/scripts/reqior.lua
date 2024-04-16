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
	if(getPlayerStorageValue(cid,4321) == QUEST) then
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
shopModule:addBuyableItem({'might ring', 'might ring'}, 		2164, 5000, 	1, 	'might ring')
shopModule:addBuyableItem({'energy ring', 'energy ring'}, 		2167, 2000, 	1, 	'energy ring')
shopModule:addBuyableItem({'life ring', 'life ring'}, 		2168, 900, 	1, 	'life ring')
shopModule:addBuyableItem({'time ring', 'time ring'}, 		2169, 2000, 	1, 	'time ring')
shopModule:addBuyableItem({'dwarven ring', 'dwarven ring'}, 		2213, 200, 	1, 	'dwarven ring')
shopModule:addBuyableItem({'ring of healing', 'ring of healing'}, 		2214, 2000, 	1, 	'ring of healing')
shopModule:addBuyableItem({'strange talisman', 'strange talisman'}, 		2161, 100, 	1, 	'strange talisman')
shopModule:addBuyableItem({'silver amulet', 'silver amulet'}, 		2170, 100, 	1, 	'silver amulet')
shopModule:addBuyableItem({'protection amulet', 'protection amulet'}, 		2200, 700, 	1, 	'protection amulet')
shopModule:addBuyableItem({'dragon necklace', 'dragon necklace'}, 		2201, 1000, 	1, 	'dragon necklace')

-- You can sell
shopModule:addSellableItem({'might ring', 'might ring'}, 		2164, 250, 	'might ring')
shopModule:addSellableItem({'energy ring', 'energy ring'}, 		2167, 100, 	'energy ring')
shopModule:addSellableItem({'life ring', 'life ring'}, 		2168, 50, 	'life ring')
shopModule:addSellableItem({'time ring', 'time ring'}, 		2169, 100, 	'time ring')
shopModule:addSellableItem({'dwarven ring', 'dwarven ring'}, 		2213, 100, 	'dwarven ring')
shopModule:addSellableItem({'ring of healing', 'ring of healing'}, 		2214, 100, 	'ring of healing')
shopModule:addSellableItem({'strange talisman', 'strange talisman'}, 		2161, 30, 	'strange talisman')
shopModule:addSellableItem({'silver amulet', 'silver amulet'}, 		2170, 50, 	'silver amulet')
shopModule:addSellableItem({'protection amulet', 'protection amulet'}, 		2200, 100, 	'protection amulet')
shopModule:addSellableItem({'dragon necklace', 'dragon necklace'}, 		2201, 100, 	'dragon necklace')
shopModule:addSellableItem({'snakebite rod', 'snakebite rod'}, 		2182, 100, 	'snakebite rod')
shopModule:addSellableItem({'moonlight rod', 'moonlight rod'}, 		2186, 200, 	'moonlight rod')
shopModule:addSellableItem({'volcanic rod', 'volcanic rod'}, 		2185, 1000, 	'volcanic rod')
shopModule:addSellableItem({'quagmire rod', 'quagmire rod'}, 		2181, 2000, 	'quagmire rod')
shopModule:addSellableItem({'tempest rod', 'tempest rod'}, 		2183, 3000, 	'tempest rod')
shopModule:addSellableItem({'ankh', 'ankh'}, 		2193, 200, 	'ankh')
shopModule:addSellableItem({'mysterious fetish', 'mysterious fetish'}, 		2194, 50, 	'mysterious fetish')
npcHandler:addModule(FocusModule:new())
