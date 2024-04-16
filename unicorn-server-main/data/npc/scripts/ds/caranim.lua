local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink()						 npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
msg = string.lower(msg)
			if msgcontains(msg, 'the spark of the phoenix') or msgcontains(msg, 'spark of the phoenix')then
			selfSay('I can grant you this blessing, but only for 10000 gold. It will reduce your death penalty by one percent. Are you interested in that, ' .. getPlayerName(cid) .. '?')
			talk_state = 4


		elseif talk_state == 4 then
		if msgcontains(msg, 'yes') then
		if getPlayerBlessing(cid, talk_state) then
		selfSay('A god has already blessed you with this blessing.')
		else
		if doPlayerRemoveMoney(cid, 10000) == 1 then
		doPlayerAddBlessing(cid, talk_state)
		selfSay('You have been blessed by one of the five gods!')
		else
		selfSay('You don\'t have enough money.')
				end
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
