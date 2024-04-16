local QUEST = 1
local playerPos = getPlayerPosition(cid)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

    local speakvalue = getPlayerStorageValue(cid,9844)
    local value0 = getPlayerStorageValue(cid,9845)
    local value1 = getPlayerStorageValue(cid,9846)

    msg = string.lower(msg)
    if value0 == -1 and msgcontains(msg,'addon') or
    value0 == -1 and msgcontains(msg,'outfit') then
    selfSay('I can see in your eyes that you are a honest and friendly person. You were patient enough to learn our language and I will grant you a special gift. Will you accept it?')
    talk_state = 1
    
    elseif talk_state == 1 and msgcontains(msg,'no') then
    selfSay('I see.')
    talk_state = 0
    
    elseif talk_state == 1 and msgcontains(msg,'yes') then
    selfSay('From now on, you shall be known as the bear warrior. You shall be strong and proud as Angros, the great dark bear. He shall guide your path.')
    doSendMagicEffect(getThingPos(cid),13)
    doPlayerAddOutfit(cid,144,2)
    doPlayerAddOutfit(cid,148,2)
    setPlayerStorageValue(cid,9845,1)
    setPlayerStorageValue(cid,9846,1)
    talk_state = 0
    
    elseif value1 == 1 and msgcontains(msg,'addon') or
    value1 == 1 and msgcontains(msg,'outfit') then
    selfSay('You are a great friend of the wolves from now on, and you have recieved the reward which you for so long has sought.')
    end
    return true
    end
function greetCallback(cid)
	if(getPlayerStorageValue(cid,9844) < QUEST) then
		npcHandler:say('YOOOOUHHOOOUU!')
		return false
	else
		return true
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'Interesting. A human who can speak the language of wolves.')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())


