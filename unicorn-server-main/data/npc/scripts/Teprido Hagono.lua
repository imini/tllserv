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
	
	msg = string.lower(msg)
	if msgcontains(msg, 'godslayer') then
	selfSay('The Godslayer\'s history is very interesting. A complete story can be read in the castle\'s library, but I can give you a brief overview. ...')
	story = 1
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[1] = 'The Godslayer was once in time forged by the Archdemons, and its journey afterwards was dark and filled with death and decay. ...'
			storyMessage[2] = 'Eventually, it ended up where it started, at the Archdemons... but that is not confirmed, really, it\'s just what we believe.'
			talk_state = 0
	end
	return true
	end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())