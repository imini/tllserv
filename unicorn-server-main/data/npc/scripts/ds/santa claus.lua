local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local QUEST = 1
local storyMessage = {}
local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 3 and story > 0 then
    
         if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	talk_state = 3
	story = 0

         elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	talk_state = 0
	story = 0

         elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	talk_state = 0
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

value = getPlayerStorageValue(cid,9474)
msg = string.lower(msg)
sex = getPlayerSex(cid)
rand = math.random(1,98)
 
if talk_state == 1 and msgcontains(msg,'no') and sex == 1 then
selfSay('Bad boy!')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'no') and sex == 0 then
selfSay('Bad girl!')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'yes') then
selfSay('Good, good. Do you want a present, too?')
talk_state = 2

elseif talk_state == 2 and msgcontains(msg,'no') then
selfSay('But... you deserve one.')
talk_state = 0

elseif talk_state == 2 and msgcontains(msg,'yes') then
if rand >= 1 and rand <= 8 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2674,15)
setPlayerStorageValue(cid,9474,1)

elseif rand >= 9 and rand <= 17 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2675,10)
setPlayerStorageValue(cid,9474,1)

elseif rand >= 18 and rand <= 27 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2687,8)
setPlayerStorageValue(cid,9474,1)

elseif rand >= 28 and rand <= 36 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2688,8)
setPlayerStorageValue(cid,9474,1)

elseif rand >= 37 and rand <= 44 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,6572,1)
setPlayerStorageValue(cid,9474,1)
			
elseif rand >= 45 and rand <= 55 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,6501,8)
setPlayerStorageValue(cid,9474,1)
			
elseif rand >= 56 and rand <= 64 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,6579,1)
setPlayerStorageValue(cid,9474,1)			

elseif rand >= 65 and rand <= 70 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,6567,1)
setPlayerStorageValue(cid,9474,1)		

elseif rand >= 71 and rand <= 77 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2114,1)
setPlayerStorageValue(cid,9474,1)		
			
elseif rand >= 78 and rand <= 86 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2111,5)
setPlayerStorageValue(cid,9474,1)

elseif rand >= 87 and rand <= 88 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2113,1)
setPlayerStorageValue(cid,9474,1)		

elseif rand >= 89 and rand <= 96 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2110,1)
setPlayerStorageValue(cid,9474,1)	

elseif rand >= 97 and rand <= 98 then
selfSay('Merry christmas, ' .. getPlayerName(cid) .. '!')
talk_state = 0
bag = doPlayerAddItem(cid,1990,1)
doAddContainerItem(bag,2112,1)
setPlayerStorageValue(cid,9474,1)		
end

elseif value == 1 and msgcontains(msg,'present') then
selfSay('You have already recieved a present.')
talk_state = 0
			
end
return true
end
	
function sayMessage(cid, message, keywords, parameters)     return npcHandler:defaultMessageHandler(cid, message, keywords, parameters) end

function greet(cid, message, keywords, parameters)
	value1 = getPlayerStorageValue(cid,9474)
	if value1 == -1 then
        selfSay('Have you been nice to everyone this year,  ' .. getPlayerName(cid) .. '?')
        talk_state = 1
        npcHandler.focus = cid
        npcHandler.talkStart = os.clock()
	else
        selfSay('Welcome back, ' .. getPlayerName(cid) .. '!')
        npcHandler.focus = cid
        npcHandler.talkStart = os.clock()
    end
    
    return true
end


function farewell(cid, message, keywords, parameters)    
return 
npcHandler:onFarewell(cid, message, keywords, parameters)
end
-- Keyword handling functions end

keywordHandler:addKeyword({'hi'}, greet, nil)
keywordHandler:addKeyword({'hello'}, greet, nil)
keywordHandler:addKeyword({'hey'}, greet, nil)
keywordHandler:addKeyword({'bye'}, farewell, nil)
keywordHandler:addKeyword({'farewell'}, farewell, nil)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
