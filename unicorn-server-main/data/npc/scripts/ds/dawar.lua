
  


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
	if (os.clock() - talk_story) > 14 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2
	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 3
	elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 4
	elseif story == 4 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 5
	elseif story == 5 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 6
	elseif story == 6 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 7
	elseif story == 7 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 8
	elseif story == 8 then
    
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
	
	value0 = getPlayerStorageValue(cid,9544)
	value1 = getPlayerStorageValue(cid,9545)
	value2 = getPlayerStorageValue(cid,9546)
	value3 = getPlayerStorageValue(cid,9547)
	value4 = getPlayerStorageValue(cid,9548)
	value5 = getPlayerStorageValue(cid,9549)
	value6 = getPlayerStorageValue(cid,9550)
	value7 = getPlayerStorageValue(cid,9551)
	value8 = getPlayerStorageValue(cid,9552)
	value9 = getPlayerStorageValue(cid,9553)
	value10 = getPlayerStorageValue(cid,9554)
	msg = string.lower(msg)
	if msgcontains(msg,'mission') and value0 == -1 or
	msgcontains(msg,'quest') and value0 == -1 then
	selfSay('Ah. Perhaps you could help me get an insight in this. Well, ' .. getPlayerName(cid) .. ', I have a little problem. I have acquired a certain scroll, how is irrelevant, containing very strange signs. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'I have reasons to believe essential information about the pharaohs time of glory and downfall is written there. Obviously not in the language we use, but probably in the one of the pharaohs. ...'
  storyMessage[2] = 'Regardless language, I need to decipher it somehow. I, as the mage I am, am not very involved in archaeology, but I have my theories of how to solve this. I have read about the four tombs here in Dustwit. ...'
  storyMessage[3] = 'I don\'t have time to brief you with the entire base of information about the tombs, ' .. getPlayerName(cid) .. ', but I can do it very quickly. If you want to know more, visit the library or something. ...'
  storyMessage[4] = 'Well, anyway, long ago this island was ruled by the pharaohs, who later were imprisoned in four cursed tombs where they are said to still be awaiting revenge. This might of course not be true, but we can\'t know. ...'
  storyMessage[5] = 'This would not be of any significance to our current mission, if not for the ancient columns rumoured to be in these tombs. It is said that these columns have signs on them how to decipher the language of the pharaohs. ...'
  storyMessage[6] = 'We can only hope that the signs on my scroll are in the language of the pharaohs, and if it is, this could be a way of solving its secrets. So now, supposingly, you begin to understand what you are going to do. ...'
  storyMessage[7] = 'I need you to seek these tombs, one by one, and look for the columns with the signs. After having found them you must return to me and tell me about it so I can decipher the scroll and its secrets! ...'
  storyMessage[8] = 'Do you understand everything perfectly?'
  talk_state = 1
  
  elseif talk_state == 1 and msgcontains(msg,'no') then
  selfSay('You are truly a dreary person.')
  talk_state = 0
  
  elseif talk_state == 1 and msgcontains(msg,'yes') then
  selfSay('Good. Let\'s take the tombs one by one. To begin with, travel north to the tomb rumoured to be below the cairn. Return to me afterwards and report about the signs.')
  talk_state = 0 
  setPlayerStorageValue(cid,9544,1)
  setPlayerStorageValue(cid,9545,1)
  
  elseif value1 == 1 and msgcontains(msg,'mission') or
	value1 == 1 and msgcontains(msg,'decipher') or
	value1 == 1 and msgcontains(msg,'signs') or
	value1 == 1 and msgcontains(msg,'quest') or
	value1 == 1 and msgcontains(msg,'report') then
	selfSay('You must travel to the tomb in the north and seek the column with the signs. When, or if, you decipher it, come back here and report to me.')

  elseif value2 == 1 and msgcontains(msg,'mission') or
	value2 == 1 and msgcontains(msg,'decipher') or
	value2 == 1 and msgcontains(msg,'signs') or
	value2 == 1 and msgcontains(msg,'quest') or
	value2 == 1 and msgcontains(msg,'report') then
	selfSay('Excellent. I have already looked into your mind and seen what you saw. Thanks. Now, are you ready for the next tomb?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
  selfSay('Alright. But when you feel ready, travel to the tomb in the far north-east. It is said to be close to the old ruin located there. Report back to me when you are finished.')
  setPlayerStorageValue(cid,9547,1)
  setPlayerStorageValue(cid,9546,-1)
  talk_state = 0
  
  elseif talk_state == 2 and msgcontains(msg,'yes') then
  selfSay('Good. Then we shall proceed to the tomb in the far north-east. It\'s rumoured to be closeby the ancient ruin there. Come back and report when you have fulfilled the next part of the mission.')
  setPlayerStorageValue(cid,9547,1)
  setPlayerStorageValue(cid,9546,-1)
  talk_state = 0
  
  
  
  
  elseif value3 == 1 and msgcontains(msg,'mission') or
	value3 == 1 and msgcontains(msg,'decipher') or
	value3 == 1 and msgcontains(msg,'signs') or
	value3 == 1 and msgcontains(msg,'quest') or
	value3 == 1 and msgcontains(msg,'report') then
	selfSay('Travel to the north-east tomb closeby the old ruin. Report back to me afterwards.')

  elseif value4 == 1 and msgcontains(msg,'mission') or
	value4 == 1 and msgcontains(msg,'decipher') or
	value4 == 1 and msgcontains(msg,'signs') or
	value4 == 1 and msgcontains(msg,'quest') or
	value4 == 1 and msgcontains(msg,'report') then
	selfSay('This is just magnificent. We\'re getting closer. Now, the next tomb in the south-east where the Barren Cliffs meets the ocean. Report back to me afterwards.')
  setPlayerStorageValue(cid,9549,1)
  setPlayerStorageValue(cid,9548,-1)	
  
  elseif value5 == 1 and msgcontains(msg,'mission') or
	value5 == 1 and msgcontains(msg,'decipher') or
	value5 == 1 and msgcontains(msg,'signs') or
	value5 == 1 and msgcontains(msg,'quest') or
	value5 == 1 and msgcontains(msg,'report') then
	selfSay('You must seek the tomb in the south-east where the Barren Cliffs meets the ocean. Find the column and decipher the signs.')

  elseif value6 == 1 and msgcontains(msg,'mission') or
	value6 == 1 and msgcontains(msg,'decipher') or
	value6 == 1 and msgcontains(msg,'signs') or
	value6 == 1 and msgcontains(msg,'quest') or
	value6 == 1 and msgcontains(msg,'report') then
	selfSay('It is slowly starting to make sense. Now, there\'s only one tomb left. The one at the tar pits in the east. Go there, find the column and remember its signs for me.')
  setPlayerStorageValue(cid,9551,1)
  setPlayerStorageValue(cid,9550,-1)	

  elseif value7 == 1 and msgcontains(msg,'mission') or
	value7 == 1 and msgcontains(msg,'decipher') or
	value7 == 1 and msgcontains(msg,'signs') or
	value7 == 1 and msgcontains(msg,'quest') or
	value7 == 1 and msgcontains(msg,'report') then
	selfSay('You must go to the tar pit tomb and seek its column. Afterwards you have fulfilled the mission I want you to return here and report.')

  elseif value8 == 1 and msgcontains(msg,'mission') or
	value8 == 1 and msgcontains(msg,'decipher') or
	value8 == 1 and msgcontains(msg,'signs') or
	value8 == 1 and msgcontains(msg,'quest') or
	value8 == 1 and msgcontains(msg,'report') then
	selfSay('Ah! As I expected. With the knowledge you have brought me the scroll now makes perfect sense. And what sense then! This is better than I dared hope for. Thank you, ' .. getPlayerName(cid) .. '! Ask me for a reward someday.')
  setPlayerStorageValue(cid,9553,1)
  setPlayerStorageValue(cid,9552,-1)	

	elseif value9 == 1 and msgcontains(msg,'reward') then
	selfSay('As you have helped me tremendously, I have prepared a little surprise for you. Take this from me, ' .. getPlayerName(cid) .. '.')
  setPlayerStorageValue(cid,9554,1)
  setPlayerStorageValue(cid,9553,-1)	
  bag = doPlayerAddItem(cid,1995,1)
  doAddContainerItem(bag,2142,1)
  doAddContainerItem(bag,2152,7)
  doAddContainerItem(bag,2143,4)
	doAddContainerItem(bag,2185,1)
	doAddContainerItem(bag,2273,2)
	doAddContainerItem(bag,2268,1)
	doAddContainerItem(bag,2268,1)
	doAddContainerItem(bag,2304,2)
	
  elseif value10 == 1 and msgcontains(msg,'reward') or
  value10 == 1 and msgcontains(msg,'mission') then
	selfSay('You have already helped me with my mission and recieved a reward, ' .. getPlayerName(cid) .. '.')
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
shopModule:addBuyableItem({'heavy magic missile rune', 'heavy magic missile rune'}, 	2311, 125, 	5,	'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball rune', 'great fireball rune'}, 		2304, 180, 	2, 	'great fireball rune')
shopModule:addBuyableItem({'explosion rune', 'explosion rune'}, 		2313, 250, 	3, 	'explosion rune')
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
shopModule:addBuyableItem({'blank', ' blank rune'}, 			2260, 10, 		'blank rune')
local node = keywordHandler:addKeyword({'flask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Alright then.'})
local node = keywordHandler:addKeyword({'vial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Alright then.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
