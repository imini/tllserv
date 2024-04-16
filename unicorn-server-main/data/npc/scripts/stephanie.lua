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
	
	value1 = getPlayerStorageValue(cid,9897)
	msg = string.lower(msg)
	
	stephanievalue = getPlayerStorageValue(cid,9719)
	value20 = getPlayerStorageValue(cid,9712)
	
	if value20 == 1 and stephanievalue == -1 and msgcontains(msg,'measurements') then
	selfSay('I have more urgent problem to attend than that. Those hawks are hunting my carrier pigeons. Bring me 12 arrows and I\'ll see if I have the time for this nonsense. Do you have 12 arrows with you?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Okay. Come back when you have if you want to know my measurements.')
	talk_state = 0
	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2544) >= 12 then
	doPlayerRemoveItem(cid,2544,12)
	setPlayerStorageValue(cid,9719,1)
	selfSay('Great! Now I\'ll teach them a lesson... for those measurements... <tells you her measurements>')
	talk_state = 0
	else
	selfSay('You don\'t have enough arrows.')
	talk_state = 0
	end
  
	
	elseif stephanievalue == 1 and msgcontains(msg,'measurements') then
	selfSay('I have told you my measurements already.')


end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())