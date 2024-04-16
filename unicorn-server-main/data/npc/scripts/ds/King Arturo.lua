local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local story = 0
local talk_story = 0
local spos1 = {x=743,y=766,z=5}
local spos2 = {x=743,y=774,z=5}
-- OTServ event handling functions start
function onThingMove(creature, thing, oldpos, oldstackpos)     npcHandler:onThingMove(creature, thing, oldpos, oldstackpos) end
function onCreatureAppear(creature)                             npcHandler:onCreatureAppear(creature) end
function onCreatureDisappear(id)                                 npcHandler:onCreatureDisappear(id) end
function onCreatureTurn(creature)                                 npcHandler:onCreatureTurn(creature) end
function onCreatureSay(cid, type, msg)                         npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function callbackOnThink()
	if (os.clock() - talk_story) > 1 and story > 0 then
    
        if story == 1 then
	npcHandler:unGreet()
	end
    end
    return true
end


npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)
  
function onThink() npcHandler:onThink()

    end
-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

value1 = getPlayerStorageValue(cid,2333)
 value2 = getPlayerStorageValue(cid,9919)
 value3 = getPlayerStorageValue(cid,9921)
 value4 = getPlayerStorageValue(cid,9925)
 value5 = getPlayerStorageValue(cid,7633)
