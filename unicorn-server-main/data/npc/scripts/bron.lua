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
function callbackOnThin()
	if (os.clock() - talk_story) > 11 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

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
	story = 5

	elseif story == 5 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 6

	elseif story == 6 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

		elseif story == 7 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

	elseif story == 8 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0

	elseif story == 9 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 10
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
	
	value0 = getPlayerStorageValue(cid,9804)
	value1 = getPlayerStorageValue(cid,9805)
	value2 = getPlayerStorageValue(cid,9806)
	value3 = getPlayerStorageValue(cid,9807)
	value4 = getPlayerStorageValue(cid,9808)
	value5 = getPlayerStorageValue(cid,9809)
	value6 = getPlayerStorageValue(cid,9810)
	value7 = getPlayerStorageValue(cid,9811)
	value8 = getPlayerStorageValue(cid,9812)
	value9 = getPlayerStorageValue(cid,9813)
	msg = string.lower(msg)
	if value0 == -1 and msgcontains(msg,'addon') or
	value0 == -1 and msgcontains(msg,'outfit') then
	selfSay('I am a true barbarian, although I dislike violence.')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'violence') then
	selfSay('Convincing Ajax that it is not always necessary to use brute force... this would be such an achievement. Definitely a hard task though. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
	storyMessage[1] = 'Listen, I simply have to ask, maybe a stranger can influence him better than I can. Would you help me with my brother?'
	talk_state = 2

	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Oh I see. Very well then.')
	talk_state = 0
	
  elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Really! That is such an incredibly nice offer! I already have a plan. You have to teach him that sometimes words are stronger than fists. ...')
	story = 2
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[2] = 'Maybe you can provoke him with something to get angry, like saying... \'MINE!\' or something. But beware, I\'m sure that he will try to hit you. ...'
  storyMessage[3] = 'Don\'t do this if you feel weak or ill. He will probably want to make you leave by using violence, but just stay strong and refuse to give up. ...'
  storyMessage[4] = 'If he should ask what else is necessary to make you leave, tell him to \'say please\'. Afterwards, do leave and return a while later. ...'
  storyMessage[5] = 'This way he might learn that violence doesn\'t always help, but that a friendly word might just do the trick. ...'
  storyMessage[6] = 'Have you understood everything I told you and are really willing to take this risk?'
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Ah, well okay then.')
	talk_state = 0
	
  elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('You are indeed not only well educated, but also very courageous. I wish you good luck, you are my last hope.')
	setPlayerStorageValue(cid,9804,1)
	setPlayerStorageValue(cid,9805,1)
	talk_state = 0
	
	elseif value1 == 1 and msgcontains(msg,'addon') or
	value1 == 1 and msgcontains(msg,'outfit') then
	selfSay('Go to Ajax and convince him that brute force isn\'t always the best thing. Try provoking him by saying \'MINE\' or something, and then stand your ground when he tries to hit you.')
	talk_state = 0
	
	elseif value2 == 1 and msgcontains(msg,'fist not good') or
	value2 == 1 and msgcontains(msg,'fist not always good') then
	selfSay('Oh! He really said that? I am so proud of you, my friend. These are really good news. Everything would be great... if only there wasn\'t this person near my house.')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'person') then
	selfSay('This... person... makes me want to... say something bad... must... control myself. <sweats> I really don\'t know what to do anymore. ...')
	story = 7
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[7] = 'I wonder if Ajax has an idea. Could you ask him about Gelagos?'
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Ah, well okay then.')
	talk_state = 0
	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	selfSay('Good. Hope he knows something to do. I will wait here for you.')
	setPlayerStorageValue(cid,9806,-1)
	setPlayerStorageValue(cid,9807,1)
	talk_state = 0
	
	elseif value3 == 1 and msgcontains(msg,'fighting spirit') then
	if getPlayerItemCount(cid,4839) >= 1 then
	selfSay('Fighting spirit? What am I supposed to do with this fi... - oh! I feel strange... ME MIGHTY! ME WILL CHASE OFF ANNOYING KIDS! GROOOAARR!! RRRRRRRRRRRRAAAAAAAGE!!')
	setPlayerStorageValue(cid,9807,-1)
	setPlayerStorageValue(cid,9808,1)
	focus = 0
	doPlayerRemoveItem(cid,4839,1)
	talk_state = 0
	else
	selfSay('I don\'t understand. I\'m confused now.')
	talk_state = 0
	end
	
	elseif value4 == 1 and msgcontains(msg,'fighting spirit') then
	selfSay('Oh no! Was that really me? This is so embarassing, I have no idea what has gotten into me. Was that the fighting spirit you gave me?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Well, I don\'t know what happened then.')
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'yes') then
	selfSay('I\'m impressed... I am sure this was Ajax\' idea. I would love to give him a present, but if I leave my hut to gather ingredients, he would surely notice. ...')
	story = 8
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[8] = 'Would you maybe help me again, one last time, my friend? I assure you that your efforts will not be in vain.'
	talk_state = 7
	
	elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif talk_state == 7 and msgcontains(msg,'yes') then
	selfSay('Great! You see, I really would love to sew a nice shirt for him. I just need a few things for that, so please listen closely: ...')
	story = 9
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[9] = 'He loves green and red, so I will need about 50 pieces of red cloth - like the material heroes make their capes of - and 50 pieces of the green cloth Djinns like. ...'
  storyMessage[10] = 'Secondly, I need about 10 rolls of spider silk yarn. ...'
  storyMessage[11] = 'The only remaining thing needed would be a bottle of warrior\'s sweat to spray it over the shirt... he just loves this smell. ...'
  storyMessage[12] = 'Have you understood everything I told you and are willing to handle this task?'
  talk_state = 8
  
  elseif talk_state == 8 and msgcontains(msg,'no') then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif talk_state == 8 and msgcontains(msg,'yes') then
	selfSay('Thank you, my friend! Come back to me once you have collected 50 pieces of red cloth and 50 pieces of green cloth.')
	setPlayerStorageValue(cid,9808,-1)
	setPlayerStorageValue(cid,9809,1)
	talk_state = 0
	
	elseif value5 == 1 and msgcontains(msg,'addon') or
	value5 == 1 and msgcontains(msg,'cloth') or
	value5 == 1 and msgcontains(msg,'outfit') then
	selfSay('Have you really managed to fulfil the task and brought me 50 pieces of red cloth and 50 pieces of green cloth?')
	talk_state = 9
	
	elseif talk_state == 9 and msgcontains(msg,'no') then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif talk_state == 9 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 then
	doPlayerRemoveItem(cid,5911,50)
	doPlayerRemoveItem(cid,5910,50)
	setPlayerStorageValue(cid,9809,-1)
	setPlayerStorageValue(cid,9810,1)
	selfSay('Terrific! I will start to trim it while you gather 10 rolls of spider silk. I\'m sure that Ajax will love it.')
	talk_state = 0
	else
	selfSay('Nope. You don\'t have them.')
	talk_state = 0
	end
	
	elseif value6 == 1 and msgcontains(msg,'addon') or
	value6 == 1 and msgcontains(msg,'silk') or
	value6 == 1 and msgcontains(msg,'outfit') then
	selfSay('Oh, did you bring 10 rolls of spider silk yarn for me?')
	talk_state = 10
	
	elseif talk_state == 10 and msgcontains(msg,'no') then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif talk_state == 10 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5886) >= 10 then
	doPlayerRemoveItem(cid,5886,10)
	setPlayerStorageValue(cid,9810,-1)
	setPlayerStorageValue(cid,9811,1)
	selfSay('I\'m impressed! You really managed to get spider silk yarn for me! I will immediately start to work on this shirt. Please don\'t forget to bring me warrior\'s sweat!')
	talk_state = 0
	else
	selfSay('Nope. You don\'t have them.')
	talk_state = 0
	end
	
	elseif value7 == 1 and msgcontains(msg,'addon') or
	value7 == 1 and msgcontains(msg,'sweat') or
	value7 == 1 and msgcontains(msg,'outfit') then
	selfSay('Were you able to get hold of a flask with pure warrior\'s sweat?')
	talk_state = 11
	
	elseif talk_state == 11 and msgcontains(msg,'no') then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif talk_state == 11 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5885) >= 1 then
	doPlayerRemoveItem(cid,5885,1)
	setPlayerStorageValue(cid,9811,-1)
	setPlayerStorageValue(cid,9812,1)
	selfSay('Good work. Now I can finally finish this present for Ajax. Because you were such a great help, I have also a present for you. Will you accept it?')
	talk_state = 12
	else
	selfSay('Nope. You don\'t have it.')
	talk_state = 0
	end
	
	elseif talk_state == 12 and msgcontains(msg,'no') then
	selfSay('<looks furious> I insist! I have kept this traditional barbarian wig safe for many years now. It is now yours! I hope you will wear it proudly, friend.')
	doSendMagicEffect(getThingPos(cid),14)
	doPlayerAddOutfit(cid,143,2)
	doPlayerAddOutfit(cid,147,2)
	setPlayerStorageValue(cid,9812,-1)
	setPlayerStorageValue(cid,9813,1)
	talk_state = 0
	
	elseif talk_state == 12 and msgcontains(msg,'yes') then
	selfSay('I have kept this traditional barbarian wig safe for many years now. It is now yours! I hope you will wear it proudly, friend.')
	doSendMagicEffect(getThingPos(cid),14)
	doPlayerAddOutfit(cid,143,2)
	doPlayerAddOutfit(cid,147,2)
	setPlayerStorageValue(cid,9812,-1)
	setPlayerStorageValue(cid,9813,1)
	setPlayerStorageValue(cid,9814,1)
	talk_state = 0

	elseif value9 == 1 and msgcontains(msg,'addon') or
	value9 == 1 and msgcontains(msg,'outfit') then
	selfSay('You have helped me tremendously. I have given you an outfit as reward, too.')
	talk_state = 0
	end
	return true
	end
		
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())