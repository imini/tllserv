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
	
	value0 = getPlayerStorageValue(cid,9647)
	value1 = getPlayerStorageValue(cid,9648)
	value2 = getPlayerStorageValue(cid,9649)
	value3 = getPlayerStorageValue(cid,9650)
	value4 = getPlayerStorageValue(cid,9651)
	value5 = getPlayerStorageValue(cid,9652)
  msg = string.lower(msg)
	if msgcontains(msg, 'quest') and value0 == -1 or 
	msgcontains(msg, 'mission') and value0 == -1 then
  selfSay('Ok, goblin have need help from human. Me need report from friend goblins from friends homes. Human understand so far?')
  talk_state = 1

	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Human stupid.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Good. First, need you talk to me friend Blidipsteram from far north and west of Celeres town of human. Say report. Then come. Ok?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Human stupid.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Good again. Me wait.')
	setPlayerStorageValue(cid,9647,1)
	setPlayerStorageValue(cid,9648,1)
	talk_state = 0
	
	elseif msgcontains(msg, 'quest') and value1 == 1 or 
	msgcontains(msg, 'mission') and value1 == 1 then
  selfSay('Go north and west from human town Celeres and say report to Blidipsteram. Then come.')
  talk_state = 0
  
  elseif msgcontains(msg, 'quest') and value2 == 1 or 
	msgcontains(msg, 'mission') and value2 == 1 then
  selfSay('Good. Thanks report from Blidipsteram. Now need report from Damblidirp from east of human town Casteldine. Ok, understand?')
  talk_state = 3
  
  elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Human stupid.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('Good again. Me wait.')
	setPlayerStorageValue(cid,9649,-1)
	setPlayerStorageValue(cid,9650,1)
	talk_state = 0
	
	elseif msgcontains(msg, 'quest') and value3 == 1 or 
	msgcontains(msg, 'mission') and value3 == 1 then
  selfSay('You go Damblidirp, live in east of human town Casteldine, say report.')
  talk_state = 0

  elseif msgcontains(msg, 'quest') and value4 == 1 or 
	msgcontains(msg, 'mission') and value4 == 1 then
		if getPlayerFreeCap(cid) > 185 then
  selfSay('Thank report from Damblidirp. Now done. Take this. Thank human from me. Bye. No more help.')
  setPlayerStorageValue(cid,9651,-1)
	setPlayerStorageValue(cid,9652,1)
	bag = doPlayerAddItem(cid,1997,1)
	doAddContainerItem(bag,2463,1)
	doAddContainerItem(bag,2480,1)
	doAddContainerItem(bag,2647,1)
  talk_state = 0
else
talk_state = 0
selfSay('You are too weak too carry reward of mine. Sorry. Come later. With cap. Ok.')
end
  
  elseif msgcontains(msg, 'quest') and value5 == 1 or 
	msgcontains(msg, 'mission') and value5 == 1 then
  selfSay('Is need no more help. Thank human. Now bye. No talk. Human scary.')
  talk_state = 0
  
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())