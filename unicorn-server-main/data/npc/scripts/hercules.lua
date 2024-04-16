local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}
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
	story = 2
	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 3
	elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
	elseif story == 4 then
    
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

	value0 = getPlayerStorageValue(cid,9743)
	value1 = getPlayerStorageValue(cid,9744)
value2 = getPlayerStorageValue(cid,9745)
value3 = getPlayerStorageValue(cid,9754)
	value4 = getPlayerStorageValue(cid,9755)
value5 = getPlayerStorageValue(cid,9756)
value6 = getPlayerStorageValue(cid,9757)
msg = string.lower(msg)


if value3 == 1 and msgcontains(msg,'birthday') then
selfSay('Ah! A birthday card from my sister! What a delighting sight. May I have it?')
talk_state = 4

elseif talk_state == 4 and msgcontains(msg,'no') then
selfSay('It\'s actually mine, but sure.')
talk_state = 0

elseif talk_state == 4 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,6387) >= 1 then
doPlayerRemoveItem(cid,6387,1)
setPlayerStorageValue(cid,9755,1)
selfSay('Thanks. I want to show my appreciation in return. Therefor, I want you to bring her some money which I have borrowed from her. Are you fine with that?')
talk_state = 5
else
selfSay('You don\'t have it.')
talk_state = 0
end
elseif value4 == 1 and msgcontains(msg,'mission') then
selfSay('I want to bring my sister some money which I have borrowed. Will you do this?')
talk_state = 5

elseif talk_state == 5 and msgcontains(msg,'no') then
selfSay('Fine. Then don\'t.')
talk_state = 0

elseif talk_state == 5 and msgcontains(msg,'yes') then
doPlayerAddItem(cid,2148,23)
setPlayerStorageValue(cid,9756,1)
setPlayerStorageValue(cid,9755,-1)
selfSay('Good. Take this to Gebby. Give her my regards.')
talk_state = 0

elseif value5 == 1 and msgcontains(msg,'mission') then
selfSay('Go to Gebby with the money I gave you.')
talk_state = 0

elseif value6 == 1 and msgcontains(msg,'mission') then
selfSay('I heard you gave the money to Gebby. Thank you.')
talk_state = 0


end
return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "rats") then --you can copy this npc and edit the msg as you want and add the storage of the task. 
	player:setStorageValue(202024,1) -- GrimReaper TaskNpcStorage. from tasks in creaturescripts.
	npcHandler:say("we have an issue with rats in the sewer , I added a task for you in the task window.", cid)
	end
	return true
end
  
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())