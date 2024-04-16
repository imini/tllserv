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
	if (os.clock() - talk_story) > 12 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2
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
	value1 = getPlayerStorageValue(cid,9919)
	value2 = getPlayerStorageValue(cid,9930)
	msg = string.lower(msg)
	if value1 == 1 and msgcontains(msg, 'cowl') then
	selfSay('I have obtained a cowl once. I made a mistake though, I gave it to a complete stranger. ...')
	story = 1
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[1] = 'Instead, I would have walked straight to the king and given it to him.'
			talk_state = 0

  elseif value1 == -1 and msgcontains(msg, 'cowl') then
	selfSay('What do you know about cowls?')
	
	
	elseif msgcontains(msg, 'dice') and value2 == -1 then
	selfSay('Yeh, I am pretty much of a gambler, I believe. Would you like to challenge me in a simple game?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg, 'no') then
	selfSay('Ah, very well. Would have been fun though.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg, 'no') then
	selfSay('Hah, scared of losing, I suppose.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg, 'yes') then
	selfSay('Interesting. Before we begin, would you like to continue with the game directly or know the rules first?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg, 'rule') then
	selfSay('You see the dice over there. You will bet 100 gold coins on that it gets a six. If it doesn\'t, I keep the money. If it gets a six, you\'ll have the dice. Also, if you win, I won\'t charge you for the game.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg, 'continue') or talk_state == 2 and msgcontains(msg, 'game') then
	selfSay('Okay, are you ready?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg, 'no') then
	selfSay('Aw, okay.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg, 'yes') then
	if getPlayerItemCount(cid,2152) >= 1 or getPlayerItemCount(cid,2148) >= 100 or getPlayerItemCount(cid,2160) >= 1 then
	random = math.random(1,6)
	dicepos = {x=807, y=738, z=6}
	dicepoz = {x=807, y=738, z=6, stackpos=2}
	dicez = getThingfromPos(dicepoz)
	if random == 1 then
	doTransformItem(dicez.uid,5792)
	doSendMagicEffect(dicepos,26)
	doPlayerRemoveMoney(cid,100)
	selfSay('Aw, pity. You lost. Want to try again?')
	talk_state = 9
	end
	if random == 2 then
	doTransformItem(dicez.uid,5793)
	doSendMagicEffect(dicepos,26)
	doPlayerRemoveMoney(cid,100)
	selfSay('Aw, pity. You lost. Want to try again?')
	talk_state = 9
	end
	if random == 3 then
	doTransformItem(dicez.uid,5794)
	doSendMagicEffect(dicepos,26)
	doPlayerRemoveMoney(cid,100)
	selfSay('Aw, pity. You lost. Want to try again?')
	talk_state = 9
	end
	if random == 4 then
	doTransformItem(dicez.uid,5795)
	doSendMagicEffect(dicepos,26)
	doPlayerRemoveMoney(cid,100)
	selfSay('Aw, pity. You lost. Want to try again?')
	talk_state = 9
	end
	if random == 5 then
	doTransformItem(dicez.uid,5796)
	doSendMagicEffect(dicepos,26)
	doPlayerRemoveMoney(cid,100)
	selfSay('Aw, pity. You lost. Want to try again?')
	talk_state = 9
	end
	if random == 6 then
	doTransformItem(dicez.uid,5797)
	doSendMagicEffect(dicepos,26)
	doPlayerAddItem(cid,5797,1)
	selfSay('Congratulations, you won. Here, take this dice.')
	talk_state = 0
	end
	else
	selfSay('Come back and gamble when you have enough money.')
	talk_state = 0	
	end	
	
	elseif talk_state == 9 and msgcontains(msg, 'yes') then
	selfSay('Okay, are you ready?')
	talk_state = 3
	
	elseif talk_state == 9 and msgcontains(msg, 'no') then
	selfSay('Fine, then.')
	talk_state = 0
	
	end
	return true
	end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())