value6 = getPlayerStorageValue(cid,9889)
value7 = getPlayerStorageValue(cid,9708)
 msg = string.lower(msg)
 value8 = getPlayerStorageValue(cid,4361)

 if msgcontains(msg, 'churry') then
			selfSay('His past is dark, ' .. getPlayerName(cid) .. '. If you want me to uncover his secrets you will have to pay me a noble armor. Are you willing to do this?')
			talk_state = 4
			
			elseif msgcontains(msg, 'quest') and value4 == -1 then
			selfSay('I will not send you on a quest, but I can let you go through a certain test of... courage, if you will. Would you want that?')
			talk_state = 10
			
			elseif getPlayerVocation(cid) > 4 and msgcontains(msg,'promotion') then
			selfSay('You have already been promoted.')
			
			elseif msgcontains(msg,'promotion') and value8 == -1 then
			selfSay('Would you like to be promoted for 20000 gold coins?')
			talk_state = 22

			elseif msgcontains(msg,'premium') then
			selfSay('I can grant you a premium account for a fee of 3000 gold coins. It will last for 7 days. Do you agree to these terms?')
			talk_state = 33

			elseif talk_state == 33 and msgcontains(msg, 'no') then
			selfSay('As you wish.')
			talk_state = 0

			elseif msgcontains(msg, 'twin') then
			selfSay('There are two twins. The question is, do you know what they are?')
			talk_state = 0
			
			elseif msgcontains(msg, 'trust most') then
			selfSay('Who I trust the most...? Obviously someone who has a firm grip of the law.')
			talk_state = 0

 			elseif talk_state == 33 and msgcontains(msg, 'yes') then
			if doPlayerRemoveMoney(cid, 3000) == 1 then
			selfSay('Here you go.')
			doPlayerAddPremiumDays(cid, 7)
			doSendMagicEffect(getThingPos(cid),12)
			talk_state = 0
			else
			talk_state = 0
			selfSay('I suppose you did not understand it, but you will have to pay me 3000 gold coins for this premium account.')
			end

			elseif msgcontains(msg,'office') and getPlayerStorageValue(cid,3911) == 1 or
			msgcontains(msg,'possession') and getPlayerStorageValue(cid,3911) == 1 or
			msgcontains(msg,'time') and getPlayerStorageValue(cid,3911) == 1 or
			msgcontains(msg,'proper') and getPlayerStorageValue(cid,3911) == 1 or
			msgcontains(msg,'reverse') and getPlayerStorageValue(cid,3911) == 1 and msgcontains(msg,'embraces') and msgcontains(msg,'guise') then
			selfSay('Shush! Do not speak more about this.')

			elseif msgcontains(msg,'treasure hunt') and getPlayerItemCount(cid,5091) >= 1 then
			selfSay('How disappointing... all you found was an old map? Well, I do not want it. Keep it.')
			talk_state = 0
			setPlayerStorageValue(cid,3943,1)

			elseif msgcontains(msg,'map') and getPlayerItemCount(cid,5091) >= 1 then
			selfSay('How disappointing... all you found was an old map? Well, I do not want it. Keep it.')
			talk_state = 0
			setPlayerStorageValue(cid,3943,1)

			elseif msgcontains(msg,'map') and getPlayerStorageValue(cid,3943) == 1 then
			selfSay('Keep it, I said.')

			elseif msgcontains(msg,'treasure hunt') and getPlayerStorageValue(cid,3943) == 1 then
			selfSay('The valuable cargo can obviously not be the piece of paper you found, so the treasure hunt was a disappointment.')

			elseif msgcontains(msg,'office') then
			selfSay('The office is off limit to everyone but me. A very valuable possession of mine is inside this office.')
			talk_state = 88
	
			elseif msgcontains(msg,'treasure hunt') and getPlayerStorageValue(cid,3914) == 1 then
			selfSay('Go to the Fields of Wilderness and seek the broken ship... and find its important cargo! But be attentive, it might be hidden... or small... or big. We do not know... yet.')
			talk_state = 0

			elseif msgcontains(msg,'treasure hunt') then
			selfSay('Well, yes. It is actually just to help me find a lost ship... with an important cargo.')
			talk_state = 91

			elseif msgcontains(msg,'cargo') and talk_state == 91 then
			selfSay('You are asking questions... that means you are interested?')
			talk_state = 92

			elseif msgcontains(msg,'no') and talk_state == 92 then
			selfSay('I see.')
			talk_state = 0

			elseif msgcontains(msg,'yes') and talk_state == 92 then
			selfSay('Good. It is people like you I seek! Now, I recently got reports from my scouts that one of my ships have been sighted... on land! In the Fields of Wilderness! Do you wish to hear more, despite this somewhat dangerous information?')
			talk_state = 93

			elseif msgcontains(msg,'no') and talk_state == 93 then
			selfSay('I see.')
			talk_state = 0
			elseif msgcontains(msg,'yes') and talk_state == 93 then
			selfSay('What has happened I do not know, and what the important cargo was, I do not know. I was only told it was... important. You must find out what it was. As fast as possible!')
			setPlayerStorageValue(cid,3914,1)
			talk_state = 0

			
			elseif talk_state == 88 and msgcontains(msg,'possession') then
			selfSay('The twin is what you mean, I suppose. It holds a secret, and unless the time is proper, then I can not let you enter.')
			talk_state = 89
			
		  elseif talk_state == 89 and msgcontains(msg,'time') or 
		  talk_state == 89 and msgcontains(msg,'proper') then
		  selfSay('When is the time proper?')
		  talk_state = 90
		  
		  elseif talk_state == 90 then
		if msgcontains(msg,'reverse') and msgcontains(msg,'embraces') and msgcontains(msg,'guise') then
			selfSay('Interesting... it really looks as if the time actually is proper. I will let you go down there, then.')
			setPlayerStorageValue(cid,3911,1)
			talk_state = 0
			else
			talk_state = 0
			selfSay('No, no.')
			end

			elseif talk_state == 22 and getPlayerVocation(cid) == 4 and msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,2148) >= 20000 or
			getPlayerItemCount(cid,2152) >= 200 or
			getPlayerItemCount(cid,2160) >= 2 then
			selfSay('Very well, here you go. You are now a promoted elite knight.')
			doPlayerSetVocation(cid,8)
			doPlayerRemoveMoney(cid,20000)
			setPlayerStorageValue(cid,4361,1)
			doSendMagicEffect(getThingPos(cid),14)
			talk_state = 0
			else
			selfSay('You have not got enough money, ' .. getPlayerName(cid) .. '.')
			talk_state = 0
			end
			
			elseif talk_state == 22 and getPlayerVocation(cid) == 3 and msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,2148) >= 20000 or
			getPlayerItemCount(cid,2152) >= 200 or
			getPlayerItemCount(cid,2160) >= 2 then
			selfSay('Very well, here you go. You are now a promoted royal paladin.')
			doPlayerSetVocation(cid,7)
			doPlayerRemoveMoney(cid,20000)
			talk_state = 0
			doSendMagicEffect(getThingPos(cid),14)
			setPlayerStorageValue(cid,4361,1)
			else
			selfSay('You have not got enough money, ' .. getPlayerName(cid) .. '.')
			talk_state = 0
			end
			
			elseif talk_state == 22 and getPlayerVocation(cid) == 2 and msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,2148) >= 20000 or
			getPlayerItemCount(cid,2152) >= 200 or
			getPlayerItemCount(cid,2160) >= 2 then
			selfSay('Very well, here you go. You are now a promoted elder druid.')
			doPlayerSetVocation(cid,6)
			doPlayerRemoveMoney(cid,20000)
			doSendMagicEffect(getThingPos(cid),14)
			setPlayerStorageValue(cid,4361,1)
			talk_state = 0
			else
			selfSay('You have not got enough money, ' .. getPlayerName(cid) .. '.')
			talk_state = 0
			end
			
			elseif talk_state == 22 and getPlayerVocation(cid) == 1 and msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,2148) >= 20000 or
			getPlayerItemCount(cid,2152) >= 200 or
			getPlayerItemCount(cid,2160) >= 2 then
			selfSay('Very well, here you go. You are now a promoted master sorcerer.')
			setPlayerStorageValue(cid,4361,1)
			doPlayerRemoveMoney(cid,20000)
			doSendMagicEffect(getThingPos(cid),14)
			doPlayerSetVocation(cid,5)
			talk_state = 0
			else
			selfSay('You have not got enough money, ' .. getPlayerName(cid) .. '.')
			talk_state = 0
			end
			
			elseif talk_state == 22 and msgcontains(msg,'no') then
			selfSay('Very well. Come back when you feel ready then.')
			talk_state = 0
			
			elseif msgcontains(msg,'promotion') and value8 == 1 then
			selfSay('You have already been promoted.')			
			
  elseif value6 == 1 and msgcontains(msg,'uniforms') and value7 == -1 then
  selfSay('I remember about those uniforms, they had a camouflage inlay so they could be worn the inside out too. I will send some color samples via mail to Mrs. Mailner.')
  setPlayerStorageValue(cid,9708,1)
	setPlayerStorageValue(cid,9889,-1)
	
	elseif value7 == 1 and msgcontains(msg,'uniforms') then
	selfSay('I have sent a mail to Mrs. Mailner about it.')
			
			elseif msgcontains(msg, 'quest') and value4 == 1 then
			selfSay('I am pretty sure you wouldn\'t want to go through that again. But if you are interested in the defence system, I can tell you more about it.')
			
			elseif msgcontains(msg, 'defence system') and value4 == 1 then
			selfSay('Well, basically, I had the idea from Jooko. Then it was just a matter of time before I convinced Zertic to do the magical stuff, and swish! Done!')
			talk_state = 0
			
			elseif talk_state == 10 and msgcontains(msg, 'no') then
			selfSay('Ah, I see. You are not the courageous type.')
			talk_state = 0
			
			elseif talk_state == 10 and msgcontains(msg, 'yes') then
			selfSay('Okay. Well, I want you to swear right in front of me. That\'s right. Just do it. Go on.')
			talk_state = 11
			
			elseif talk_state == 11 and msgcontains(msg, 'no') then
			selfSay('You failed.')
			talk_state = 0
			
			elseif talk_state == 11 and msgcontains(msg, 'fuck') or talk_state == 11 and msgcontains(msg, 'shit') or talk_state == 11 and msgcontains(msg, 'hell') then
			selfSay('Hehe. I just wanted to try my new defence mechanism. What do you think about it? You like it?')
			talk_state = 12
			doSendMagicEffect(getThingPos(cid),0)
			hp = (getCreatureHealth(cid) - 1)
      doCreatureAddHealth(cid,-hp)
      doSendAnimatedText(getThingPos(cid),hp,180)
      doSendDistanceShoot(spos1, getThingPos(cid), CONST_ANI_ENERGY)
			doSendDistanceShoot(spos2, getThingPos(cid), CONST_ANI_ENERGY)
			
			elseif talk_state == 12 and msgcontains(msg, 'no') then
			selfSay('Wrong answer, foolish taxpayer.')
			talk_state = 0
			
			elseif talk_state == 12 and msgcontains(msg, 'yes') then
			selfSay('Well, yes. That is my opinion too. Since you seem to be a very professional defence mechanism inspector, I would like to give you your salary <winks>. Will you have it from me?')		
			talk_state = 13
			
			elseif talk_state == 13 and msgcontains(msg, 'no') then
			selfSay('Ah, such a noble person.')
			talk_state = 0
			
			elseif talk_state == 13 and msgcontains(msg, 'yes') then
			selfSay('Take this money and do something funny. But don\'t buy any beer, you already look wasted enough, haha.')
			setPlayerStorageValue(cid,9925,1)
      doPlayerAddItem(cid,2152,4)
			talk_state = 0
			
			elseif msgcontains(msg, 'cowl') then
			selfSay('Cowls are dark artifacts. Have you, illegal or not, one in your possesion, then I order you to give it to me. I have to get it disenchanted immediately. Have you got one?')
			talk_state = 8
			
			elseif msgcontains(msg, 'no') and talk_state == 8 then
			selfSay('Very well...')
			talk_state = 0
			
			elseif talk_state == 8 and value3 == 1 and msgcontains(msg, 'yes') then
			selfSay('I have already disenchanted the cowl for you.')
			talk_state = 0
			
        elseif talk_state == 8 and value3 == -1 then
		    if getPlayerItemCount(cid,2664) >= 1 then
        setPlayerStorageValue(cid,9920,-1)
        doPlayerAddItem(cid,2152,60)
        setPlayerStorageValue(cid,9921,1)
        doSendMagicEffect(getThingPos(cid),13)
			  selfSay("I have now disenchanted it successfully. You may keep it as a trophy. Here is also 6000 gold coins for your loyality to me.")
        elseif getPlayerItemCount(cid,2664) < 1 and msgcontains(msg, 'yes') then
        selfSay('Looks like you don\'t have one after all. That\'s actually a relief, ' .. getPlayerName(cid) .. '.')
    end
		
		elseif msgcontains(msg, 'churry') and value1 == 1 then
    selfSay('I have already told you about Churry, haven\'t I? It was a one time chance.')

		elseif talk_state == 4 then
		    if getPlayerItemCount(cid,2486)  >= 1 then
        doPlayerTakeItem(cid,2486,1)
			  selfSay("Churry has once in time been a demon in the service of Zathroth. Dallrim, a famous warrior back then, fought him. It resulted in his own death, but believe it or not, it was part of his plan. By dying and sacrificing his soul to Zathroth he set Churry free from his evil spirit. ")
        elseif getPlayerItemCount(cid,2486) < 1 and msgcontains(msg, 'yes') then
        selfSay('Obtain a noble armor before offering me one, silly ' .. getPlayerName(cid) .. '.')
			  elseif msgcontains(msg, 'no') then
    selfSay('Very well then, ' .. getPlayerName(cid) .. '. Secrets like this are not for free.')
    end
    end
    
		if msgcontains(msg, 'orshabaal\'s heart') or msgcontains(msg, 'orshabaal heart') then
		if value1 == -1 then
   		selfSay('What!? Have you killed Orshabaal and brought his heart as proof? No, this can\'t be true! Are you sure?')
  		 talk_state = 1
		else
   		selfSay('You already have served our world.')
  		 talk_state = 0
	end
	
   	elseif talk_state == 1 then
  	 if msgcontains(msg, 'yes') then
   	if getPlayerItemCount(cid,5943)  >= 1 then
   	doPlayerTakeItem(cid,5943,1)
   	doPlayerAddItem(cid,2495,1)
	setPlayerStorageValue(cid,2333,1)
   	selfSay('FINALLY! The day has come! Dear ' .. getPlayerName(cid) .. ', you have served our world in a way indescribable. Here, take this reward as an appreciation of your efforts.')
   	talk_state = 0
   		else
   		selfSay('Stop the lying. You don\'t have it!')
   		talk_state = 0
   		end
    			elseif msgcontains(msg, 'no') then
    			selfSay('This is not the right topic to joke about, fool.')
    			talk_state = 0
