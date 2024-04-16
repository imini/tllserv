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
function onThink() 					npcHandler:onThink() end

function callbackOnThink()
	if (os.clock() - talk_story) > 9 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

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
	elseif story == 5 then
    
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
	
	value1 = getPlayerStorageValue(cid,9952)
	value2 = getPlayerStorageValue(cid,9953)
	value3 = getPlayerStorageValue(cid,9954)
	value4 = getPlayerStorageValue(cid,9955)
	value5 = getPlayerStorageValue(cid,9956)
	value6 = getPlayerStorageValue(cid,9957)
   value7 = getPlayerStorageValue(cid,9958)
   value8 = getPlayerStorageValue(cid,9959)
   value9 = getPlayerStorageValue(cid,9960)
   value10 = getPlayerStorageValue(cid,9961)
   msg = string.lower(msg)
	if msgcontains(msg,'mission') and value1 == -1 and value3 == -1 and value2 == -1 and value8 == -1 and value10 == -1
	or msgcontains(msg,'quest') and value1 == -1 and value3 == -1 and value2 == -1 then
	selfSay('I have passed away, my friend. I was slain by those evil giants. But one thing bothers me more than the life on the other side, and that is that I lost a very rare helmet when I died. ...')
	story = 1
	talk_start = os.clock()
	talk_story = os.clock()
	storyMessage[1] = 'I need to confirm whether the helmet is still in my body or not. Will you do this for me?'
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Okay...')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Very well. Return to me when you have confirmed if the helmet is still there or not.')
	talk_state = 0
	setPlayerStorageValue(cid,9952,1)
	
	elseif msgcontains(msg,'mission') and value1 == 1 and value3 == -1 and value8 == -1 and value7 == -1 and value10 == -1 
	or msgcontains(msg,'quest') and value1 == 1 and value3 == -1 
	or msgcontains(msg,'helmet') and value1 == 1 and value3 == -1 then
	selfSay('So, was the helmet there?')
	talk_state = 2
	
	elseif msgcontains(msg,'mission') and value1 == 1 and value3 == 1 and value2 == 1 and value6 == -1 and value8 == -1 and value10 == -1 
	or msgcontains(msg,'quest') and value1 == 1 and value3 == 1 and value2 == 1 
	or msgcontains(msg,'helmet') and value1 == 1 and value3 == 1 and value2 == 1 then
	selfSay('You have helped me already. Ask me for a favour some day, instead.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('I sense lies...')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	if value2 == 1 then
	selfSay('That’s what I feared. The idiotic giants has taken it and probably destroyed it by now. ...')
	story = 2
	talk_start = os.clock()
	talk_story = os.clock()
	storyMessage[2] = 'Anyway, thank you for your help. Remember to ask me for a favour some day.'
	setPlayerStorageValue(cid,9954,1)
	talk_state = 0
	focus = 0
	else
	selfSay('You haven\'t checked yet, have you?')
	talk_state = 0
	end
	
	elseif value3 == 1 and value4 == -1 and msgcontains(msg,'favour') then 
	selfSay('I am capable of blessing you to wear a certain outfit, which comes from the deepest of jungles. Would you like to recieve this blessing from me as thanks for your help?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Very well, tell me if you change your mind.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('Very well. Here you are.')
	talk_state = 0
	doSendMagicEffect(getThingPos(cid),14)
	doPlayerAddOutfit(cid,158,0)
	doPlayerAddOutfit(cid,154,0)
	setPlayerStorageValue(cid,9955,1)
	
	elseif value4 == 1 and msgcontains(msg,'favour') then
	selfSay('You have already recieved my unique outfit.')
	talk_state = 0
	
	elseif value4 == 1 and value6 == -1 and value5 == -1 and msgcontains(msg,'addon') then
	selfSay('The outfit you have recieved comes with certain addons. Usually, these addons are only given to people who has proven themself worthy of them. ...')
	story = 3
	talk_start = os.clock()
	talk_story = os.clock()
	storyMessage[3] = 'I am dead, after all, so I won’t send you on silly missions to retrieve various items. Instead, I will only crave one single thing from you. ...'
	storyMessage[4] = 'I want you to obtain a magic plate armor for me. I am longing for this shiny metal with its magical properties. Are you willing to do this for me?'
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Very well, tell me if you change your mind.')
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'yes') then
	selfSay('Fine. Then return to me as soon as you have obtained a magic plate armor.')
	setPlayerStorageValue(cid,9956,1)
	talk_state = 0
	
		elseif value6 == 1 and value10 == -1 and msgcontains(msg,'magic plate armor') then
	selfSay('You have already given me the magic plate armor.')
	
	elseif msgcontains(msg,'magic plate armor') and value5 == 1 and value6 == -1 and value10 == -1 or
	msgcontains(msg,'addon') and value5 == 1 and value6 == -1 and value10 == -1 then
	selfSay('Have you actually managed to obtain one of these rare magic plate armors?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Ah, okay then. Don\'t forget to tell me when you have.')
	talk_state = 0
	

	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2472) >= 1 then
	selfSay('Amazing. I thought you wouldn’t make it. Very well, here you go. Take this staff and wear it with pride. Now that you have proven yourself worthy, you may want to proceed with another mission.')
	doPlayerRemoveItem(cid,2472,1)
	doSendMagicEffect(getThingPos(cid),14)
	setPlayerStorageValue(cid,9957,1)
	doPlayerAddOutfit(cid, 158, 2)
	doPlayerAddOutfit(cid, 154, 1)
	talk_state = 0
	else
	selfSay('No, you have not obtained one, apparently.')
	talk_state = 0
	end
	
	elseif value6 == 1 and msgcontains(msg,'addon') and value10 == -1 then
	selfSay('You have already recieved the first addon. Now ask me for another mission.')
	
	elseif value6 == 1 and value7 == -1 and value10 == -1 and msgcontains(msg,'mission') then
	selfSay('This time I will need less expensive items, but perhaps quite rare. Are you willing to proceed?')
	talk_state = 6
	
	elseif value6 == 1 and value7 == 1 and value10 == -1 and msgcontains(msg,'mission') then
	selfSay('You are in the middle of this mission.')
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Fine, then don\'t.')
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'yes') then
	selfSay('Very well. Firstly, I want you to collect five skull staffs. Return to me when you have collected those.')
	talk_state = 0
	setPlayerStorageValue(cid,9958,1)
	
	elseif value7 == 1 and value8 == -1 and msgcontains(msg,'skull staff') then
	selfSay('Have you gathered the 5 skull staffs which I requested?')
	talk_state = 7
	
	elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Okay, then.')
	talk_state = 0
	
	elseif talk_state == 7 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2436) >= 5 then
	selfSay('Thanks for these. Now, I want you to obtain 50 skulls. Come back when you have those.')
	talk_state = 0
	setPlayerStorageValue(cid,9959,1)
	doPlayerRemoveItem(cid,2436,5)
	else
	selfSay('No, you haven\'t.')
	end
	
	elseif value8 == 1 and value10 == -1 and msgcontains(msg,'skull staff') then
	selfSay('You have given me the skull staffs. I have now requested 50 skulls.')
	talk_state = 0
	
	elseif value8 == 1 and value9 == -1 and msgcontains(msg,'skull') then
	selfSay('Have you obtained the 50 skulls which I requested?')
	talk_state = 8
	
	elseif talk_state == 8 and msgcontains(msg,'no') then
	selfSay('Okay, then.')
	talk_state = 0
	
	elseif talk_state == 8 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2229) >= 50 then
	selfSay('Great! Now – the 50 pieces of yellow cloth. Hurry up and return when you have them.')
	talk_state = 0
	setPlayerStorageValue(cid,9960,1)
	doPlayerRemoveItem(cid,2229,50)
	else
	selfSay('No, you haven\'t.')
	end
	
	elseif value9 == 1 and value10 == -1 and msgcontains(msg,'skull') then
	selfSay('You have given me the 50 skulls. Now I want 50 yellow pieces of cloth from you.')
	talk_state = 0
	
	elseif value9 == 1 and value10 == -1 and msgcontains(msg,'cloth') then
	selfSay('Have you obtained 50 pieces of yellow cloth?')
	talk_state = 9
	
	elseif talk_state == 9 and msgcontains(msg,'no') then
	selfSay('Okay, then.')
	talk_state = 0
	
	elseif talk_state == 9 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5914) >= 50 then
	selfSay('Amazing. Now, I can start the ritual and perhaps I can awake a spirit which can take my body in possess and bury it honourly. ...')
	story = 5
	talk_start = os.clock()
	talk_story = os.clock()
	storyMessage[5] = 'For you, I have yet another addon. Take this mask as a proof of your courage.'
	talk_state = 0
	setPlayerStorageValue(cid,9961,1)
	doPlayerRemoveItem(cid,5914,50)
	doPlayerAddOutfit(cid,158,1)
	doPlayerAddOutfit(cid,154,2)
	doSendMagicEffect(getThingPos(cid),14)
	else
	selfSay('No, you haven\'t.')
	end
	
	elseif value10 == 1 and msgcontains(msg,'skull') then
	selfSay('You have already recieved the outfit and its both addons.')
	talk_state = 0
	
	elseif value10 == 1 and msgcontains(msg,'skull staff') then
	selfSay('You have already recieved the outfit and its both addons.')
	talk_state = 0
	
	elseif value10 == 1 and msgcontains(msg,'magic plate armor') then
	selfSay('You have already recieved the outfit and its both addons.')
	talk_state = 0
	
	elseif value10 == 1 and msgcontains(msg,'cloth') then
	selfSay('You have already recieved the outfit and its both addons.')
	talk_state = 0
	
	elseif value10 == 1 and msgcontains(msg,'addon') then
	selfSay('You have already recieved the outfit and its both addons.')
	talk_state = 0
	
	elseif value10 == 1 and msgcontains(msg,'mission') then
	selfSay('You have already recieved the outfit and its both addons.')
	talk_state = 0
	end
	return true
	end
	
	
	
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
