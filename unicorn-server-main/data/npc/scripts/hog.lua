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

	if msgcontains(msg, 'fallmore') or msgcontains(msg, 'fallmore point') then
			selfSay('It might be a rather small island, but hell so pleasant. There\'s very much to do here, I can assure you. I have a few examples... would you like to hear?')
			talk_state = 1
		elseif talk_state > 0 then
			if msgcontains(msg, 'yes') then
					selfSay('In the east you may find the useful training area aswell as the tough Arena Challenge. Also, an old outlaw living in the mountains in the west is said to be able to promote people. Additionally, old Roy Hawke probably has some missions for a vigorous adventurer like you. And if that wouldn\'t be enough, there\'s countless of monsters to fight all of this island.')
				talk_state = 0
				elseif msgcontains(msg, 'no') then
				selfSay('No problems, you\'ll probably bump into them sooner or later.')
				talk_state = 0
			end
		end

	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())