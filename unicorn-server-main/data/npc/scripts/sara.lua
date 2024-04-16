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
	
	value1 = getPlayerStorageValue(cid,9931)
	value2 = getPlayerStorageValue(cid,9932)
	value3 = getPlayerStorageValue(cid,9933)
	value4 = getPlayerStorageValue(cid,9934)
	msg = string.lower(msg)
	if value4 == -1 and value2 == -1 and msgcontains(msg, 'quest') or value4 == -1 and value2 == -1 and msgcontains(msg, 'mission') then
	selfSay('I am actually in a urgent need for for a few things. Perhaps you would like to help me? I would give you something nice for your trouble. How will it be?')
	talk_state = 1

  elseif value4 == 1 and value2 == 1 and msgcontains(msg, 'quest') or value2 == 1 and value4 == 1 and msgcontains(msg, 'mission') then
	selfSay('You have helped me too much already.')
	talk_state = 0
	
	elseif value2 == 1 and value4 == -1 and msgcontains(msg, 'quest') or value4 == -1 and value2 == 1 and msgcontains(msg, 'mission') then
	selfSay('You have helped me too much already.')
	talk_state = 0
	
	elseif msgcontains(msg, 'no') and talk_state == 1 or
	msgcontains(msg, 'no') and talk_state == 2 or
	msgcontains(msg, 'no') and talk_state == 3 or
	msgcontains(msg, 'no') and talk_state == 4 then
	selfSay('Okay, thanks anyway.')
	talk_state = 0
	
	elseif msgcontains(msg, 'yes') and talk_state == 1 then
	selfSay('Well, as a matter of fact I believe these things can be a little hard to acquire. But we\'ll see that, won\'t we? ...')
	story = 1
	talk_start = os.clock()
	talk_story = os.clock()
	storyMessage[1] = 'So, the first thing I need is a plate armor to adore my wall. Can you retrieve this for me?'
	talk_state = 2
	
 elseif talk_state == 2 and msgcontains(msg, 'yes') then
	selfSay('Thank you. Return to me as soon as you have obtained it.')
	setPlayerStorageValue(cid,9932,1)
	talk_state = 0

	elseif value2 == 1 and value3 == -1 and msgcontains(msg, 'plate armor') then
	selfSay('Have you found me a plate armor?')
	talk_state = 3
	
	elseif value2 == 1 and value3 == 1 and msgcontains(msg, 'plate armor') then
	selfSay('You have given me a plate armor already.')
	talk_state = 0
	
	elseif value3 == 1 and value4 == -1 and msgcontains(msg, 'life ring') then
	selfSay('Have you retrieved 20 life rings as I requested?')
	talk_state = 4
	
	elseif talk_state == 3 then
			if msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,2463) >= 1 then
			selfSay('Thank you. Now, for the second thing I need. I want you to bring me 20 life rings. All at once please. Return when you have done this.')
				setPlayerStorageValue(cid,9933,1)
				doPlayerRemoveItem(cid,2463,1)
			talk_state = 0
			else
			selfSay('You haven\'t got any plate armor.')
		end
		end
		
		elseif talk_state == 4 then
			if msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,2168) >= 20 then
			selfSay('Ah, thanks. Now I can finally make those runes. Anyway, I want you to have this for helping me. It\'s very rare.')
				setPlayerStorageValue(cid,9934,1)
				doPlayerRemoveItem(cid,2168,20)
				doPlayerAddItem(cid,6104,1)
			talk_state = 0
			else
			selfSay('No, you don\'t have it.')
		end
		end
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())