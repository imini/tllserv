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
	if (os.clock() - talk_story) > 13 and story > 0 then
    
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
  story = 0
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
	
	value1 = getPlayerStorageValue(cid,9919)
	msg = string.lower(msg)
	value2 = getPlayerStorageValue(cid,9511)
	value3 = getPlayerStorageValue(cid,9512)
	value4 = getPlayerStorageValue(cid,9513)
	
	if value1 == 1 and msgcontains(msg, 'cowl') then
	selfSay('Cowls are deceptive dark artifacts. If you ever get a hold of one, get rid of it as soon as possible. That is my only advice. ...')
	story = 1
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[1] = 'My earlier researches in dark magic has led me to some straight facts about these cowls. ...'
			storyMessage[2] = 'When its possesor wears it, it instantly begins to drain his life force. The feeling can be compared to the one when drowning, I have been told. ...'
			storyMessage[3] = 'I don\'t know where they are from, really, but I have heard they are somehow connected to werewolves.'
			setPlayerStorageValue(cid,9919,1)
			talk_state = 0

  elseif value1 == -1 and msgcontains(msg, 'cowl') then
	selfSay('Cowls are dark artifacts. I would discuss it further with you if the time was appropriate, but now it isn\'t.')
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value2 == -1 then
	selfSay('Does this mean I have to come up with some solid reason for why you are going to help me? Or is it enough if I just tell you I need help? Well, ' .. getPlayerName(cid) .. ', let\'s see. ...')
	story = 4
	talk_start = os.clock()
	talk_story = os.clock()
	storyMessage[4] = 'As you might\'ve understood I am not a normal shop keeper. I orginate from Paschendale and the religion of Zathroth lays in my past. As you also might have seen, I collect skulls. ...'
	storyMessage[5] = 'This is something of a bad habit I still have since the time in Paschendale. Anyway, I\'m doing everything to quit my somewhat strange addiction, but at the time being all I can think of is more skulls. ...'
	storyMessage[6] = 'But I have heard about a plant, ' .. getPlayerName(cid) .. ', a plant whose properties has amazing effects. It is videlicet said that by cooking the plant and eating it, you loose any addiction. ...'
	storyMessage[7] = 'By now you probably have understood that I need the plant - and I need it now! You must go and seek it and bring me perhaps not the entire plant, but just a little part of it. Yes, that would do. ...'
	storyMessage[8] = 'Have you understood what to do now, ' .. getPlayerName(cid) .. '?'
	talk_state = 1
	
	elseif msgcontains(msg,'no') and talk_state == 1 then
	selfSay('Oh, too bad.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 1 then
	selfSay('Excellent. First, I suggest you obtain some sort of knife to cut a sample from the plant. A normal kitchen knife would do. You still with me?')
	talk_state = 2
	
	elseif msgcontains(msg,'no') and talk_state == 2 then
	selfSay('Oh, too bad.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 2 then
	selfSay('Good, then you travel to the distant Paschendale and seek the plant there. I have heard it grows there. But don\'t be impatient if you don\'t find it, it\'s said to be quite rare. Have you understood this too, ' .. getPlayerName(cid) .. '?')
	talk_state = 3
	
	elseif msgcontains(msg,'no') and talk_state == 3 then
	selfSay('Oh, too bad.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 3 then
	selfSay('Excellent! Then I\'ll wait here for your return.')
	setPlayerStorageValue(cid,9511,1)
	setPlayerStorageValue(cid,9512,1)
	talk_state = 0
	
	elseif value3 == 1 and msgcontains(msg,'mission') or
	value3 == 1 and msgcontains(msg,'plant') then
	selfSay('Have you obtained a sample of the plant from Paschendale?')
	talk_state = 4
	
	elseif msgcontains(msg,'no') and talk_state == 4 then
	selfSay('Oh, too bad.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 4 then
	if getPlayerItemCount(cid,7248) >= 1 then
	selfSay('Oh, finally! This will be my cure. Thank you, ' .. getPlayerName(cid) .. '! Here, take this old weapon I have. It will serve a hero like you well, I suppose.')
	talk_state = 0
	doPlayerAddItem(cid,2189,1)
	setPlayerStorageValue(cid,9512,-1)
	doPlayerRemoveItem(cid,7248,1)
	setPlayerStorageValue(cid,9513,1)
	else
	selfSay('No. No... you don\'t have it. Gah!')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'mission') and value4 == 1 or
	msgcontains(msg,'plant') and value4 == 1 then
	selfSay('Haven\'t you already helped me enough, ' .. getPlayerName(cid) .. '?')

	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
