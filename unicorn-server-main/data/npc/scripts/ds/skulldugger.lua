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
function onThink() npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 9 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

        end
            
    end
    return true
    end
    npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	
value1 = getPlayerStorageValue(cid,9938)
value2 = getPlayerStorageValue(cid,9939)
value3 = getPlayerStorageValue(cid,9937)
msg = string.lower(msg)

if msgcontains(msg,'bucket') and value1 == -1 and value3 == 1 then
selfSay('You want buy bucket? Me no have bucket. Want buy water skin inn stead?')
talk_state = 1

elseif msgcontains(msg,'bucket') and value1 == 1 then
selfSay('You buy all ready.')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('Oh.')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2152) >= 3 or getPlayerItemCount(cid,2148) >= 300 or getPlayerItemCount(cid,2160) >= 1 then
unt = doPlayerAddItem(cid,7286,1)
doSetItemSpecialDescription(unt,"It can be used to withhold mud.")
setPlayerStorageValue(cid,9938,1)
doPlayerRemoveMoney(cid,300)
npcHandler:say('Here. Take.')
talk_state = 0
else
selfSay('You no have money.')
talk_state = 0

end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
