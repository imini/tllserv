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
	
	value0 = getPlayerStorageValue(cid,9830)
	value1 = getPlayerStorageValue(cid,9824)
	value2 = getPlayerStorageValue(cid,9825)
	value3 = getPlayerStorageValue(cid,9826)
	value4 = getPlayerStorageValue(cid,9827)
	value5 = getPlayerStorageValue(cid,9828)
	sex = getPlayerSex(cid)
	msg = string.lower(msg)
	
	if value0 == -1 and getPlayerSex(cid) == 0 and msgcontains(msg,'addon') or
	value0 == -1 and getPlayerSex(cid) == 0 and msgcontains(msg,'outfit') then
	selfSay('Hehe, would you like to wear a pretty veil like my daughter? Well... I could help you, but you would have to complete a task first.')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'task') then
	selfSay('You mean, you would like to prove that you deserve to wear such a veil?') 
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Ah, I see.') 
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Alright, then listen to the following requirements. I am currently in need of 100 dragon leathers, you see, my sister is a collector. ...')
	story = 1 
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'Thus, please bring me 100 pieces of dragon leather. Secondly, I will also need 70 behemoth fangs... she likes them too. ...'
  storyMessage[2] = 'So, bring me them. Third, I would need enchanted chicken wings. My dear daugther has always wanted to fly. Bring me two. ...'
  storyMessage[3] = 'Lastly, if you bring me 100 pieces of blue cloth I will be happy to show you how to create this veil. ...'
  storyMessage[4] = 'Did you understand everything I told you and are willing to handle this task?'
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Ah, I see.') 
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('Excellent! Come back to me once you have collected 100 pieces of dragon leather..') 
	setPlayerStorageValue(cid,9830,1)
	setPlayerStorageValue(cid,9824,1)
	talk_state = 0
	
	elseif value1 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'addon') or
	value1 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'outfit') or
	value1 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'dragon leather') then
	selfSay('Have you collected 100 pieces of dragon leather for my daughter?')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Alright.') 
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5877) >= 100 then
	doPlayerRemoveItem(cid,5877,100)
	setPlayerStorageValue(cid,9824,-1)
	setPlayerStorageValue(cid,9825,1)
	selfSay('Very nice. Now, if you could try to obtain those behemoth claws.') 
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have these leathers.') 
	talk_state = 0
	end
	
	elseif value2 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'addon') or
	value2 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'outfit') or
	value2 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'fang') then
	selfSay('Were you able to obtain 70 behemoth fangs?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Alright.') 
	talk_state = 0
	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5893) >= 70 then
	doPlayerRemoveItem(cid,5893,70)
	setPlayerStorageValue(cid,9825,-1)
	setPlayerStorageValue(cid,9826,1)
	selfSay('Finally. I’ll take those, and you’ll go for the two enchanted chicken wings.') 
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have these behemoth fangs.') 
	talk_state = 0
	end
	
	elseif value3 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'addon') or
	value3 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'outfit') or
	value3 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'chicken') then
	selfSay('Have you brought me two enchanted chicken wings as I requested?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Alright.') 
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5891) >= 2 then
	doPlayerRemoveItem(cid,5891,2)
	setPlayerStorageValue(cid,9826,-1)
	setPlayerStorageValue(cid,9827,1)
	selfSay('Wonderful work. Now, all you need to do is gather the 100 pieces of blue cloth so I can show you how to do the veil.') 
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have these enchanted chicken feathers.') 
	talk_state = 0
	end
	
	elseif value4 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'addon') or
	value4 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'outfit') or
	value4 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'cloth') then
	selfSay('Have you collected the 100 pieces of blue cloth as I requested?')
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
	selfSay('Alright then. I have made the veil for you. Thank you for you help and here you go.') 
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have these blue clothes.') 
	talk_state = 0
	end
	
	elseif value5 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'addon') or
	value5 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'outfit') or
	value5 == 1 and getPlayerSex(cid) == 0 and msgcontains(msg,'cloth') then
	selfSay('You have finished my tasks and recieved an outfit.')
	talk_state = 0
	
	elseif value0 == -1 and getPlayerSex(cid) == 1 and msgcontains(msg,'addon') or
	value0 == -1 and getPlayerSex(cid) == 1 and msgcontains(msg,'outfit') then
	selfSay('I can\'t help you, I\'m afraid.')
	talk_state = 0
	
	
	end
	return true
	end
	
	
	
	
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())