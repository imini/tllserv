local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	
		value1 = getPlayerStorageValue(cid,9502)
		value2 = getPlayerStorageValue(cid,9503)
		value3 = getPlayerStorageValue(cid,9504)
		value4 = getPlayerStorageValue(cid,9505)
		value5 = getPlayerStorageValue(cid,9506)
		msg = string.lower(msg)
	if msgcontains(msg,'cucumber') and value1 == 1 or
	msgcontains(msg,'jean') and value1 == 1	then
	selfSay('What is this? Have Jean sent you to give me a sample of the cucumber?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('I thought it all was a joke first.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,7245) >= 1 then
	selfSay('A cucumber, you really wasn\'t joking. I have no need for a stupid cucumber. Get lost, will you? Fool.')
	setPlayerStorageValue(cid,9503,1)
	setPlayerStorageValue(cid,9502,-1)
	talk_state = 0
	else
	selfSay('You don\'t even have a cucumber, ' .. getPlayerName(cid) .. '.')
	talk_state = 0
	end
  end
  return true
  end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
