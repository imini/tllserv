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
	
		value1 = getPlayerStorageValue(cid,9888)
    value2 = getPlayerStorageValue(cid,9707)
    sapvalue1 = getPlayerStorageValue(cid,9452)
    sapvalue2 = getPlayerStorageValue(cid,9453)
    sapvalue3 = getPlayerStorageValue(cid,9454)
    sapvalue4 = getPlayerStorageValue(cid,9455)
    msg = string.lower(msg)
    
    if value1 == 1 and value2 == -1 and msgcontains(msg,'dress pattern') and talk_state ~= 1 and talk_state ~= 2 and talk_state ~= 3 and talk_state ~= 4 then
    selfSay('DRESS FLATTEN? WHO WANTS ME TO FLATTEN A DRESS?')
    talk_state = 1
    
    elseif talk_state == 1 and msgcontains(msg,'dress pattern') then
    selfSay('A PRESS LANTERN? NEVER HEARD ABOUT IT!')
    talk_state = 2
    
    elseif talk_state == 2 and msgcontains(msg,'dress pattern') then
    selfSay('CHESS? I DONT PLAY CHESS!')
    talk_state = 3
    
    elseif talk_state == 3 and msgcontains(msg,'dress pattern') then
    selfSay('A PATTERN IN THIS MESS?? HEY DON\'T INSULT MY MACHINEHALL!')
    talk_state = 4
    
    elseif talk_state == 4 and msgcontains(msg,'dress pattern') then
    selfSay('AH YES! I WORKED ON THE DRESS PATTERN FOR THOSE UNIFORMS. STAINLESS TROUSERS, STEAM DRIVEN BOOTS! ANOTHER MARVEL TO BEHOLD! I\'LL SEND A COPY TO FREYA IMMEDIATELY!')
    setPlayerStorageValue(cid,9707,1)
    setPlayerStorageValue(cid,9888,-1)
    talk_state = 0
    
    elseif value2 == 1 and msgcontains(msg,'dress pattern') then
    selfSay('I SAID IT SENT COPIES TO FREYA.')
    talk_state = 0
    
    elseif (getPlayerStorageValue(cid,9440) == QUEST) and sapvalue1 == -1 and sapvalue2 == -1 and sapvalue3 == -1 and msgcontains(msg,'bomb') then
    selfSay('DO YOU WANT ME TO CREATE A BOMB?')
    talk_state = 5
    
    elseif talk_state == 5 and msgcontains(msg,'no') then
    selfSay('OK!')
    talk_state = 0
    
    elseif talk_state == 5 and msgcontains(msg,'yes') then
    selfSay('HEHE, WHAT ARE YOU GONNA DO WITH A BOMB? HEHE! I WON\'T ASK, IF YOU DO ME A FAVOUR!')
    talk_state = 6
    
    elseif talk_state == 6 and msgcontains(msg,'favour') then
    selfSay('YUP! I NEED THE REPORT DOCUMENT FROM A GUY DOWN IN THE MINES THAT\'S WORKING WITH SOME TECHNICAL STUFF! BRING IT!')
    setPlayerStorageValue(cid,9453,1)
    talk_state = 0
    
    elseif sapvalue1 == -1 and sapvalue2 == 1 and sapvalue3 == -1 and msgcontains(msg,'bomb') or
    sapvalue1 == -1 and sapvalue2 == 1 and sapvalue3 == -1 and msgcontains(msg,'document') or
    sapvalue1 == -1 and sapvalue2 == 1 and sapvalue3 == -1 and msgcontains(msg,'report') then
    selfSay('YOU GOT THE REPORT DOCUMENTS FROM THE MINES?')
    talk_state = 7
    
    elseif talk_state == 7 and msgcontains(msg,'no') then
    selfSay('OK!')
    talk_state = 0
    
    elseif talk_state == 7 and msgcontains(msg,'yes') then
    if getPlayerItemCount(cid,6124) >= 1 then
    selfSay('OK! THANK YOU! HERE, I PREPARED THIS PACKAGE FOR YOU. BE CAREFUL, THE BOMB INSIDE IT IS FRAGILE!')
    setPlayerStorageValue(cid,9454,1)
    doPlayerRemoveItem(cid,6124,1)
    doPlayerAddItem(cid,6115,1)
    talk_state = 0
    else
    talk_state = 0
    selfSay('NO, CAN\'T SEE IT!!')
    end
    
    elseif sapvalue1 == -1 and sapvalue2 == 1 and sapvalue3 == 1 and msgcontains(msg,'bomb') then
    selfSay('YOU HAVE RECIEVED THE BOMB ALREADY!!')
    talk_state = 0
    
    end
    return true
    end
function greetCallback(cid)
	if(getPlayerStorageValue(cid,9888) == QUEST) or (getPlayerStorageValue(cid,9440) == QUEST) then
		return true
	else
	
			npcHandler:say('I CAN\'T HEAR YOU IN THIS NOICE! LEAVE ME ALONE NOW!')
		return false
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'WHAT DO YOU WANT ME?')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())


