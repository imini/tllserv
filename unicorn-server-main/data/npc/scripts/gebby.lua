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
	

	value0 = getPlayerStorageValue(cid,9753)
	value1 = getPlayerStorageValue(cid,9754)
	value2 = getPlayerStorageValue(cid,9755)
	value3 = getPlayerStorageValue(cid,9756)
	value4 = getPlayerStorageValue(cid,9757)
	msg = string.lower(msg)
	if msgcontains(msg,'mission') and value0 == -1 then
	selfSay('Are you willing to do a little favour for me?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Alright. It\'s of course your choice.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Good. You see, it\'s a special day today. It\'s my brother Hercules\' birthday. I would like to congratulate him, but I must take care of the shop and all my customers. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'I have obtained a birthday card which I would like you do give to him. Can you do this for me?'
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Alright. It\'s of course your choice.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Good. Walk straight to him, and give him this. And don\'t lose it!')
	setPlayerStorageValue(cid,9753,1)
	setPlayerStorageValue(cid,9754,1)
	doPlayerAddItem(cid,6387,1)
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value1 == 1 then
	selfSay('Go and leave the birthday card to Hercules.')
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value3 == 1 or 
	msgcontains(msg,'money') and value3 == 1 then
	selfSay('Do you have the money hercules borrowed from me?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Oh.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2148) >= 23 then
	selfSay('Thank you. I suppose you want something in return now. Here, why don\'t you take this rapier.')
	doPlayerAddItem(cid,2384,1)
	setPlayerStorageValue(cid,9756,-1)
	setPlayerStorageValue(cid,9754,-1)
	setPlayerStorageValue(cid,9757,1)
	talk_state = 0
	else
	selfSay('You don\'t have the money.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'mission') and value4 == 1 then
	selfSay('You have helped me enough already. Thanks, again.')
	talk_state = 0
	
  end
  return true
  end
  
function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "skeletons") then --you can copy this npc and edit the msg as you want and add the storage of the task. 
	player:setStorageValue(202036,1) -- GrimReaper TaskNpcStorage. from tasks in creaturescripts.
	npcHandler:say("I really hope you get something useful from them! I added a task for you in the task window.", cid)
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())