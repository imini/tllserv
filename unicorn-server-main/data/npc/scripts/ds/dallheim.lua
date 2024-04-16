local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local storyMessage = {}
local story = 0
local talk_story = 0
local talkStart = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 12 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_story = os.clock()
	story = 0
	
	elseif story == 2 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 3

	elseif story == 3 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 4
	elseif story == 4 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 5
	elseif story == 5 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 0
	elseif story == 6 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 7
	elseif story == 7 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 8
	elseif story == 8 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 9
	elseif story == 9 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 10
	elseif story == 10 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
            talk_story = os.clock()
	story = 11
	elseif story == 11 then
    
            selfSay(storyMessage[story])
            talkStart = os.clock()
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
	
	value1 = getPlayerStorageValue(cid,9937)
	value2 = getPlayerStorageValue(cid,9938)
	value3 = getPlayerStorageValue(cid,9939)
	value4 = getPlayerStorageValue(cid,9940)
	value5 = getPlayerStorageValue(cid,9941)
	
	value6 = getPlayerStorageValue(cid,9853)
	value7 = getPlayerStorageValue(cid,9854)
  value8 = getPlayerStorageValue(cid,9855)
  value9 = getPlayerStorageValue(cid,9856)
  value10 = getPlayerStorageValue(cid,9857)
  value11 = getPlayerStorageValue(cid,9858)
  msg = string.lower(msg)
	if msgcontains(msg,'quest') and value1 == -1 and value5 == -1 and value4 == -1 then
  selfSay('I can perhaps ask for your help. I want to mourn my father Dallrim, but how easy is that when he lays in a grave? ...')
  story = 1
  talkStart = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'Obviously, I cannot dig his body and place it inside my house. That would be out-rageous. Instead, I have an plan, which I would like you to execute. Will you do this for me?'
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Pity.')
	talk_state = 0
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('All for nothing...')
	talk_state = 0
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Oh...')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Great. Then I will explain my plan to you. ...')
	 story = 2
  talkStart = os.clock()
  talk_story = os.clock()
  storyMessage[2] = 'First, you must seek my father Dallrim\'s grave. It\'s east of Casteldine. Thereafter, you will have to find an old, but friendly ghoul living somewhere in Laudegrance. ...'
	storyMessage[3] = 'You must ask him for a certain bucket which you can use to dig the grave of Dallrim. I will let him know I sent you. ...'
	storyMessage[4] = 'Afterwards, go to the grave and begin the digging. Obviously, the corpse of my father has decomposed already, but the earth in which he rested in will be enough for me. ...'
	storyMessage[5] = 'So, when the bucket is full of mud an earth, bring it to me. Can you do this?'
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Great. I will now let the ghoul know you are coming, so he can prepare the special bucket.')
	setPlayerStorageValue(cid,9937,1)
	talk_state = 0
	
	elseif value1 == 1 and msgcontains(msg,'quest') and value3 == -1 then
	selfSay('The ghoul will help you to retain my father\'s spirit by giving you a certain bucket.')
	talk_state = 0
	
	elseif value3 == 1 and value5 == -1 and msgcontains(msg,'waterskin') or
	value3 == 1 and value5 == -1 and msgcontains(msg,'dallrim') or
	value3 == 1 and value5 == -1 and msgcontains(msg,'quest') or
	value3 == 1 and value5 == -1 and msgcontains(msg,'earth') then
	selfSay('Have you retrieved the earth from my father as I asked you to?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,7286) == 1 then
	doPlayerRemoveItem(cid,7286,1)
	doPlayerAddItem(cid,5798,1)
	selfSay('Thank you very much. Here, take this abacus from me to show my appreciation. I know a certain collector who will pay much for these.')
	setPlayerStorageValue(cid,9941,1)
	talk_state = 0
	else
	selfSay('You don\'t have my father\'s earth.')
	talk_state = 0
	end
	
	elseif value5 == 1 and msgcontains(msg,'quest') then
	selfSay('You have already retrieved my father\'s earth, and I am fully convinced you\'re a nice guy.')
	
	
	
	elseif msgcontains(msg,'addon') and value6 == -1 or
	msgcontains(msg,'outfit') and value6 == -1 then
	selfSay('Oh. My hooded cloak? Those were traditionally awarded after having completed a difficult task for our guild, only to male aspirants though. Female warriors will receive a winged tiara.')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Oh... alright.')
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'task') and getPlayerSex(cid) == 0 then
	selfSay('So you are saying that you would like to prove that you deserve to wear such a winged tiara?')
	talk_state = 5
	
	elseif talk_state == 4 and msgcontains(msg,'task') and getPlayerSex(cid) == 1 then
	selfSay('So you are saying that you would like to prove that you deserve to wear such a hooded cloak?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Oh... alright.')
	talk_state = 0
	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	selfSay('Alright, I will give you a chance. Pay close attention to what I\'m going to tell you now. ...')
  story = 6
  talkStart = os.clock()
  talk_story = os.clock()
  storyMessage[6] = 'Quite long ago, just before our guild closed, one of the members moved. He just vanished, talking about some sort of place in Ravenclaw Swamp. Well, this wouldn’t be a problem unless he had stolen my crown armor before he left. ...'
  storyMessage[7] = 'Please find me an armor. New, or the same one. It doesn’t matter. ...'
  storyMessage[8] = 'Secondly, I need a lot of leather for new quivers. 100 pieces of green dragon leather and 100 pieces of red dragon leather should suffice. ...'
  storyMessage[9] = 'Third, since I sometimes am giving out tiaras, I am always in need of enchanted chicken wings. Please bring me 5, that would help us tremendously. Talk with the djinns about this. ...'
  storyMessage[10] = 'Lastly, for my arrow heads I need a lot of steel. Best would be one piece of royal steel, one piece of draconian steel and one piece of hell steel. I believe a smith should be able to help you here. ...'
  storyMessage[11] = 'Did you understand everything I told you and are willing to handle this task?'
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Too bad.')
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'yes') then
	selfSay('Fine. Return to me when you have retrieved an armor.')
	setPlayerStorageValue(cid,9853,1)
	setPlayerStorageValue(cid,9854,1)
	talk_state = 0
	
	elseif msgcontains(msg,'addon') and value7 == 1 or
	msgcontains(msg,'crown armor') and value7 == 1 or
	msgcontains(msg,'outfit') and value7 == 1 then
	selfSay('I’m so excited! Do you have my crown armor?')
	talk_state = 7
	
	elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Too bad.')
	talk_state = 0
	
	elseif talk_state == 7 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2487) >= 1 then
	selfSay('Yeah! Finally! You can’t imagine how much I have longed for this armor. Please bring me 100 pieces of green dragon leather and 100 pieces of red dragon leather now!')
	setPlayerStorageValue(cid,9854,-1)
	setPlayerStorageValue(cid,9855,1)
	doPlayerRemoveItem(cid,2487,1)
	talk_state = 0
	else
	selfSay('No, I\'m afraid you don\'t have this item.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'addon') and value8 == 1 or
	msgcontains(msg,'leather') and value8 == 1 or
	msgcontains(msg,'outfit') and value8 == 1 then
	selfSay('Have you brought me 100 pieces of red dragon leather and 100 pieces of green dragon leather?')
	talk_state = 8
	
	elseif talk_state == 8 and msgcontains(msg,'no') then
	selfSay('Too bad.')
	talk_state = 0
	
	elseif talk_state == 8 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5877) >= 100 and getPlayerItemCount(cid,5948) >= 100 then
	selfSay('Good work! That is enough leather for a lot of sturdy quivers. Now, please bring me 5 enchanted chicken wings.')
	setPlayerStorageValue(cid,9855,-1)
	setPlayerStorageValue(cid,9856,1)
	doPlayerRemoveItem(cid,5877,100)
	doPlayerRemoveItem(cid,5948,100)
	talk_state = 0
	else
	selfSay('No, I\'m afraid you don\'t have these items.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'addon') and value9 == 1 or
	msgcontains(msg,'chicken') and value9 == 1 or
	msgcontains(msg,'outfit') and value9 == 1 then
	selfSay('Have you collected the 5 enchanted chicken wings as I requested?')
	talk_state = 9
	
	elseif talk_state == 9 and msgcontains(msg,'no') then
	selfSay('Too bad.')
	talk_state = 0
	
	elseif talk_state == 9 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5891) >= 5 then
	selfSay('Great! Now I can create a few more Tiaras. If only they weren\'t that expensive... well anyway, please obtain one piece of royal steel, draconian steel and hell steel each.')
	setPlayerStorageValue(cid,9856,-1)
	setPlayerStorageValue(cid,9857,1)
	doPlayerRemoveItem(cid,5891,5)
	talk_state = 0
	else
	selfSay('No, I\'m afraid you don\'t have these items.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'addon') and value10 == 1 or
	msgcontains(msg,'steel') and value10 == 1 or
	msgcontains(msg,'outfit') and value10 == 1 then
	selfSay('Were you able to get hold of the piece of royal steel, draconian steel and hell steel?')
	talk_state = 10
	
	elseif talk_state == 10 and msgcontains(msg,'no') then
	selfSay('Too bad.')
	talk_state = 0
	
	elseif talk_state == 10 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,5887) >= 1 and 
	getPlayerItemCount(cid,5888) >= 1 and
	getPlayerItemCount(cid,5889) >= 1 then
	selfSay('Wow, I\'m impressed! Your really are a valuable friend. I shall grant you your reward now. Wear it proudly!')
	setPlayerStorageValue(cid,9857,-1)
	setPlayerStorageValue(cid,9858,1)
	doPlayerAddOutfit(cid,129,1)
	doPlayerAddOutfit(cid,137,2)
	doPlayerRemoveItem(cid,5887,1)
	doPlayerRemoveItem(cid,5888,1)
	doPlayerRemoveItem(cid,5889,1)
	talk_state = 0
	else
	selfSay('No, I\'m afraid you don\'t have these items.')
	talk_state = 0
	end
	elseif msgcontains(msg,'addon') and value11 == 1 or
	msgcontains(msg,'outfit') and value11 == 1 then
	selfSay('You have completed these missions, already.')
	talk_state = 0

end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
