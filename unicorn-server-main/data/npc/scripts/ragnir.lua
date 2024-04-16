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
	
	msg = string.lower(msg)
	value1 = getPlayerStorageValue(cid,9709)
	value2 = getPlayerStorageValue(cid,9891)
	
	if value1 == -1 and value2 == 1 and msgcontains(msg,'sniff banana skin') then
	if getPlayerItemCount(cid,2219) >= 1 then
	selfSay('<sniff> <sniff>')
	talk_state = 1
	else
	selfSay('Wof?')
	talk_state = 0
	end
	
	elseif talk_state == 1 and msgcontains(msg,'do you like that') then
	selfSay('Woof!')
	talk_state = 0
	
	elseif value1 == -1 and value2 == 1 and msgcontains(msg,'sniff dirty fur') then
	if getPlayerItemCount(cid,2220) >= 1 then
	selfSay('<sniff> <sniff>')
	talk_state = 2
	else
	selfSay('Wof?')
	talk_state = 0
	end
	
	elseif talk_state == 2 and msgcontains(msg,'do you like that') then
	selfSay('Woof!')
	talk_state = 0
	
	elseif value1 == -1 and value2 == 1 and msgcontains(msg,'sniff moldy cheese') then
	if getPlayerItemCount(cid,2235) >= 1 then
	selfSay('<sniff> <sniff>')
	talk_state = 3
	else
	selfSay('Wof?')
	talk_state = 0
	end
	
	elseif talk_state == 3 and msgcontains(msg,'do you like that') then
	selfSay('Meeep! Grrrrr! <spits>')
	setPlayerStorageValue(cid,9709,1)
	setPlayerStorageValue(cid,9891,-1)
	talk_state = 0

	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())