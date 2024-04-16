local QUEST = 2
local playerPos = getPlayerPosition(cid)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


local storyMessage = {}
local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
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
-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	msg = string.lower(msg)
			value1 = getPlayerStorageValue(cid,4304)
	value2 = getPlayerStorageValue(cid,9612)
	value3 = getPlayerStorageValue(cid,9613)
	if getPlayerStorageValue(cid,9543) == 3 and msgcontains(msg,'report') and talk_state ~= 1 then
	selfSay('Meep? I mean - hello! Sorry... Being a rat has kind of grown on me.')
  talk_state = 1
  
  elseif getPlayerStorageValue(cid,9543) == 3 and msgcontains(msg,'report') then
	selfSay('You have come for the report? Great! I have been working hard on it during the last months. And nobody came to pick it up. I thought everybody had forgotten about me! ...')
  story = 1
  talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'Do you have any idea how difficult it is to hold a pen when you have claws instead of hands? ...'          
	storyMessage[2] = 'But - you know - now I have worked so hard on this report I somehow don\'t want to part with it. Atleast not without some decent payment. ...'
	storyMessage[3] = 'All right - listen - I know Fa\'hadir would not approve of this, but I can\'t help it. I need some cheese! I need it now! ...'
	storyMessage[4] = 'And I will not give the report to you until you get me some! Meep!'
	setPlayerStorageValue(cid,9543,4)
	
	elseif getPlayerStorageValue(cid,9543) == 4 and msgcontains(msg,'report') then
	selfSay('Ok, have you brought me the cheese, I\'ve asked for?')
  talk_state = 2
  
  elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Then... meep!')
  talk_state = 0
  
  elseif talk_state == 2 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,2696) >= 1 then
	selfSay('Meep! Meep! Great! Here is the spyreport for you!')
	doPlayerRemoveItem(cid,2696,1)
  doPlayerAddItem(cid,2345,1)
  setPlayerStorageValue(cid,9543,5)
  talk_state = 0
  else
  selfSay('You don\'t have any cheese.')
  talk_state = 0
  end
  
  elseif value3 == 1 and msgcontains(msg,'report') then
	selfSay('You\'ve had it already. Meep.')
  talk_state = 0
  
end
return true
end
function greetCallback(cid)
	if getPlayerStorageValue(cid,9543) > QUEST) then
		npcHandler:say('Meep.')
		return false
	else
		return true
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'Meep!?')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())


