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
	
  value1 = getPlayerStorageValue(cid,9875)
	value2 = getPlayerStorageValue(cid,9876)
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
	
	if value1 == 1 and msgcontains(msg,'stake') and value2 == -1 then
 selfSay('Yes, I was informed what to do. Are you prepared to receive my line of the prayer?')
 talk_state = 1
 
 elseif talk_state == 1 and msgcontains(msg,'no') then
 selfSay('As you wish.')
 talk_state = 0
 
 elseif talk_state == 1 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5941) >= 1 then
 selfSay('So receive my prayer: \'Peace shall fill your soul - evil shall be cleansed\'. Now, bring your stake to Ya-Bint-Al-Hawa in the Tha\'Reen temple for the next line of the prayer. I will inform him what to do.')
 setPlayerStorageValue(cid,9876,1)
 talk_state = 0
 else
 selfSay('You should at least bring the stake.')
 talk_state = 0
 end
 
 elseif value2 == 1 and msgcontains(msg,'stake') then
 selfSay('I told you to continue to Ya-Bint-Al-Hawa in Tha\'Reen for the next line of prayer.')
 talk_state = 0
 end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())