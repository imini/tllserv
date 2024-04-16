local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	msg = string.lower(msg)
	if msg == 'heal' then
		healed = false
		if (getCreatureHealth(cid) < 65) then
			doCreatureAddHealth(cid,65  - getCreatureHealth(cid))
			doSendMagicEffect(getThingPos(cid),12)
			selfSay('You are looking bad. I will help you!')
			talkState = 0
			healed = true
		end
		if (getCreatureCondition(cid,1) == 1 or getCreatureCondition(cid,2) == 1 or getCreatureCondition(cid,4) == 1) then
			doCreatureRemoveCondition(cid,1)
			doCreatureRemoveCondition(cid,2)	
			doCreatureRemoveCondition(cid,4)
			doSendMagicEffect(getThingPos(cid),12)
			selfSay('You are looking bad. I will help you!')
			talkState = 0
			healed = true
		end
		if (healed == false) then
			selfSay('You aren\'t looking really bad.')
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())