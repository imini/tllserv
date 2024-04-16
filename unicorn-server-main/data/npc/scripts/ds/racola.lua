local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local storyMessage = {}
local story = 0
local talk_story = 0

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()
	if (os.clock() - talk_story) > 9 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

        end
            
    end
    end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

	value = getPlayerStorageValue(cid,4040)
	msg = string.lower(msg)
	if value == -1 and msgcontains(msg,'white') or
  value == -1 and msgcontains(msg,'teleport') or
  value == -1 and msgcontains(msg,'push') or
  value == -1 and msgcontains(msg,'tile') then
  selfSay('You can go there, I don\'t mind if you die.')
  talk_state = 0
  setPlayerStorageValue(cid,4040,1)
  
  elseif value1 == 1 and msgcontains(msg,'white') or
  value == -1 and msgcontains(msg,'teleport') or
  value == -1 and msgcontains(msg,'push') or
  value == -1 and msgcontains(msg,'tile') then
  selfSay('Go and die, as I told you. It\'s not really my problem.')
  talk_state = 0
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
