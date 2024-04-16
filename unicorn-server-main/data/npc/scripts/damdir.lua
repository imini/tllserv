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
	talk_state = 1
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
	
	value0 = getPlayerStorageValue(cid,7568)
	value1 = getPlayerStorageValue(cid,7566)
	value2 = getPlayerStorageValue(cid,7567)
	value6 = getPlayerStorageValue(cid,7472)
	msg = string.lower(msg)
	if value6 == 1 and value0 == -1 and msgcontains(msg,'addon') or
	value6 == 1 and value0 == -1 and msgcontains(msg,'outfit') then
	selfSay('I suppose I have an old headpiece. I understand you want one, you look quite silly without it. I need some help anyways. ...')
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'Some guy gave me this strange assignment. He wanted me to sneak into Castle Dine at night and shroud it with cloth... unnoticed. Well, aslong as I get payment I’m fine with that. ...'
			storyMessage[2] = 'I wonder why anyone would like to shroud a castle. But hey, it’s not my business anyway. So, I need clothes. I’m gonna make it colourful. ...'
			storyMessage[3] = 'I will need alot of cloth. 50 pieces of blue cloth, 50 pieces of green cloth, 50 pieces of red cloth, 50 pieces of brown cloth and 50 pieces of yellow cloth. ...'
			storyMessage[4] = 'Besides, gonna need 10 spider silk yarns too. Understood?'

	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('It doesn\'t surprise me.')
	talk_state = 0
	
  elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Fine. Return to me when you have all the cloths... and the yarns. Don’t forget the yarns, they are important.')
		setPlayerStorageValue(cid,7568,1)
	setPlayerStorageValue(cid,7566,1)
	talk_state = 0
	
	
	elseif value1 == 1 and msgcontains(msg,'addon') or
	value1 == 1 and msgcontains(msg,'clothes') or
	value1 == 1 and msgcontains(msg,'cloths') or
	value1 == 1 and msgcontains(msg,'outfit') then
	selfSay('So, have you brought me 50 pieces of blue cloth, 50 pieces of green cloth, 50 pieces of red cloth, 50 pieces of brown cloth, 50 pieces of yellow cloth and the 10 spider silk yarns?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 3 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5914) >= 50 and getPlayerItemCount(cid,5913) >= 50 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5912) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
	selfSay('Great. Here’s my old assassin headpiece. Enjoy it, you will look better with it.')
	setPlayerStorageValue(cid,7566,-1)
	setPlayerStorageValue(cid,7567,1)
	doPlayerRemoveItem(cid,5910,50)
	doPlayerRemoveItem(cid,5911,50)
	doPlayerRemoveItem(cid,5912,50)
	doPlayerRemoveItem(cid,5913,50)
	doPlayerRemoveItem(cid,5914,50)
	doPlayerRemoveItem(cid,5886,10)
	doPlayerAddOutfit(cid,156,1)
	doPlayerAddOutfit(cid,152,1)
	talk_state = 0
	else
	selfSay('You don\'t have those items.')
	talk_state = 0
	end
	
	
	elseif value2 == 1 and msgcontains(msg,'outfit') or
	value2 == 1 and msgcontains(msg,'addon') then
	selfSay('You have already finished the mission.')
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())