end

  elseif talk_state == 5 and msgcontains(msg,'no') then
   npcHandler:say('Fine, then.')
   		talk_state = 0
elseif msgcontains(msg, 'ferumbras\' hat') or msgcontains(msg, 'addon') or msgcontains(msg, 'outfit') or msgcontains(msg, 'proof') then
		if value5 == -1 then
    			selfSay('I... I don\'t believe my eyes. You retrieved this hat from Ferumbras’ remains? That is incredible. If you give it to me, I will grant you the right wear this hat as addon. What do you say?')
    			talk_state = 5
		else
   		selfSay('You have already given me this hat.')
		end
   	elseif talk_state == 5 then
  	 if msgcontains(msg, 'yes') then
   	if getPlayerItemCount(cid,5903)  >= 1 then
   	doPlayerTakeItem(cid,5903,1)
	setPlayerStorageValue(cid,7633,1)
   	selfSay('Even though I am the king, I bow to you, ' .. getPlayerName(cid) .. '. I hereby grant you the right wear Ferumbras’ hat as accessory. Congratulations!')
        doPlayerAddOutfit(cid, 141, 2)
        doPlayerAddOutfit(cid, 130, 2)
   	talk_state = 0
   		else
   		selfSay('Stop lie to me. You don\'t have it!')
   		talk_state = 0
 
end
end

	

	end
	
	return true
end

-- Keyword handling functions start
function sayMessage(cid, message, keywords, parameters)     return npcHandler:defaultMessageHandler(cid, message, keywords, parameters) end

function greet(cid, message, keywords, parameters)

	if(npcHandler.focus == 0) then
        selfSay('Adress me properly, taxpayer.')
        focus = 0
        talkStart = 0
    end
    
    return true
end


function greetes(cid, message, keywords, parameters)

    if(npcHandler.focus == 0) then
        selfSay('What can you do for me, humble citizen?')
        npcHandler.focus = cid
        voc = 0
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
keywordHandler:addKeyword({'hail'}, greetes, nil)
keywordHandler:addKeyword({'bye'}, farewell, nil)
keywordHandler:addKeyword({'farewell'}, farewell, nil)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
