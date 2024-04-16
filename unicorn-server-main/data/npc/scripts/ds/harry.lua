local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()
    end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
msg = string.lower(msg)
	if msgcontains(msg, 'amanda') then
			selfSay('Amanda!? DID YOU SAY AMANDA?')
			talk_state = 1

		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then
			   npcHandler:say('THAT BASTARD IS NOT EVEN TO BE MENTIONED IN CASTELDINE!')
			talk_state = 0


			end
		end
		return true
	end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
