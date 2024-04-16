local QUEST = 1
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
 		value = getPlayerStorageValue(cid,3081)
 		value1 = getPlayerStorageValue(cid,3082)
 		value2 = getPlayerStorageValue(cid,3083)
 		value3 = getPlayerStorageValue(cid,3084)
 		value4 = getPlayerStorageValue(cid,3085)
 		msg = string.lower(msg)


------------------------------------


		if talk_state == 1 and value == 1 then
			if msgcontains(msg, 'yes') then
			   npcHandler:say('Aah... you have mastered the brain and passed the seal of logic. Have you passed any other seals?')
				talk_state = 2
		end
		elseif talk_state == 2 and value1 == 1 then
			if msgcontains(msg, 'yes') then
			   npcHandler:say('So, you have managed to pass the seal of the true path. Have you passed any other seals yet?')
				talk_state = 3

		end
		elseif talk_state == 3 and value2 == 1 then
			if msgcontains(msg, 'yes') then
			   npcHandler:say('Ah, you have passed the seal of sacrifice. Any other seals that you have passed?')
				talk_state = 4
		end
		elseif talk_state == 4 and value3 == 1 then
			if msgcontains(msg, 'yes') then
			   npcHandler:say('I can sense the power of demonrage burning inside you. Have you passed more seals?')
				talk_state = 5

		end
		elseif talk_state == 5 and value4 == 1 then
			if msgcontains(msg, 'yes') then
			   npcHandler:say('I see. You have managed to pass the plague seal. You have mastered the seal of logic, you have seen the unseen, you have made the sacrifice, you possess the fortitude, you have filled yourself with power and you have found your path. You must ask me for my kiss now.')
				talk_state = 6

		end
		elseif talk_state == 6 then
			if msgcontains(msg, 'kiss') then
			   npcHandler:say('Are you prepared to recieve my kiss even though this mean that your death aswell as a part of your soul will always belong to me?')
				talk_state = 7


		end
		elseif talk_state == 7 then
			if msgcontains(msg, 'yes') then
			 npcHandler:say('See you on the other side.')
			doTeleportThing(cid, {x=461, y=73, z=8}, 0)
			doSendMagicEffect(getThingPos(cid),13)
			setPlayerStorageValue(cid,3086,1)
				talk_state = 0

	elseif talk_state == 1 and msgcontains(msg, 'no') or
	talk_state == 2 and msgcontains(msg, 'no') or
	talk_state == 3 and msgcontains(msg, 'no') or
	talk_state == 4 and msgcontains(msg, 'no') or
	talk_state == 7 and msgcontains(msg, 'no') or
	talk_state == 6 and msgcontains(msg, 'no') then
	selfSay('Ah, then not.')

end
end
return true
end


function greetCallback(cid)
	value1 = getPlayerStorageValue(cid,3080)
	value2 = getPlayerStorageValue(cid,3086)

	if value1 == -1 then
	selfSay('' .. getPlayerName(cid) .. ', you amaze me. You have penetrated through much defense, and now you dare to speak to me, the Queen of the Banshees.')

	else

	selfSay('Oh, you have found the hidden seal. Have you passed even more seals?')
        npcHandler.focus = cid
        npcHandler.talkStart = os.clock()
	talk_state = 1

	end
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)




npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
