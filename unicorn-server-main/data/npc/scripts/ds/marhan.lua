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
	if (os.clock() - talk_story) > 11 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2

	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 3

	elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 4

	elseif story == 4 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

	elseif story == 5 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 6

	elseif story == 6 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 7

	elseif story == 7 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 8

	elseif story == 8 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 9

	elseif story == 9 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

	elseif story == 10 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 11

	elseif story == 11 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 12

	elseif story == 12 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 13

	elseif story == 13 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 14

	elseif story == 14 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 15

	elseif story == 15 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

	elseif story == 16 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 17

	elseif story == 17 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 18

	elseif story == 18 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 19

	elseif story == 19 then
    
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
	
	clawvalue = getPlayerStorageValue(cid,9836)
	value0 = getPlayerStorageValue(cid,9834)
	value1 = getPlayerStorageValue(cid,9835)
	value2 = getPlayerStorageValue(cid,9837)
	value3 = getPlayerStorageValue(cid,9838)
	value4 = getPlayerStorageValue(cid,9839)
	value5 = getPlayerStorageValue(cid,9840)
	value6 = getPlayerStorageValue(cid,9841)
	value7 = getPlayerStorageValue(cid,9842)
	value8 = getPlayerStorageValue(cid,9843)
	value9 = getPlayerStorageValue(cid,9844)	
	value20 = getPlayerStorageValue(cid,4327)
	value21 = getPlayerStorageValue(cid,4330)
	value22 = getPlayerStorageValue(cid,4331)
  msg = string.lower(msg)
  
	if value0 == -1 and msgcontains(msg,'addon') then
	selfSay('What are you thinking! I would never allow you to slay my beloved friends for the sake of your narcism. Only Faolan can grant you a fur like this one.')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'faolan') then
	selfSay('I know where the great wolf mother lives, but I will not tell that to just anyone. You have to earn my respect first. Are you willing to help me?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Fine with me.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('I hope that I am not asking too much of you with this task. I heard of a flower which is currently unique in Lithaton and can survive at only one place. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'This place is somewhere in the poisonous Ravenclaw Swamps. I would love to have a sample of its blossom, but the problem is that it seldom actually blooms. ...'       
  storyMessage[2] = 'I cannot afford to travel there each day just to check whether the time has already come, besides I have no idea where to start looking. ...'
  storyMessage[3] = 'I would be deeply grateful if you could support me in this matter and collect a sample of the blooming Griffinclaw for me. ...'
  storyMessage[4] = 'Have you understood everything I told you and will fullfil this task for me?'
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Ah, shame on you.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('Alright then. Take this botanist\'s container and put the sample in it and return to me once you were able to retrieve it. Don\'t lose patience!')
	setPlayerStorageValue(cid,9834,1)
	setPlayerStorageValue(cid,9835,1)
	doPlayerAddItem(cid,4869,1)
	talk_state = 0
	
	elseif value1 == 1 and msgcontains(msg,'addon') or
	value1 == 1 and msgcontains(msg,'griffinclaw') or
	value1 == 1 and msgcontains(cid,'outfit') then
	selfSay('Were you able to obtain a sample of the Griffinclaw?')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Ah, pity.')
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,4869) >= 1 and clawvalue == 1 then
	doPlayerRemoveItem(cid,4869,1)
	setPlayerStorageValue(cid,9835,-1)
	setPlayerStorageValue(cid,9837,1)
	selfSay('Crunor be praised! The Griffinclaw really exists! Now, I will make sure that it will not become extinct. If you are ready to help me again, just ask me for a task.')
	talk_state = 0
	else
	selfSay('No, apparently you haven\'t.')
	talk_state = 0
	end
	
	elseif value2 == 1 and msgcontains(msg,'task') then
	selfSay('Listen, my next task for you is not exactly easy either. ...')
	story = 5 
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[5] = 'In the mountains west of Tha’Reen, known as the Barren Cliffs, there are a hydra lair. Many waterfalls exists here whereas the most dangerous one has just tiny water trickles. ...'
  storyMessage[6] = 'However, these trickles are said to contain water as pure and clean as nowhere else in Lithaton. ...'
	storyMessage[7] = 'If you could reach one of these trickles and retrieve a water sample for me, it would be a great help. You will recognize the place because of the single hydra who lives in this cavity. ...'
	storyMessage[8] = 'It is important that you take the water directly from the trickle, not from the pond - else it will not be as pure anymore. ...'
	storyMessage[9] = 'Have you understood everything I told you and will fulfil this task for me?'
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Ah, pity. Can\'t explain it better.')
	talk_state = 0

	elseif talk_state == 5 and msgcontains(msg,'yes') then
	selfSay('Great! Here, take my waterskin and try to fill it with water from this special trickle. Don\'t lose my waterskin, I will not accept some random dirty waterskin.')
	doPlayerAddItem(cid,5938,1)
	setPlayerStorageValue(cid,9837,-1)
	setPlayerStorageValue(cid,9838,1)
	talk_state = 0
	
	elseif value3 == 1 and msgcontains(msg,'addon') or
	value3 == 1 and msgcontains(msg,'water') or
	value3 == 1 and msgcontains(cid,'outfit') then
	selfSay('Did you bring me a sample of the water from the hydra cave?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Return later then.')
	talk_state = 0

	elseif talk_state == 6 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,7286) >= 1 then
	selfSay('Good work! This water looks indeed extremely clear. I will examine it right away. If you are ready to help me again, just ask me for a task.')
	doPlayerRemoveItem(cid,7286,1)
	setPlayerStorageValue(cid,9838,-1)
	setPlayerStorageValue(cid,9839,1)
	talk_state = 0
	else
	selfSay('No, you don\'t have it.')
	talk_state = 0
	end
	
	elseif value4 == 1 and msgcontains(msg,'task') then
	selfSay('I\'m glad that you are still with me. Especially because my next task might require even more patience from your side than the ones before. ...')
	story = 10 
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[10] = 'Demons... these unholy creatures should have never been able to walk the earth. They are a brood fueled only by hatred and malice. ...'
  storyMessage[11] = 'Even if slain, their evil spirit is not fully killed. It needs a blessed stake to release their last bit of fiendishness and turn them into dust. ...'
	storyMessage[12] = 'It does not work all the time, but if you succeed, their vicious spirit is finally defeated. ...'
	storyMessage[13] = 'I want proof that you are on the right side, against Zathroth. Bring me 100 ounces of demon dust and I shall be convinced. ...'
	storyMessage[14] = 'You will probably need to obtain a blessed stake first, but this should be no problem. Ask Morris from Casteldine about it. ...'
	storyMessage[15] = 'Have you understood everything I told you and will you fulfil this task for me?'
	talk_state = 7
	
	elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Too bad for you then. Now I can\'t let you proceed in the missions.')
	talk_state = 0

	elseif talk_state == 7 and msgcontains(msg,'yes') then
	selfSay('Good! I will eagerly await your return.')
  setPlayerStorageValue(cid,9839,-1)
	setPlayerStorageValue(cid,9840,1)
	talk_state = 0
	
	elseif value5 == 1 and msgcontains(msg,'addon') or
	value5 == 1 and msgcontains(msg,'demon dust') or
	value5 == 1 and msgcontains(cid,'outfit') then
	selfSay('Were you really able to collect 100 ounces of demon dust?')
	talk_state = 8
	
	elseif talk_state == 8 and msgcontains(msg,'no') then
	selfSay('Return later then, when you have them.')
	talk_state = 0

	elseif talk_state == 8 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5906) >= 100 then
	selfSay('I\'m very impressed. With this task you have proven that you are on the right side and are powerful as well. If you are ready to help me again, just ask me for a task.')
	setPlayerStorageValue(cid,9840,-1)
	setPlayerStorageValue(cid,9841,1)
	doPlayerRemoveItem(cid,5906,100)
	talk_state = 0
	else
	selfSay('No, you don\'t have them.')
	talk_state = 0
	end
	
	
	
	elseif value6 == 1 and msgcontains(msg,'task') then
	selfSay('I have one final task for you. Many months ago, I was trying to free the war wolves which are imprisoned inside the orcish base outside Casteldine. ...')
	story = 16 
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[16] = 'Unfortunately, my intrusion was discovered and I had to run for my life. During my escape, I lost my favourite wolf tooth chain. ...'
  storyMessage[17] = 'It should still be somewhere in the base, if the orcs did not try to eat it. I really wish you could retrieve it for me. ...'
	storyMessage[18] = 'It has the letter \'M\' carved into one of the teeth. Please look for it. ...'
	storyMessage[19] = 'Have you understood everything I told you and will you fulfil this task for me?'
	talk_state = 9
	
	elseif talk_state == 9 and msgcontains(msg,'no') then
	selfSay('Too bad for you then. Now I can\'t let you proceed in the missions.')
	talk_state = 0

	elseif talk_state == 9 and msgcontains(msg,'yes') then
	selfSay('Thank you so much. I can\'t wait to wear it around my neck again, it was a special present from Faolan.')
  setPlayerStorageValue(cid,9841,-1)
	setPlayerStorageValue(cid,9842,1)
	talk_state = 0
	
	elseif value7 == 1 and msgcontains(msg,'addon') or
	value7 == 1 and msgcontains(msg,'chain') or
	value7 == 1 and msgcontains(cid,'outfit') then
	selfSay('Have you really found my wolf tooth chain?')
	talk_state = 10
	
	elseif talk_state == 10 and msgcontains(msg,'no') then
	selfSay('Ah, I really thought you would have found it.')
	talk_state = 0

	elseif talk_state == 10 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5940) >= 1 then
	selfSay('Crunor be praised! You found my beloved chain! You really earned my respect and I consider you as a friend from now on. Remind me to tell you about Faolan sometime.')
	setPlayerStorageValue(cid,9842,-1)
	setPlayerStorageValue(cid,9843,1)
	doPlayerRemoveItem(cid,5940,1)
	talk_state = 0
	else
	selfSay('No, you don\'t have it.')
	talk_state = 0
	end
	
	elseif value8 == 1 and msgcontains(msg,'faolan') then
	selfSay('Right, I will keep my promise. Faolan roams Lithaton freely, but her favourite sleeping cave is near Ashbere. I will now enchant you so you will be able to speak the wolf language.')
	doSendMagicEffect(getThingPos(cid),14)
	setPlayerStorageValue(cid,9843,-1)
	setPlayerStorageValue(cid,9844,1)
	talk_state = 0
	
	elseif value9 == 1 and msgcontains(msg,'faolan') then
	selfSay('Faolan roams Lithaton freely, but her favourite sleeping cave is near Ashbere. I have enchanted you so you will be able to speak the wolf language.')
	talk_state = 0

	
	elseif msgcontains(msg,'tower of madness') and value20 == -1 then
	selfSay('Ah. I\'ve been there. Curious place, isn\'t it? I never managed to solve the riddle on the first floor, but I do know how to enter the tower.')
	talk_state = 11
	
	elseif talk_state == 11 and msgcontains(msg,'enter') then
	selfSay('I am not sure, actually. Well, you must do some research before you go there.')
	talk_state = 12
	
	elseif talk_state == 12 and msgcontains(msg,'research') then
	selfSay('No, you shouldn\'t enter that tower until you know its murky history. I should advice you to speak with the old fisherman living in Adanac.')
	setPlayerStorageValue(cid,4327,1)
	talk_state = 0
	
	elseif value20 == 1 and value21 == -1 and value22 == -1 and msgcontains(msg,'tower of madness') then
	selfSay('Talk to the fisherman from Adanac. He\'ll learn you about its history.')
	
	elseif value21 == 1 and value20 == 1 and value22 == -1 and msgcontains(msg,'tower of madness') then
	selfSay('Oh. So you unearthed some history, right? Very well then, if you feel prepared, go enter the tower then...')
	setPlayerStorageValue(cid,4331,1)
	
	elseif value22 == 1 and value21 == 1 and value20 == 1 and msgcontains(msg,'tower of madness') then
	selfSay('The tower is dangerous, but you are probably prepared enough to go there.')
	
	end
	return true
	end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
