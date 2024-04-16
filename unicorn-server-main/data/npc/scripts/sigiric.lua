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
    
	if (os.clock() - talk_story) > 13 and story > 0 then
	
if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2
	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
	elseif story == 3 then
    
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
	if(npcHandler.focus ~= cid) then
		return false
	end
	value1 = getPlayerStorageValue(cid,9873)
	value2 = getPlayerStorageValue(cid,9875)
	msg = string.lower(msg)
	value0 = getPlayerStorageValue(cid,4362)
	value3 = getPlayerStorageValue(cid,4363)
	value4 = getPlayerStorageValue(cid,4364)
	
	if msg == 'heal' then
		healed = false
		if (getCreatureHealth(cid) < 65) then
			doCreatureAddHealth(cid,65  - getCreatureHealth(cid))
			doSendMagicEffect(getThingPos(cid),12)
			selfSay('You are looking bad. I will help you!')
			talkState = 0
			healed = true
		end
		if (getCreatureCondition(cid,1) == 1 or getCreatureCondition(cid,2) == 1 or getCreatureCondition(cid,4) == 1) then
			doCreatureRemoveCondition(cid,1)
			doCreatureRemoveCondition(cid,2)	
			doCreatureRemoveCondition(cid,4)
			doSendMagicEffect(getThingPos(cid),12)
			selfSay('You are looking bad. I will help you!')
			talkState = 0
			healed = true
		end
		if (healed == false) then
			selfSay('You aren\'t looking really bad.')
		end
	end
	
	
 if value1 == 1 and msgcontains(msg,'stake') and value2 == -1 then
 selfSay('Yes, I was informed what to do. Are you prepared to receive my line of the prayer?')
 talk_state = 1
 
 elseif msgcontains(msg,'mission') and value0 == -1 then
 selfSay('Now that you mention it, there\'s something you could do for me. I would of course reward your greatly if you happened to succeed with this, but I have my doubts. It happened a long time ago. Do you want me to tell you about this thing anyway?')
 talk_state = 2
 
 elseif talk_state == 2 and msgcontains(msg,'yes') then
 selfSay('Well, as a visitor of Celeres you might have heard about the dreadful Pire Vam. It is famously known that this ancient ghost had a residence in a manor in the north-west, but noone ever really figured out how to enter it. ...')
 story = 1
 talk_start = os.clock()
 talk_story = os.clock()
 storyMessage[1] = 'Anyway, I believe many of the citizens in Celeres are under a constant state of fear for this particular ghost, Pire Vam. I am pretty sure he\'s dead, and I would like to convince the people somehow that there is nothing to be afraid of. ...'
 storyMessage[2] = 'If you ever happen to solve the manors riddles and enter it, could you perhaps seek for some kind of evidence that the ghost actually just is a dead man?'
 talk_state = 3
 
 elseif talk_state == 3 and msgcontains(msg,'yes') then
 selfSay('Good. Return to me with the piece of evidence, please.')
 setPlayerStorageValue(cid,4362,1)
 setPlayerStorageValue(cid,4363,1)
 talk_state = 0
 
 elseif talk_state == 3 and msgcontains(msg,'no') then
 selfSay('As you wish.')
 talk_state = 0
 
 elseif value3 == 1 and msgcontains(msg,'mission') or
 value3 == 1 and msgcontains(msg,'evidence') then
 selfSay('Have you found any evidence that Pire Vam only is a dead man?')
 talk_state = 4
 
 elseif talk_state == 4 and msgcontains(msg,'no') then
 selfSay('Inform me when, or if, you have then.')
 talk_state = 0
 
 elseif talk_state == 4 and msgcontains(msg,'yes') then
 if getPlayerItemCount(cid,7251) >= 1 then
 selfSay('What in the name of Banor? Is that supposed to be the remains of an old man? Maybe I was wrong after all, maybe he wasn\'t just an ordinary man. ...')
 story = 3
 doPlayerAddItem(cid,7394,1)
 talk_start = os.clock()
 talk_story = os.clock()
 storyMessage[3] = 'I better not tell anyone about this, because that would only make them even more afraid. For you, though, I have this trophy as a thanks.'
 talk_state = 0
 setPlayerStorageValue(cid,4364,1)
 doPlayerRemoveItem(cid,7251,1)
 setPlayerStorageValue(cid,4363,-1)
 else
 selfSay('You lack the evidence, I\'m afraid.')
 talk_state = 0
 end
 
 elseif value4 == 1 and msgcontains(msg,'mission') or
 value4 == 1 and msgcontains(msg,'evidence') then
 selfSay('I was wrong, I have admitted it. We must now both remember not to tell anyone about this.')
 talk_state = 4
  
 elseif talk_state == 2 and msgcontains(msg,'no') then
 selfSay('As you wish.')
 talk_state = 0
 
 elseif talk_state == 1 and msgcontains(msg,'no') then
 selfSay('As you wish.')
 talk_state = 0
 
 elseif talk_state == 1 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5941) >= 1 then
 selfSay('So receive my prayer: \'Hope shall fill your heart - doubt shall be banned\'. Now, bring your stake to Flynn in Adanac for the next line of the prayer. I will inform him what to do.')
 setPlayerStorageValue(cid,9875,1)
 talk_state = 0
  else
 selfSay('You should at least bring the stake.')
 talk_state = 0
 end
 
 elseif value2 == 1 and msgcontains(msg,'stake') then
 selfSay('I told you to continue to Flynn in Adanac for the next line of prayer.')
 talk_state = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())