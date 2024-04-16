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
		if getCreatureHealth(cid) < 65 then
		doCreatureAddHealth(cid,65  - getCreatureHealth(cid))
		selfSay('I will heal you then!')
		doSendMagicEffect(getThingPos(cid),12)
		talkState = 0
		else
		selfSay('You are not hurt.')
		talkState = 0
		end
	end
	
	if value1 == 1 and msgcontains(msg,'stake') and value2 == -1 then
 npcHandler:say('Yes, I was informed what to do. Are you prepared to receive my line of the prayer?')
 talk_state = 1
 
 elseif talk_state == 1 and msgcontains(msg,'no') then
 npcHandler:say('As you wish.')
 talk_state = 0
 
 elseif talk_state == 1 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5941) >= 1 then
 npcHandler:say('So receive my prayer: \'Peace shall fill your soul - evil shall be cleansed\'. Now, bring your stake to Ya-Bint-Al-Hawa in the Tha\'Reen temple for the next line of the prayer. I will inform him what to do.')
 setPlayerStorageValue(cid,9876,1)
 talk_state = 0
 else
 npcHandler:say('You should at least bring the stake.')
 talk_state = 0
 end
 
 elseif value2 == 1 and msgcontains(msg,'stake') then
 npcHandler:say('I told you to continue to Ya-Bint-Al-Hawa in Tha\'Reen for the next line of prayer.')
 talk_state = 0
 end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
