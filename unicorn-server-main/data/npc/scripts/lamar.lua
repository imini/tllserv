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
	
	value0 = getPlayerStorageValue(cid,9829)
	value1 = getPlayerStorageValue(cid,9824)
	value2 = getPlayerStorageValue(cid,9825)
	value3 = getPlayerStorageValue(cid,9826)
	value4 = getPlayerStorageValue(cid,9827)
	value5 = getPlayerStorageValue(cid,9828)
	msg = string.lower(msg)
	
	if value0 == -1 and getPlayerSex(cid) == 1 and msgcontains(msg,'addon') or
	value0 == -1 and getPlayerSex(cid) == 1 and msgcontains(msg,'outfit') then
	selfSay('My turban? Eh no, you can\'t have it. Only oriental weaponmasters may wear it after having completed a difficult task.')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'task') then
	selfSay('You mean, you would like to prove that you deserve to wear such a turban?') 
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Ah, I see.') 
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Alright, then listen to the following requirements. I am currently in dire need of green dragon leather since my... oh well, don’t ask why, by the way. ...')
	story = 1 
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'Thus, please bring me 100 pieces of green dragon leather. Secondly, it came to my knowledge recently that the ancient behemoths has been found deep below the Taurus Cliff. ...'
  storyMessage[2] = 'I would like you to collect 70 behemoth fangs, just to prove their existance. I am curious, that’s all. ...'
  storyMessage[3] = 'Third, if I ever plan on leaving this mountain I wouldn’t like to fall, right? Therefor, bring me two enchanted chicken wings so I can fly if I want to. ...'
  storyMessage[4] = 'Last but not least, just drop by with 100 pieces of blue cloth and I will happily show you how to make a turban. ...'
  storyMessage[5] = 'Did you understand everything I told you and are willing to handle this task?'  
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Ah, I see.') 
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('Excellent! Come back to me once you have collected 100 pieces of green dragon leather.') 
	setPlayerStorageValue(cid,9829,1)
	setPlayerStorageValue(cid,9824,1)
	talk_state = 0
	
	elseif value1 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'addon') or
	value1 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'outfit') or
	value1 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'dragon leather') then
	selfSay('Have you really managed to fulfil the task and brought me 100 pieces of dragon leather?')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Alright.') 
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5877) >= 100 then
	doPlayerRemoveItem(cid,5877,100)
	setPlayerStorageValue(cid,9824,-1)
	setPlayerStorageValue(cid,9825,1)
	selfSay('Ahhh, this sme... never mind! I\'m impressed. You\'re on the best way to earn that turban. Now, please retrieve 70 behemoth fangs.') 
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have these leathers.') 
	talk_state = 0
	end
	
	elseif value2 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'addon') or
	value2 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'outfit') or
	value2 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'fang') then
	selfSay('Were you able to prove the behemoths existance by collecting 70 behemoth fangs?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Alright.') 
	talk_state = 0
	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5893) >= 70 then
	doPlayerRemoveItem(cid,5893,70)
	setPlayerStorageValue(cid,9825,-1)
	setPlayerStorageValue(cid,9826,1)
	selfSay('I never thought you\'d make it. Now we only need two enchanted chicken wings before we can start the construction of your turban.') 
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have these behemoth fangs.') 
	talk_state = 0
	end
	
	elseif value3 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'addon') or
	value3 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'outfit') or
	value3 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'chicken') then
	selfSay('Were you able to get hold of two enchanted chicken wings?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Alright.') 
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5891) >= 2 then
	doPlayerRemoveItem(cid,5891,2)
	setPlayerStorageValue(cid,9826,-1)
	setPlayerStorageValue(cid,9827,1)
	selfSay('Great, thank you very much. Just bring me 100 pieces of blue cloth now and I will happily show you how to make a turban.') 
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have these enchanted chicken feathers.') 
	talk_state = 0
	end
	
	elseif value4 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'addon') or
	value4 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'outfit') or
	value4 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'cloth') then
	selfSay('Ah, have you brought the 100 pieces of blue cloth?')
	talk_state = 7
	
	elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Alright.') 
	talk_state = 0
	
	elseif talk_state == 7 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5912) >= 100 then
	doPlayerRemoveItem(cid,5912,100)
	setPlayerStorageValue(cid,9827,-1)
	setPlayerStorageValue(cid,9828,1)
	doPlayerAddOutfit(cid,150,2)
	doPlayerAddOutfit(cid,146,2)
	doSendMagicEffect(getThingPos(cid),12)
	selfSay('Ah! Congratulations - even if you are not a true weaponmaster, you surely deserve to wear this turban. Here, I\'ll tie it for you.') 
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have these blue clothes.') 
	talk_state = 0
	end
	
	elseif value5 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'addon') or
	value5 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'outfit') or
	value5 == 1 and getPlayerSex(cid) == 1 and msgcontains(msg,'cloth') then
	selfSay('You have finished my tasks and recieved an outfit.')
	talk_state = 0
	
	elseif value0 == -1 and getPlayerSex(cid) == 0 and msgcontains(msg,'addon') or
	value0 == -1 and getPlayerSex(cid) == 0 and msgcontains(msg,'outfit') then
	selfSay('I can\'t help you, I\'m afraid.')
	talk_state = 0
	
	end
	return true
	end
	
	
	
	
	
	
	
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())