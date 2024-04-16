local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink()						 npcHandler:onThink() end
-- OTServ event handling functions end


--------------------------------- Blessing ---------------------------------


function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

	value1 = getPlayerStorageValue(cid,4313)
	msg = string.lower(msg)

			if msgcontains(msg, 'djinns') and getPlayerStorageValue(cid,9542) == 2 or
			msgcontains(msg, 'supplies') and getPlayerStorageValue(cid,9542) == 2 then
			selfSay('Yeh sure, why not boast a little... I\'m already stuck here so what does it matter. Well, I\'ll tell you, ' .. getPlayerName(cid) .. ', I stole much things from those stupid djinns. It was an easy theft!')
			setPlayerStorageValue(cid,9542,3)
			talk_state = 0


		end
		return true
	end





npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
