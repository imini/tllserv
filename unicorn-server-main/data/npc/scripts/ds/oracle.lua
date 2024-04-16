local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local LEVEL = 8

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
  npcHandler:say(storyMessage[story])
  talk_start = os.clock()
  talk_story = os.clock()
	story = 2
	
	elseif story == 2 then   
  npcHandler:say(storyMessage[story])
  talk_start = os.clock()
  talk_story = os.clock()
	story = 0

end
end
return true
end
npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)

function creatureSayCallback(cid, type, msg)
if(npcHandler.focus ~= cid) then
return false
end

--Values	

--Variables
msg = string.lower(msg)
sex = getPlayerSex(cid)
lvl = getPlayerLevel(cid)
vocation = getPlayerVocation(cid)
local newpos = {x=829,y=737,z=6}
	
--Script	
if msgcontains(msg,'casteldine') and lvl < LEVEL then
selfSay('This place is only for people who are stronger than you.')
talk_state = 0

elseif msgcontains(msg,'casteldine') and lvl >= LEVEL then
selfSay('So, to Casteldine you will go. But before that I will ask you a very important question which you carefully must consider before answering. Do you wish to proceed?')
talk_state = 2

elseif msgcontains(msg,'yes') and talk_state == 2 then
selfSay('You may choose a vocation before I teleport you to Casteldine. The alternatives are the nimble paladin, the helpful druid, the strong knight and lastly the powerful sorcerer. Tell me your choice.')
talk_state = 3

elseif msgcontains(msg,'no') and talk_state == 2 then
selfSay('This question is unavoidable sooner or later, ' .. getPlayerName(cid) ..'.')
talk_state = 2 

--Sorcerer

elseif msgcontains(msg,'sorcerer') and talk_state == 3 then
selfSay('A powerful sorcerer, yes? Very well. Now, are you really sure you wish to proceed? This decision is irreversable.')
talk_state = 4

elseif msgcontains(msg,'yes') and talk_state == 4 then
selfSay('Bye, ' .. getPlayerName(cid) .. '.')
doPlayerSetTown(cid,1)
doSendMagicEffect(getThingPos(cid),10)
doTeleportThing(cid,newpos,0)
doSendMagicEffect(newpos,13)
doPlayerSetVocation(cid,1)
talk_state = 0

elseif msgcontains(msg,'no') and talk_state == 4 then
selfSay('I understand.')
talk_state = 0

--Druid

elseif msgcontains(msg,'druid') and talk_state == 3 then
selfSay('A helpful druid, yes? Very well. Now, are you really sure you wish to proceed? This decision is irreversable.')
talk_state = 5

elseif msgcontains(msg,'yes') and talk_state == 5 then
selfSay('Bye, ' .. getPlayerName(cid) .. '.')
doPlayerSetTown(cid,1)
doSendMagicEffect(getThingPos(cid),10)
doTeleportThing(cid,newpos,0)
doSendMagicEffect(newpos,13)
doPlayerSetVocation(cid,2)
talk_state = 0

elseif msgcontains(msg,'no') and talk_state == 5 then
selfSay('I understand.')
talk_state = 0

--Paladin

elseif msgcontains(msg,'paladin') and talk_state == 3 then
selfSay('A nimble paladin, yes? Very well. Now, are you really sure you wish to proceed? This decision is irreversable.')
talk_state = 6

elseif msgcontains(msg,'yes') and talk_state == 6 then
selfSay('Bye, ' .. getPlayerName(cid) .. '.')
doPlayerSetTown(cid,1)
doSendMagicEffect(getThingPos(cid),10)
doTeleportThing(cid,newpos,0)
doSendMagicEffect(newpos,13)
doPlayerSetVocation(cid,3)
talk_state = 0

elseif msgcontains(msg,'no') and talk_state == 6 then
selfSay('I understand.')
talk_state = 0

--Knight

elseif msgcontains(msg,'knight') and talk_state == 3 then
selfSay('A strong knight, yes? Very well. Now, are you really sure you wish to proceed? This decision is irreversable.')
talk_state = 7

elseif msgcontains(msg,'yes') and talk_state == 7 then
selfSay('Bye, ' .. getPlayerName(cid) .. '.')
doPlayerSetTown(cid,1)
doSendMagicEffect(getThingPos(cid),10)
doTeleportThing(cid,newpos,0)
doSendMagicEffect(newpos,13)
doPlayerSetVocation(cid,4)
talk_state = 0

elseif msgcontains(msg,'no') and talk_state == 7 then
selfSay('I understand.')
talk_state = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
