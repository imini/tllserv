local talk_story = 0 --The time limit, set it to 0
local story = 0 --To add more lines, set it to 0
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
local value = getPlayerStorageValue(cid,4355)
msg = string.lower(msg)
	if msgcontains(msg, 'ticket') and value == -1 then
			selfSay('Would you like to enter the Fighting Pit? It\'s only 25 gold coins.')
			talk_state = 1
			else
			selfSay('I\'ve already granted you access to the Fighting Pit.')
    end
		if talk_state == 1 then
			if msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,2152)  >= 1 or getPlayerItemCount(cid,2148)  >= 25 or getPlayerItemCount(cid,2160)  >= 1 then
			doPlayerRemoveMoney(cid,25)
			setPlayerStorageValue(cid,4355,1)
			   npcHandler:say('Just enter the door to the dresser room, then go via the teleport.')
			talk_state = 0
			else
				selfSay('Your money is not enough.')
			talk_state = 0
      end

				elseif msgcontains(msg, 'no') then
				selfSay('Ehm... okey.')
				talk_state = 0
			end
		end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
