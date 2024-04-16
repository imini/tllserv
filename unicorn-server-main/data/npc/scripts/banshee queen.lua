local QUEST = 1
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


local storyMessage = {}
local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
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
	story = 0

        end
            
    end
    return true
    end
    npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)

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
 		
 		value0 = getPlayerStorageValue(cid,9986)
    value5 = getPlayerStorageValue(cid,9987)
    value6 = getPlayerStorageValue(cid,9988)
    msg = string.lower(msg)
------------------------------------


		if talk_state == 1 and value == 1 then
			if msgcontains(msg, 'yes') then
			   selfSay('Aah... you have mastered the brain and passed the seal of logic. Have you passed any other seals?')
				talk_state = 2
		end
		elseif talk_state == 2 and value1 == 1 then
			if msgcontains(msg, 'yes') then
			   selfSay('So, you have managed to pass the seal of the true path. Have you passed any other seals yet?')
				talk_state = 3

		end
		elseif talk_state == 3 and value2 == 1 then
			if msgcontains(msg, 'yes') then
			   selfSay('Ah, you have passed the seal of sacrifice. Any other seals that you have passed?')
				talk_state = 4
		end
		elseif talk_state == 4 and value3 == 1 then
			if msgcontains(msg, 'yes') then
			   selfSay('I can sense the power of demonrage burning inside you. Have you passed more seals?')
				talk_state = 5

		end
		elseif talk_state == 5 and value4 == 1 then
			if msgcontains(msg, 'yes') then
			   selfSay('I see. You have managed to pass the plague seal. You have mastered the seal of logic, you have seen the unseen, you have made the sacrifice, you possess the fortitude, you have filled yourself with power and you have found your path. You must ask me for my kiss now.')
				talk_state = 6

		end
		elseif talk_state == 6 then
			if msgcontains(msg, 'kiss') then
			   selfSay('Are you prepared to recieve my kiss even though this mean that your death aswell as a part of your soul will always belong to me?')
				talk_state = 7


		end
		elseif talk_state == 7 then
			if msgcontains(msg, 'yes') then
			 selfSay('See you on the other side.')
			doTeleportThing(cid, {x=461, y=73, z=8}, 0)
			doSendMagicEffect(getThingPos(cid),13)
			setPlayerStorageValue(cid,3086,1)
				talk_state = 0

end

    elseif value0 == -1 and msgcontains(msg,'addon') or
	value0 == -1 and msgcontains(msg,'outfit') then
	selfSay('Ahhh... I can sense darkness inside your soul... are you a follower of Zathroth?')
	talk_state = 8
	
	elseif talk_state == 8 and msgcontains(msg,'no') then
	selfSay('I fear I don\'t want to speak to someone who dispise Zathroth.')
	talk_state = 0
	
  elseif talk_state == 8 and msgcontains(msg,'yes') then
	selfSay('Say... I have been longing for something for an eternity now... if you help me retrieve it, I will reward you. Do you consent to this arrangement?')
	talk_state = 10
	
	elseif talk_state == 10 and msgcontains(msg,'no') then
	selfSay('That was sad... for you. Watch your back in the future, foolish human.')
	talk_state = 0
	
  elseif talk_state == 10 and msgcontains(msg,'yes') then
	selfSay('Listen... there are no blooming flowers down here and the only smell present is that of death and decay. ...')
	story = 1
  talk_start = os.clock()
	talk_story = os.clock() 
	storyMessage[1] = 'I wish that I could breathe the lovely smell of beautiful flowers just one more time, especially those which elves cultivate. ...'
	storyMessage[2] = 'Could you please bring me 50 holy orchids?' 
	talk_state = 11
	
	elseif talk_state == 11 and msgcontains(msg,'no') then
	selfSay('That was sad... for you. Watch your back in the future, foolish human.')
	talk_state = 0
	
  elseif talk_state == 11 and msgcontains(msg,'yes') then
	selfSay('Thank you. I will wait for your return.')
	setPlayerStorageValue(cid,9986,1)
	setPlayerStorageValue(cid,9987,1)
	talk_state = 0
	
	elseif value5 == 1 and msgcontains(msg,'addon') or
	value5 == 1 and msgcontains(msg,'orchid') or
	value5 == 1 and msgcontains(msg,'outfit') then
	selfSay('Is that the lovely smell of 50 holy orchids I sense?')
	talk_state = 12

  elseif talk_state == 12 and msgcontains(msg,'no') then
	selfSay('What a shame. Hurry up and bring me them!')
	talk_state = 0
	
  elseif talk_state == 12 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5922) >= 50 then
	selfSay('Thank you! You have no idea what that means to me. As promised, here is your reward... as a follower of Zathroth, I hope that you will like this accessory.')
	setPlayerStorageValue(cid,9988,1)
	doPlayerAddOutfit(cid,149,1)
	doPlayerAddOutfit(cid,145,1)
	setPlayerStorageValue(cid,9987,-1)
	doPlayerRemoveItem(cid,5922,50)
	talk_state = 0
	else
	selfSay('No, you have not collected those, I can see.')
	talk_state = 0
	end

	elseif value6 == 1 and msgcontains(msg,'addon') or
	value6 == 1 and msgcontains(msg,'orchid') or
	value6 == 1 and msgcontains(msg,'outfit') then
	selfSay('You have already completed my mission, human. I have no further business with you.')
	talk_state = 0
  

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
