local QUEST = 1
local playerPos = getPlayerPosition(cid)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()

    end
-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	
		value1 = getPlayerStorageValue(cid,9650)
    value2 = getPlayerStorageValue(cid,9651)
    msg = string.lower(msg)
    if value1 == 1 and value2 == -1 and msgcontains(msg,'report') then
    selfSay('Is human want report for Refregotisap and in report say what is going on?')
    talk_state = 1
    
    elseif talk_state == 1 and msgcontains(msg,'no') then
    selfSay('Ok, ok.')
    talk_state = 0
    
    elseif talk_state == 1 and msgcontains(msg,'yes') then
    selfSay('Ok. Wait. Send runner. Human, no need go. No scare friend. Now go. Bye. Is scary.')
    talk_state = 0
    setPlayerStorageValue(cid,9650,-1)
    setPlayerStorageValue(cid,9651,1)
    
    end
    return true
    end
function greetCallback(cid)
	if(getPlayerStorageValue(cid,9650) < QUEST) then
		npcHandler:say('Me is afraid human, no talk!')
		return false
	else
		return true
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'What want me you?')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())


