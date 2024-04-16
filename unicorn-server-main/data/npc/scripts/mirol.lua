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
	  msg = string.lower(msg)
		bizrevalue1 = getPlayerStorageValue(cid,9761)
		value2 = getPlayerStorageValue(cid,9762)
		if bizrevalue1 == 1 and value2 == -1 and msgcontains(msg,'payment') then
		selfSay('Indeed, I have not been able to reach our friend Bizre to give him his payment. Anyway, are you going to collect it for him?')
		talk_state = 1
		
		elseif talk_state == 1 and msgcontains(msg,'no') then
		selfSay('Fine.')
		talk_state = 0
		
		elseif talk_state == 1 and msgcontains(msg,'yes') then
		selfSay('Here. This is the agreed payment. Bring it to Bizre.')
		doPlayerAddItem(cid,5951,1)
		setPlayerStorageValue(cid,9762,1)
		setPlayerStorageValue(cid,9759,-1)
		setPlayerStorageValue(cid,9760,-1)
		setPlayerStorageValue(cid,9761,-1)
		talk_state = 0
		
		elseif bizrevalue1 == 1 and value2 == 1 and msgcontains(msg,'payment') then
		selfSay('I did tell you to bring the agreed payment to Bizre, didn\'t I?')
		talk_state = 0
    
    end
    return true
    end
function greetCallback(cid)
	if(getPlayerStorageValue(cid,9761) < QUEST) then
		npcHandler:say('I don\'t have to talk to you!')
		return false
	else
		return true
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'Hi, human friend of Bizre.')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())


