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
	if (os.clock() - talk_story) > 10 and story > 0 then
    
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
	
	value0 = getPlayerStorageValue(cid,9640)
	value1 = getPlayerStorageValue(cid,9641)
	value2 = getPlayerStorageValue(cid,9642)
	value3 = getPlayerStorageValue(cid,9643)
	value4 = getPlayerStorageValue(cid,9644)
	value5 = getPlayerStorageValue(cid,9645)
	value6 = getPlayerStorageValue(cid,9646)
	msg = string.lower(msg)
	if msgcontains(msg,'mission') and value0 == -1 then
	selfSay('Interesting. Not many people offers me help. Incidentally, I do need help at this very moment. Perhaps you can help me. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'As you might\'ve understood I am selling and buying valuables. At the moment, I happen to own only gemstones, though. ...'
  storyMessage[2] = 'But I have heard that colleagues of mine in other towns have much more precious rarities in their possession, than I do. ...'
	storyMessage[3] = 'I would want at least one example of these rarities, but if I asked them for it they would decline immediately. ...'
	storyMessage[4] = 'Therefore, you could perhaps help me to obtain these rarities which I\'m interested in. Are you willing to do this?'
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Oh, very well.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Good. The first item which I want is the golden mug which currently is being sold by Sara from Casteldine. Go there and buy it from her, and I\'ll pay you when you\'re back with it.')
	setPlayerStorageValue(cid,9640,1)
	setPlayerStorageValue(cid,9641,1)
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value1 == 1 or
	msgcontains(msg,'golden mug') and value1 == 1 then
	selfSay('Have you obtained the golden mug I asked for?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Oh, very well. Come back later with it then.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2033) >= 1 then
	doPlayerRemoveItem(cid,2033,1)
	doPlayerAddItem(cid,2152,5)
	setPlayerStorageValue(cid,9641,-1)
	setPlayerStorageValue(cid,9642,1)
	selfSay('Great! Thank you. Here\'s the payment and a timid salary on 220 gold coins. Next, I need the ruby necklace which Henry Always is selling in Adanac. Can you obtain it for me?')
	talk_state = 3
	else
	selfSay('You don\'t have it.')
	talk_state = 0
	end
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Oh, very well.')
	talk_state = 0
	
	elseif value2 == 1 and msgcontains(msg,'mission') then
	selfSay('I need the ruby necklace which Henry Always is selling in Adanac. Can you obtain it for me?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('Very great! Now go, and come back when you have it with you.')
	setPlayerStorageValue(cid,9642,-1)
	setPlayerStorageValue(cid,9643,1)
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value3 == 1 or
	msgcontains(msg,'ruby necklace') and value3 == 1 then
	selfSay('Have you obtained the ruby necklace I asked for?')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Oh, very well. Come back later with it then.')
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2133) >= 1 then
	doPlayerRemoveItem(cid,2133,1)
	doPlayerAddItem(cid,2152,42)
	setPlayerStorageValue(cid,9643,-1)
	setPlayerStorageValue(cid,9644,1)
	selfSay('Great! Thank you. Here\'s the payment and a salary on 550 gold coins. Next, I need the golden amulet which is being offered by Falakee from Tha\'Reen. Can you buy it for me?')
	talk_state = 5
	else
	selfSay('You don\'t have it.')
	talk_state = 0
	end
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Oh, very well.')
	talk_state = 0
	
	elseif value4 == 1 and msgcontains(msg,'mission') then
	selfSay('I need the ruby necklace which Falakee from Tha\'Reen is offering. Can you buy it for me?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	selfSay('Very great! Now go, and come back when you have it with you.')
	setPlayerStorageValue(cid,9644,-1)
	setPlayerStorageValue(cid,9645,1)
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value5 == 1 or
	msgcontains(msg,'golden amulet') and value5 == 1 then
	selfSay('Have you obtained the golden amulet I asked for?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Oh, very well. Come back later with it then.')
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2130) >= 1 then
	doPlayerRemoveItem(cid,2130,1)
	doPlayerAddItem(cid,2152,75)
	setPlayerStorageValue(cid,9645,-1)
	setPlayerStorageValue(cid,9646,1)
	selfSay('Splendid! Now I have all the rarities I need. Thank you very much for your work and I hope you enjoyed your total salary of 1670 gold coins.')
	talk_state = 0
	else
	selfSay('You don\'t have it.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'mission') and value6 == 1 then
	selfSay('I have all the rarities I need already.')
	talk_state = 0
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())