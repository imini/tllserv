local spos = {x=763,y=398,z=14}
local QUEST = 1
local playerPos = getPlayerPosition(cid)
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()

    end
-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	
		local value1 = getPlayerStorageValue(cid,3037)
		local value5 = getPlayerStorageValue(cid,9774)
		local value6 = getPlayerStorageValue(cid,9776)
		msg = string.lower(msg)
------------------------------------

	if msgcontains(msg, 'test') and value1 == -1 then
			selfSay('Are you interested in doing the test?')
			talk_state = 1
			
			elseif msgcontains(msg, 'staff') and value5 == 1 and value6 == -1 then
			selfSay('Do you want the staff of my best warrior or what\'s the matter?')
			talk_state = 6
			
			elseif talk_state == 6 and msgcontains(msg,'no') then
			selfSay('Good for you, because you wouldn\'t have had it.')
			talk_state = 0
			
			elseif talk_state == 6 and msgcontains(msg,'yes') then
			selfSay('First thing, no. Second thing, even if the first thing was yes, then I wouldn\'t allow my warrior to fight some piece of crap like you. Instead, I would only accept a bribe.')
			talk_state = 7

    elseif talk_state == 7 and msgcontains(msg,'bribe') then
			selfSay('Are you trying to manipulate me?')
			talk_state = 8
			
			elseif talk_state == 8 and msgcontains(msg,'yes') then
			selfSay('Then stop that, stupid fool.')
			talk_state = 0
			
			elseif talk_state == 8 and msgcontains(msg,'no') then
			selfSay('Good for you. Because a bribe sounds tempting. Eh, whatever, what am I supposed to do with that staff anyway. A bribe you say?')
			talk_state = 9
    elseif talk_state == 9 and msgcontains(msg,'no') then
			selfSay('You are weird.')
			talk_state = 0
			
			elseif talk_state == 9 and msgcontains(msg,'yes') then
			selfSay('Shall we say a golden armor, then? Is that a fair price?')
			talk_state = 10
			
			elseif talk_state == 10 and msgcontains(msg,'no') then
			selfSay('I am the one who decide, not you, foolish fool.')
			talk_state = 0
    
      elseif talk_state == 10 and msgcontains(msg,'yes') then
			selfSay('Very well. Do you have a golden armor with you?')
			talk_state = 11
			
			elseif talk_state == 11 and msgcontains(msg,'no') then
			selfSay('Too bad for you then, idiot.')
			talk_state = 0
			
			elseif talk_state == 11 and msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,2466) >= 1 then
			doPlayerRemoveItem(cid,2466,1)
			setPlayerStorageValue(cid,9776,1)
			doPlayerAddItem(cid,6107,1)
			selfSay('I think I\'ll have that one. Now, here\'s the completely worthless staff which I tricked you to buy. Fool! Idiot! Hahahaha!')
			talk_state = 0
			else
			talk_state = 0
			selfSay('You don\'t have a golden armor, you pathetic foolish idiot.')
			end
			
			elseif value6 == 1 and msgcontains(msg,'staff') then
			selfSay('I have already given you the staff, idiot.')
			talk_state = 0
    
    elseif msgcontains(msg, 'test') and value1 == 1 then
    selfSay('You have already completed the test. I find you worthy enough to enter the Altar of Storm.')
			end
			
			if talk_state == 1 then
			if msgcontains(msg, 'yes') then
			selfSay('Ah... you will be an easy prey for Charon, I suppose. Are you ready to go?')
			talk_state = 2
			end
			end
			if talk_state == 1 then
			if msgcontains(msg, 'no') then
			selfSay('Ah. Thought so, you look like a maggot anyway.')
			talk_state = 0
    end
			end
			
			if talk_state == 2 then
			
			if msgcontains(msg, 'yes') then
			selfSay('Fine! THEN DIE!')
			doTeleportThing(cid, {x=750, y=396, z=13}, 0)
			doSendMagicEffect(getThingPos(cid),17)
			setPlayerStorageValue(cid,3037,1)
			talk_state = 0
			else
			selfSay('Shame on you, coward.')
end
end



	if msgcontains(msg, 'altar of storm') and value1 == -1 then
			selfSay('It\'s sealed. Only I can allow people to access it.')
			talk_state = 1
			
			elseif msgcontains(msg, 'altar of storm') and value1 == 1 then
			selfSay('Very impressive. You are now allowed to go to the Altar of Storm.')
			talk_state = 0
			end
			return true
end

function greetCallback(cid)
	if(getPlayerStorageValue(cid,3036) < QUEST) then
		npcHandler:say('What!? NO, LEAVE ME DIRTBLOOD. I ACCEPT ONLY THOSE WITH THE STAINS FROM A TRUE BLOOD OGRE.')
		doSendMagicEffect(getThingPos(cid),0)
		doCreatureAddHealth(cid,-300)
		doSendAnimatedText(getThingPos(cid),300,180)
		doSendDistanceShoot(spos, getThingPos(cid), CONST_ANI_SUDDENDEATH)
		return false
	else
		return true
	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)


npcHandler:setMessage(MESSAGE_GREET, 'Aah. Very interesting... I can sense bloodstains from an ogre – and not any ogre, a true blood ogre. What can I do for you, |PLAYERNAME|?')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())


