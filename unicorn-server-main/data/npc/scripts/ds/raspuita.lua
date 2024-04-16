local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

	value = getPlayerStorageValue(cid,2384)
msg = string.lower(msg)
	if msgcontains(msg, 'member') then
	if value == -1 then
			selfSay('Members get certain advantages in our library – they have access to the secret books in the sealed section, for example. Would you like to join?')
			talk_state = 1
		else
			selfSay('You already have access to our secret books.')
			talk_state = 0
		end
		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then
			   npcHandler:say('It’s easily arranged. I will need a fee of 350 gold coins from you, it’s the subscription. Have you got 350 coins?')
			talk_state = 2
end
		elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
			if doPlayerRemoveMoney(cid,350) == 1 then
			  selfSay('Very well, you are now member of our excellent library – enter the sealed section anytime.')
			setPlayerStorageValue(cid,2384,1)
			talk_state = 0
			else
			selfSay('Come back when you have the money.')
			talk_state = 0


			end
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
