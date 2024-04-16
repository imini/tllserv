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
function onThink() npcHandler:onThink()
	if (os.clock() - talk_story) > 9 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

        end
            
    end
    end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	value1 = getPlayerStorageValue(cid,9885)
	value2 = getPlayerStorageValue(cid,9899)
	msg = string.lower(msg)
	if value1 == 1 and value2 == -1 and msgcontains(msg,'present') then
	selfSay('Huh? Have you got a present for me?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Oh well.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2331) >= 1 then
	doPlayerRemoveItem(cid,2331,1)
	setPlayerStorageValue(cid,9899,1)
	selfSay('Wow. Who could have given me this. Thank you.')
	talk_state = 0
	else
	selfSay('Well, you don\'t have any presents...')
	talk_state = 0
	end
	
	elseif value2 == 1 and msgcontains(msg,'present') then
	selfSay('You have already given me a present. How\'s the memory?')
	end
	return true
	end
	
	
	
	
	
	
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())