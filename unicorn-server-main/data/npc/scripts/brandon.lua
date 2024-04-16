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
	
	value0 = getPlayerStorageValue(cid,9850)
	value1 = getPlayerStorageValue(cid,9851)
	value2 = getPlayerStorageValue(cid,9852)
		msg = string.lower(msg)
	if msgcontains(msg,'addon') and value0 == -1 or
	msgcontains(msg,'outfit') and value0 == -1 then
	selfSay('I can see you’re glancing at my brand new sniper gloves. I have three, actually, I’m a collector.')
	talk_state = 0
	
	elseif msgcontains(msg,'sniper gloves') and value0 == -1 then
	selfSay('If you obtain a pair of sniper gloves and give them to me, I could allow you to wear the sniper gloves accesory. How about it?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Very well, but you know my offer.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Fine, return to me when you have obtained them.')
	setPlayerStorageValue(cid,9850,1)
	setPlayerStorageValue(cid,9851,1)
	talk_state = 0
		
	elseif value1 == 1 and msgcontains(msg,'sniper gloves') then
	selfSay('You found sniper gloves?! Incredible! Listen, if you give them to me, I will grant you the right to wear the sniper gloves accessory. How about it?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Very well, but you know my offer.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5875) >= 1 then
	doPlayerRemoveItem(cid,5875,1)
	doSendMagicEffect(getThingPos(cid),14)
	doPlayerAddOutfit(cid,129,2)
	doPlayerAddOutfit(cid,137,1)
	setPlayerStorageValue(cid,9851,-1)
	setPlayerStorageValue(cid,9852,1)
	selfSay('Thank you. And here, as I promised, is the sniper gloves accesory. Congratulations.')
	talk_state = 0
	else
	selfSay('You don\'t have any sniper gloves.')
	talk_state = 0
	end
	elseif value2 == 1 and msgcontains(msg,'sniper gloves') then
	selfSay('I have already granted you to wear the sniper gloves accesory, but you could always your sniper gloves to me for 2000 gold coins? What do you say?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Very well, but you know my offer.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5875) >= 1 then
	doPlayerRemoveItem(cid,5875,1)
  doPlayerAddItem(cid,2152,20)
	selfSay('Thank you. If you obtain even more, I would like to buy these aswell.')
	talk_state = 0
	else
	selfSay('You don\'t have any sniper gloves.')
	talk_state = 0
	end
	end
	return true
	end
	
	
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())