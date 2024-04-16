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
	elseif story == 2 then
    
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
	
	value0 = getPlayerStorageValue(cid,1644)
	value1 = getPlayerStorageValue(cid,4340)
  value2 = getPlayerStorageValue(cid,4341)
  value3 = getPlayerStorageValue(cid,4342)
  value4 = getPlayerStorageValue(cid,4343)
  value5 = getPlayerStorageValue(cid,4344)
  value6 = getPlayerStorageValue(cid,4345)
  value7 = getPlayerStorageValue(cid,4346)
  value8 = getPlayerStorageValue(cid,4347)
  msg = string.lower(msg)
  
  if value7 == 1 and msgcontains(msg,'merwigo') then
	selfSay('I can\'t understand... you defeated him.')
	talk_state = 0
	
	elseif value7 == 1 and msgcontains(msg,'hesperides') then
	selfSay('He is dead. Thanks to you. Fool.')
	talk_state = 0
	
	elseif value7 == 1 and msgcontains(msg,'hr\'hehn') then
	selfSay('You have slayed him. It\'s incredible.')
	talk_state = 0
  
	elseif value0 == -1 and msgcontains(msg,'merwigo') then
	selfSay('Be aware of him. His fighting techniques are devastating. Only a fool would like to enter his sanctuary.')
	talk_state = 1
	
	elseif value0 == -1 and msgcontains(msg,'hr\'hehn') then
	selfSay('Don’t you dare speaking his name with your dirty tongue, filthy fool.')
	talk_state = 0
	
	elseif value0 == -1 and msgcontains(msg,'hesperides') then
	selfSay('You shouldn’t mention that.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'sanctuary') or
	talk_state == 1 and msgcontains(msg,'fool') then
	selfSay('Are you a fool?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('I thought so.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Well, not only that, you are crazy too! Well then, fool, go and face him! HAHAHA!')
	talk_state = 0
	setPlayerStorageValue(cid,1644,1)
	setPlayerStorageValue(cid,4340,1)	

	elseif value1 == 1 and msgcontains(msg,'merwigo') then
	selfSay('Go and face him, then will you understand the power of him.')
	talk_state = 0
	
	elseif value1 == 1 and msgcontains(msg,'hr\'hehn') then
	selfSay('Don’t you dare speaking his name with your dirty tongue, filthy fool.')
	talk_state = 0
	
	elseif value1 == 1 and msgcontains(msg,'hesperides') then
	selfSay('You shouldn’t mention that.')
	talk_state = 0
	
	
	elseif value2 == 1 and msgcontains(msg,'merwigo') then
	selfSay('What is this? Are you a demon? How could you escape the great Merwigo? Well then, you are in for a surprise then. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'Merwigo is nothing compared to his master Hesperides. Go to his dreadful territory and die, idiotic fool.'  
  setPlayerStorageValue(cid,4341,-1)
	setPlayerStorageValue(cid,4342,1)    
	talk_state = 0
	
	elseif value2 == 1 and msgcontains(msg,'hr\'hehn') then
	selfSay('You shouldn’t mention that.')
	talk_state = 0
	

	
	elseif value3 == 1 and msgcontains(msg,'merwigo') then
	selfSay('I can\'t understand... you defeated him.')
	talk_state = 0
	
	elseif value3 == 1 and msgcontains(msg,'hesperides') then
	selfSay('Go and die by the great Hesperides, fool.')
	talk_state = 0
	
	elseif value3 == 1 and msgcontains(msg,'hr\'hehn') then
	selfSay('You shouldn’t mention that.')
	talk_state = 0
	

	
	elseif value4 == 1 and msgcontains(msg,'hesperides') then
	selfSay('NO! YOU ARE NOT ALIVE!!! HOW CAN THIS BE!? ...')
	story = 2
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[2] = 'You are nothing but a fool! I will grant you access to Hr’Hehns lethal pit. Go there human, and face the true evil in our world... and don’t you dare come back alive!'  
  setPlayerStorageValue(cid,4343,-1)
	setPlayerStorageValue(cid,4344,1)    
	talk_state = 0
	
	elseif value4 == 1 and msgcontains(msg,'merwigo') then
	selfSay('I can\'t understand... you defeated him.')
	talk_state = 0
	

	
	elseif value5 == 1 and msgcontains(msg,'merwigo') then
	selfSay('I can\'t understand... you defeated him.')
	talk_state = 0
	
	elseif value5 == 1 and msgcontains(msg,'hesperides') then
	selfSay('He is dead. Thanks to you. Fool.')
	talk_state = 0
	
	elseif value5 == 1 and msgcontains(msg,'hr\'hehn') then
	selfSay('Go and die, but never return alive.')
	talk_state = 0

	
	elseif value6 == 1 and msgcontains(msg,'hr\'hehn') then
	selfSay('What in the sake of great Zathroth is this? I must say, although it tears my mind just to think about it, I am impressed. You are truly one strong and brave warrior. Take this treasure, and never return the shame upon us. I don’t wish to see you anymore... ever!')
  setPlayerStorageValue(cid,4345,-1)
	setPlayerStorageValue(cid,4346,1) 
	setPlayerStorageValue(cid,4340,1)  
	setPlayerStorageValue(cid,4342,1)  
	setPlayerStorageValue(cid,4344,1) 
	doPlayerAddItem(cid,2487,1) 
	talk_state = 0
	
	elseif value6 == 1 and msgcontains(msg,'merwigo') then
	selfSay('I can\'t understand... you defeated him.')
	talk_state = 0
	
	elseif value6 == 1 and msgcontains(msg,'hersperides') then
	selfSay('He is dead now, thanks to you, you stupid fool.')
	talk_state = 0
	

	

	
	
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

