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
	story = 5
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
	
	value0 = getPlayerStorageValue(cid,9989)
	value1 = getPlayerStorageValue(cid,9990)
	value2 = getPlayerStorageValue(cid,9991)
	value3 = getPlayerStorageValue(cid,9992)
	value4 = getPlayerStorageValue(cid,9993)
	value5 = getPlayerStorageValue(cid,9994)
	value6 = getPlayerStorageValue(cid,9995)
	msg = string.lower(msg)
	if value0 == -1 and msgcontains(msg,'addon') or
	value0 == -1 and msgcontains(msg,'outfit') then
	selfSay('Are you talking about my spiky shoulder pad? You can\'t buy one of these. They have to be earned.')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'earn') then
	selfSay('I\'m not sure if you are enough of a hero to earn them. You could try, though. What do you think?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Thought so.')
	talk_state = 0
	
  elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Okay, who knows, maybe you have a chance. A really small one though. Listen up: ...')
	story = 1
	talk_start = os.clock()
	talk_story = os.clock()
	storyMessage[1] = 'First, you have to prove your guts by bringing me 100 hardened bones. ...'
	storyMessage[2] = 'Next, if you actually managed to collect that many, please complete a small task for me and bring me seven dragon shields. I am a collector. ...'
	storyMessage[3] = 'Alright, um, afterwards show me that you have fighting spirit. Any true hero needs plenty of that. ...'
	storyMessage[4] = 'The last task is the hardest. You will need to bring me a claw from a mighty dragon king. ...'
	storyMessage[5] = 'Did you understand everything I told you and are willing to handle this task?'	
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('That\'s a pity, then you can\'t have these shoulder pads.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('Good. Return to me when you have collected the 100 hardened bones.')
	setPlayerStorageValue(cid,9989,1)
	setPlayerStorageValue(cid,9990,1)
	talk_state = 0
	
	elseif value1 == 1 and msgcontains(msg,'addon') or
	value1 == 1 and msgcontains(msg,'bone') or
	value1 == 1 and msgcontains(msg,'outfit') then
	selfSay('How are you faring with your mission? Have you collected all 100 hardened bones?')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 4 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5925) >= 100 then
	selfSay('I\'m surprised. That\'s pretty good. Now, bring me the seven dragon shields for my collection.')
	setPlayerStorageValue(cid,9990,-1)
	setPlayerStorageValue(cid,9991,1)
	doPlayerRemoveItem(cid,5925,100)
	talk_state = 0
	else
	selfSay('That\'s a shame that you\'re trying to decieve me.')
	talk_state = 0
	end
	
	elseif value2 == 1 and msgcontains(msg,'addon') or
	value2 == 1 and msgcontains(msg,'dragon shield') or
	value2 == 1 and msgcontains(msg,'outfit') then
	selfSay('Did you collect seven dragon shields?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 5 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,2516) >= 7 then
	selfSay('Well done. These shields are enough to give a nice touch to my collection. Thank you! Now - show me fighting spirit.')
	setPlayerStorageValue(cid,9991,-1)
	setPlayerStorageValue(cid,9992,1)
	doPlayerRemoveItem(cid,2516,7)
	talk_state = 0
	else
	selfSay('That\'s a shame that you\'re trying to decieve me.')
	talk_state = 0
	end
	
	elseif value3 == 1 and msgcontains(msg,'addon') or
	value3 == 1 and msgcontains(msg,'fighting spirit') or
	value3 == 1 and msgcontains(msg,'outfit') then
	selfSay('So, can you show me your fighting spirit?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 6 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,4839) >= 1 then
	selfSay('Correct - pretty smart to bring the fighting spirit the djinns sell. But the hardest task is yet to come: the claw from a lord among the dragon lords.')
	setPlayerStorageValue(cid,9992,-1)
	setPlayerStorageValue(cid,9993,1)
	doPlayerRemoveItem(cid,4839,1)
	talk_state = 0
	else
	selfSay('That\'s a shame that you\'re trying to decieve me.')
	talk_state = 0
	end
	
	elseif value4 == 1 and msgcontains(msg,'addon') or
	value4 == 1 and msgcontains(msg,'dragon claw') or
	value4 == 1 and msgcontains(msg,'outfit') then
	selfSay('Have you actually managed to obtain the dragon claw I asked for?')
	talk_state = 7
	
	elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 7 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5919) >= 1 then
	selfSay('You did it! I have seldom seen a person as courageous as you. I really have to say that you deserve to wear a spike. I have prepared the shoulder spikes for you. Here you go.')
	setPlayerStorageValue(cid,9993,-1)
	doPlayerAddOutfit(cid,134,2)
	doPlayerAddOutfit(cid,142,1)
	doSendMagicEffect(getThingPos(cid),14)
	setPlayerStorageValue(cid,9994,1)
	doPlayerRemoveItem(cid,5919,1)
	talk_state = 0
	else
	selfSay('That\'s a shame that you\'re trying to decieve me.')
	talk_state = 0
	end
	
	elseif value5 == 1 and msgcontains(msg,'addon') or
	value5 == 1 and msgcontains(msg,'dragon claw') or
	value5 == 1 and msgcontains(msg,'outfit') then
	selfSay('You have fulfilled the tough task I asked for and I have given you the reward already.')
	talk_state = 0
	
	end
	return true
	end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
