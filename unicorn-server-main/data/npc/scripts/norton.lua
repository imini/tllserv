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
	if (os.clock() - talk_story) > 6 and story > 0 then
    
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
            story = 7

        elseif story == 7 then 
        
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



-----------------------------------------------------------------------------------------------------
function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end

	value0 = getPlayerStorageValue(cid,9600)
	value1 = getPlayerStorageValue(cid,7303)
	value2 = getPlayerStorageValue(cid,7304)
	value3 = getPlayerStorageValue(cid,7305)
	value4 = getPlayerStorageValue(cid,7306)
	value5 = getPlayerStorageValue(cid,7307)
	value6 = getPlayerStorageValue(cid,7308)
	value7 = getPlayerStorageValue(cid,7309)
	value8 = getPlayerStorageValue(cid,7310)
  value9 = getPlayerStorageValue(cid,7311)
  value10 = getPlayerStorageValue(cid,7312)
  value11 = getPlayerStorageValue(cid,7313)
  malesheriff = getPlayerStorageValue(cid,7601)
  femalesheriff =  getPlayerStorageValue(cid,7602)
  malesheriffdone = getPlayerStorageValue(cid,7603)
  femalesheriffdone =  getPlayerStorageValue(cid,7604)
  msg = string.lower(msg)
  
		if msgcontains(msg, 'outfit') and value0 == -1 and getPlayerSex(cid) == 0 or
    msgcontains(msg, 'addon') and value0 == -1 and getPlayerSex(cid) == 0 then
			selfSay('I am not really sure this cloak would fit on you, mylady. Instead, I believe I could try to get my hands on a shiny tiara. But this is of course only if you want to prove yourself worthy to wear it.')
			talk_state = 1
			
elseif msgcontains(msg, 'outfit') and value0 == -1 and getPlayerSex(cid) == 1 or
    msgcontains(msg, 'addon') and value0 == -1 and getPlayerSex(cid) == 1 then
			selfSay('I can see you’re clancing at my cloak I wear. I suppose you want one. But this is of course only if you want to prove yourself worthy to wear it.')
			talk_state = 14

		elseif talk_state == 14 and msgcontains(msg, 'prove') and getPlayerSex(cid) == 1 or 
		talk_state == 14 and msgcontains(msg, 'worthy') and getPlayerSex(cid) == 1 then
			selfSay('Well... maybe, if you help me a little, I could convince the Celerian Academy that you are a valuable help here and deserve an award too. How about it?') --- female
			talk_state = 15

		elseif talk_state == 1 and msgcontains(msg, 'prove') and getPlayerSex(cid) == 0 or 
		talk_state == 1 and msgcontains(msg, 'worthy') and getPlayerSex(cid) == 0 then
			selfSay('Well... maybe, if you help me a little, I could convince the Celerian Academy that you are a valuable help here and deserve an award too. How about it?') --- female
			talk_state = 2
			
			elseif talk_state == 2 and msgcontains(msg, 'no') then
			selfSay('Fine with me.')
			talk_state = 0
elseif talk_state == 15 and msgcontains(msg, 'no') then
			selfSay('Fine with me.')
			talk_state = 0
			
		elseif talk_state == 2 and msgcontains(msg, 'yes') then
	  selfSay('Okay, great! You see, I need a few magical ingredients which I\'ve run out of. First of all, please bring me 70 bat wings. ...')
		story = 1
		talk_start = os.clock()
		talk_story = os.clock()
		storyMessage[1] = 'Then, I urgently need a lot of red cloth. I think 20 pieces should suffice. ...'
		storyMessage[2] = 'Oh, and also, I could use a whole load of throwing stars. Please bring me 100 pieces. ...'
		storyMessage[3] = 'After that, um, let me think... I\'d like to have some holy orchids. Or no, many holy orchids, to be safe. Like 35. ...'
		storyMessage[4] = 'Then, 10 spools of spider silk yarn, 60 green dragon scales and 40 red dragon scales. ...'
			storyMessage[5] = 'I know I\'m forgetting something.. wait... ah yes, 15 ounces of magic sulphur and 30 ounces of vampire dust. ...'
			storyMessage[6] = 'That\'s it already! Easy task, isn\'t it? I\'m sure you could get all of that within a short time. ...'
			storyMessage[7] = 'Did you understand everything I told you and are willing to handle this task?'
    talk_state = 3
    
		  elseif talk_state == 3 and msgcontains(msg, 'yes') then
			selfSay('Fine! Let\'s start with the 70 bat wings.')
			setPlayerStorageValue(cid,9600,1)
			setPlayerStorageValue(cid,7303,1)
			talk_state = 0
			
			elseif talk_state == 3 and msgcontains(msg, 'no') then
			selfSay('Very well with me.')
			talk_state = 0



---------------------------------- bat wing ----------------------------
		
		elseif msgcontains(msg, 'bat wing') and value1 == 1
		or msgcontains(msg, 'outfit') and value1 == 1 
		or msgcontains(msg, 'addon') and value1 == 1 then
			selfSay('Oh, did you bring me 70 bat wings?')
			talk_state = 4

    elseif talk_state == 4 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 4 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5894) >= 70 then
		doPlayerTakeItem(cid,5894,70)
		setPlayerStorageValue(cid,7303,-1)
		setPlayerStorageValue(cid,7304,1)
    selfSay('Thank you! I really needed them for my anti-wrinkle lotion. Now, please bring me 20 pieces of red cloth.')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- red cloth ----------------------------

		elseif msgcontains(msg, 'cloth') and value2 == 1
		or msgcontains(msg, 'outfit') and value2 == 1 
		or msgcontains(msg, 'addon') and value2 == 1 then
			selfSay('Have you found 20 pieces of red cloth?')
			talk_state = 5

    elseif talk_state == 5 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 5 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5911) >= 20 then
		doPlayerTakeItem(cid,5911,20)
		setPlayerStorageValue(cid,7304,-1)
		setPlayerStorageValue(cid,7305,1)
    selfSay('Great! This should be enough for my new shirt. Don\'t forget to bring me 100 throwing stars next!')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- throwing star ----------------------------

		elseif msgcontains(msg, 'throwing star') and value3 == 1
		or msgcontains(msg, 'outfit') and value3 == 1 
		or msgcontains(msg, 'addon') and value3 == 1 then
			selfSay('Have you collected 100 throwing stars?')
			talk_state = 6

    elseif talk_state == 6 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 6 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,2399) >= 100 then
		doPlayerTakeItem(cid,2399,100)
		setPlayerStorageValue(cid,7305,-1)
		setPlayerStorageValue(cid,7306,1)
    selfSay('Good work. I will need those to cut my cucumber. Next, get me 35 holy orchids.')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- holy orchid ----------------------------

		elseif msgcontains(msg, 'orchid') and value4 == 1
		or msgcontains(msg, 'outfit') and value4 == 1 
		or msgcontains(msg, 'addon') and value4 == 1 then
			selfSay('Did you convince the elves to give you 35 holy orchids?')
			talk_state = 7

    elseif talk_state == 7 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 7 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5922) >= 35 then
		doPlayerTakeItem(cid,5922,35)
		setPlayerStorageValue(cid,7306,-1)
		setPlayerStorageValue(cid,7307,1)
    selfSay('Thank god! The scent of holy orchids is simply the only possible solution against the horrible stench from the vomit. Now, please bring me 10 rolls of spider silk yarn!')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- spider silk yarn ----------------------------

		elseif msgcontains(msg, 'yarn') and value5 == 1
		or msgcontains(msg, 'outfit') and value5 == 1 
		or msgcontains(msg, 'addon') and value5 == 1 then
			selfSay('Oh, did you bring 10 spools of spider silk yarn for me?')
			talk_state = 8

    elseif talk_state == 8 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 8 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5886) >= 10 then
		doPlayerTakeItem(cid,5886,10)
		setPlayerStorageValue(cid,7307,-1)
		setPlayerStorageValue(cid,7308,1)
    selfSay('I appreciate it. My pet doggie manages to bite through all sorts of leashes, which is why he is always gone. I\'m sure this strong yarn will keep him. Now, go for the 60 green dragon scales!')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- green dragon scale ----------------------------

		elseif msgcontains(msg, 'green dragon scale') and value6 == 1
		or msgcontains(msg, 'outfit') and value6 == 1 
		or msgcontains(msg, 'addon') and value6 == 1 then
			selfSay('Have you found 60 green dragon scales?')
			talk_state = 9

    elseif talk_state == 9 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 9 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5920) >= 60 then
		doPlayerTakeItem(cid,5920,60)
		setPlayerStorageValue(cid,7308,-1)
		setPlayerStorageValue(cid,7309,1)
    selfSay('Good job. They will look almost like sequins on my new shirt. Please go for the 40 red dragon scales now.')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- red dragon scale ----------------------------

		elseif msgcontains(msg, 'red dragon scale') and value7 == 1
		or msgcontains(msg, 'outfit') and value7 == 1 
		or msgcontains(msg, 'addon') and value7 == 1 then
			selfSay('Were you able to get all 40 red dragon scales?')
			talk_state = 10

    elseif talk_state == 10 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 10 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5882) >= 40 then
		doPlayerTakeItem(cid,5882,40)
		setPlayerStorageValue(cid,7309,-1)
		setPlayerStorageValue(cid,7310,1)
    selfSay('Thanks! They make a pretty decoration, don\'t you think? Please bring me 15 ounces of magic sulphur now!')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- magic sulphur ----------------------------

		elseif msgcontains(msg, 'sulphur') and value8 == 1
		or msgcontains(msg, 'outfit') and value8 == 1 
		or msgcontains(msg, 'addon') and value8 == 1 then
			selfSay('Have you collected 15 ounces of magic sulphur?')
			talk_state = 11

    elseif talk_state == 11 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 11 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5904) >= 15 then
		doPlayerTakeItem(cid,5904,15)
		setPlayerStorageValue(cid,7310,-1)
		setPlayerStorageValue(cid,7311,1)
    selfSay('Ah, that\'s enough magic sulphur for my new peeling. You should try it once, your skin gets incredibly smooth. Now, the only thing I need is vampire dust. 30 ounces will suffice.')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- vampire dust ----------------------------

		elseif msgcontains(msg, 'vampire dust') and value9 == 1
		or msgcontains(msg, 'outfit') and value9 == 1 
		or msgcontains(msg, 'addon') and value9 == 1 then
			selfSay('Have you gathered 30 ounces of vampire dust?')
			talk_state = 12

    elseif talk_state == 12 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 12 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5905) >= 30 then
		doPlayerTakeItem(cid,5905,30)
		setPlayerStorageValue(cid,7311,-1)
		setPlayerStorageValue(cid,7312,1)
    selfSay('Ah, great. Now I can finally finish the potion which the Celerian Academy asked me to. I guess, now you want your reward, don’t you?')
		talk_state = 13
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end


----------------------------------- done ------------------------------------------
 elseif value10 == 1 and msgcontains(msg, 'addon') and getPlayerSex(cid) == 0 then
    selfSay('Go to the sheriff of Celeres and ask him for the cloak. He is not involved in the Celerian Academy, but I will tell someone to give him the tiara.')
    setPlayerStorageValue(cid,7602,1)
			setPlayerStorageValue(cid,7312,-1)
    talk_state = 0
    
 elseif talk_state == 13 and msgcontains(msg, 'no') and getPlayerSex(cid) == 0 then
    selfSay('Walk to the sheriff of Celeres when you feel like having it then. I have instructed people from the Academy to give him the tiara.')
			setPlayerStorageValue(cid,7602,1)
			setPlayerStorageValue(cid,7312,-1)
			talk_state = 0
			
    talk_state = 0
		elseif talk_state == 13 and msgcontains(msg, 'yes') and getPlayerSex(cid) == 0 then
			selfSay('Go to the sheriff of Celeres and ask him for the tiara. He is not involved in the Celerian Academy, but I will tell someone to give him the tiara.')
			setPlayerStorageValue(cid,7602,1)
			setPlayerStorageValue(cid,7312,-1)

		elseif msgcontains(msg, 'addon') and femalesheriff == 1 and getPlayerSex(cid) == 0 then
			selfSay('Go to the sheriff of Celeres and ask him for the tiara. He is not involved in the Celerian Academy, but I will tell someone to give him the tiara.')
			
			elseif msgcontains(msg, 'addon') and femalesheriffdone == 1 and getPlayerSex(cid) == 0 then
			selfSay('The sheriff sent me mail telling he has given you the tiara. Hope you like it.')

-------------------------- new -----------------------


    

		elseif talk_state == 15 and msgcontains(msg, 'yes') then
	  selfSay('Okay, great! You see, I need a few magical ingredients which I\'ve run out of. First of all, please bring me 70 bat wings. ...')
		story = 1
		talk_start = os.clock()
		talk_story = os.clock()
		storyMessage[1] = 'Then, I urgently need a lot of red cloth. I think 20 pieces should suffice. ...'
		storyMessage[2] = 'Oh, and also, I could use a whole load of throwing stars. Please bring me 100 pieces. ...'
		storyMessage[3] = 'After that, um, let me think... I\'d like to have some holy orchids. Or no, many holy orchids, to be safe. Like 35. ...'
		storyMessage[4] = 'Then, 10 spools of spider silk yarn, 60 green dragon scales and 40 red dragon scales. ...'
			storyMessage[5] = 'I know I\'m forgetting something.. wait... ah yes, 15 ounces of magic sulphur and 30 ounces of vampire dust. ...'
			storyMessage[6] = 'That\'s it already! Easy task, isn\'t it? I\'m sure you could get all of that within a short time. ...'
			storyMessage[7] = 'Did you understand everything I told you and are willing to handle this task?'
    talk_state = 16
    
		  elseif talk_state == 16 and msgcontains(msg, 'yes') then
			selfSay('Fine! Let\'s start with the 70 bat wings.')
			setPlayerStorageValue(cid,9600,1)
			setPlayerStorageValue(cid,7303,1)
			talk_state = 0
			
			elseif talk_state == 16 and msgcontains(msg, 'no') then
			selfSay('Very well with me.')
			talk_state = 0



---------------------------------- bat wing ----------------------------
		
		elseif msgcontains(msg, 'bat wing') and value1 == 1
		or msgcontains(msg, 'outfit') and value1 == 1 
		or msgcontains(msg, 'addon') and value1 == 1 then
			selfSay('Oh, did you bring me 70 bat wings?')
			talk_state = 17

    elseif talk_state == 17 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 17 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5894) >= 70 then
		doPlayerTakeItem(cid,5894,70)
		setPlayerStorageValue(cid,7303,-1)
		setPlayerStorageValue(cid,7304,1)
    selfSay('Thank you! I really needed them for my anti-wrinkle lotion. Now, please bring me 20 pieces of red cloth.')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- red cloth ----------------------------

		elseif msgcontains(msg, 'cloth') and value2 == 1
		or msgcontains(msg, 'outfit') and value2 == 1 
		or msgcontains(msg, 'addon') and value2 == 1 then
			selfSay('Have you found 20 pieces of red cloth?')
			talk_state = 18

    elseif talk_state == 18 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 18 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5911) >= 20 then
		doPlayerTakeItem(cid,5911,20)
		setPlayerStorageValue(cid,7304,-1)
		setPlayerStorageValue(cid,7305,1)
    selfSay('Great! This should be enough for my new shirt. Don\'t forget to bring me 100 throwing stars next!')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- throwing star ----------------------------

		elseif msgcontains(msg, 'throwing star') and value3 == 1
		or msgcontains(msg, 'outfit') and value3 == 1 
		or msgcontains(msg, 'addon') and value3 == 1 then
			selfSay('Have you collected 100 throwing stars?')
			talk_state = 19

    elseif talk_state == 19 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 19 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,2399) >= 100 then
		doPlayerTakeItem(cid,2399,100)
		setPlayerStorageValue(cid,7305,-1)
		setPlayerStorageValue(cid,7306,1)
    selfSay('Good work. I will need those to cut my cucumber. Next, get me 35 holy orchids.')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- holy orchid ----------------------------

		elseif msgcontains(msg, 'orchid') and value4 == 1
		or msgcontains(msg, 'outfit') and value4 == 1 
		or msgcontains(msg, 'addon') and value4 == 1 then
			selfSay('Did you convince the elves to give you 35 holy orchids?')
			talk_state = 20

    elseif talk_state == 20 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 20 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5922) >= 35 then
		doPlayerTakeItem(cid,5922,35)
		setPlayerStorageValue(cid,7306,-1)
		setPlayerStorageValue(cid,7307,1)
    selfSay('Thank god! The scent of holy orchids is simply the only possible solution against the horrible stench from the vomit. Now, please bring me 10 rolls of spider silk yarn!')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- spider silk yarn ----------------------------

		elseif msgcontains(msg, 'yarn') and value5 == 1
		or msgcontains(msg, 'outfit') and value5 == 1 
		or msgcontains(msg, 'addon') and value5 == 1 then
			selfSay('Oh, did you bring 10 spools of spider silk yarn for me?')
			talk_state = 21

    elseif talk_state == 21 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 21 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5886) >= 10 then
		doPlayerTakeItem(cid,5886,10)
		setPlayerStorageValue(cid,7307,-1)
		setPlayerStorageValue(cid,7308,1)
    selfSay('I appreciate it. My pet doggie manages to bite through all sorts of leashes, which is why he is always gone. I\'m sure this strong yarn will keep him. Now, go for the 60 green dragon scales!')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- green dragon scale ----------------------------

		elseif msgcontains(msg, 'green dragon scale') and value6 == 1
		or msgcontains(msg, 'outfit') and value6 == 1 
		or msgcontains(msg, 'addon') and value6 == 1 then
			selfSay('Have you found 60 green dragon scales?')
			talk_state = 22

    elseif talk_state == 22 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 22 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5920) >= 60 then
		doPlayerTakeItem(cid,5920,60)
		setPlayerStorageValue(cid,7308,-1)
		setPlayerStorageValue(cid,7309,1)
    selfSay('Good job. They will look almost like sequins on my new shirt. Please go for the 40 red dragon scales now.')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- red dragon scale ----------------------------

		elseif msgcontains(msg, 'red dragon scale') and value7 == 1
		or msgcontains(msg, 'outfit') and value7 == 1 
		or msgcontains(msg, 'addon') and value7 == 1 then
			selfSay('Were you able to get all 40 red dragon scales?')
			talk_state = 23

    elseif talk_state == 23 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 23 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5882) >= 40 then
		doPlayerTakeItem(cid,5882,40)
		setPlayerStorageValue(cid,7309,-1)
		setPlayerStorageValue(cid,7310,1)
    selfSay('Thanks! They make a pretty decoration, don\'t you think? Please bring me 15 ounces of magic sulphur now!')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- magic sulphur ----------------------------

		elseif msgcontains(msg, 'sulphur') and value8 == 1
		or msgcontains(msg, 'outfit') and value8 == 1 
		or msgcontains(msg, 'addon') and value8 == 1 then
			selfSay('Have you collected 15 ounces of magic sulphur?')
			talk_state = 24

    elseif talk_state == 24 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 24 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5904) >= 15 then
		doPlayerTakeItem(cid,5904,15)
		setPlayerStorageValue(cid,7310,-1)
		setPlayerStorageValue(cid,7311,1)
    selfSay('Ah, that\'s enough magic sulphur for my new peeling. You should try it once, your skin gets incredibly smooth. Now, the only thing I need is vampire dust. 30 ounces will suffice.')
		talk_state = 0
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end

---------------------------------- vampire dust ----------------------------

		elseif msgcontains(msg, 'vampire dust') and value9 == 1
		or msgcontains(msg, 'outfit') and value9 == 1 
		or msgcontains(msg, 'addon') and value9 == 1 then
			selfSay('Have you gathered 30 ounces of vampire dust?')
			talk_state = 25

    elseif talk_state == 25 and msgcontains(msg, 'no') then
    selfSay('Okay.')
    
		elseif talk_state == 25 and msgcontains(msg, 'yes') then
    if getPlayerItemCount(cid,5905) >= 30 then
		doPlayerTakeItem(cid,5905,30)
		setPlayerStorageValue(cid,7311,-1)
		setPlayerStorageValue(cid,7312,1)
    selfSay('Ah, great. Now I can finally finish the potion which the Celerian Academy asked me to. I guess, now you want your reward, don’t you?')
		talk_state = 26
		else
		selfSay('Come back when you got them instead!')
		talk_state = 0
		end


----------------------------------- done ------------------------------------------
    elseif value10 == 1 and msgcontains(msg, 'addon') and getPlayerSex(cid) == 1 then
    selfSay('Go to the sheriff of Celeres and ask him for the cloak. He is not involved in the Celerian Academy, but I will tell someone to give him the cloak.')
    setPlayerStorageValue(cid,7601,1)
			setPlayerStorageValue(cid,7312,-1)
    talk_state = 0
    
    elseif talk_state == 26 and msgcontains(msg, 'no') and getPlayerSex(cid) == 1 then
    selfSay('Walk to the sheriff of Celeres when you feel like having it then. I have instructed people from the Academy to give him the cloak.')
    setPlayerStorageValue(cid,7601,1)
			setPlayerStorageValue(cid,7312,-1)
    talk_state = 0

		elseif talk_state == 26 and msgcontains(msg, 'yes') and getPlayerSex(cid) == 1 then
			selfSay('Go to the sheriff of Celeres and ask him for the cloak. He is not involved in the Celerian Academy, but I will tell someone to give him the cloak.')
			setPlayerStorageValue(cid,7601,1)
			setPlayerStorageValue(cid,7312,-1)

		elseif msgcontains(msg, 'addon') and malesheriff == 1 and getPlayerSex(cid) == 1 then
			selfSay('Go to the sheriff of Celeres and ask him for the cloak. He is not involved in the Celerian Academy, but I will tell someone to give him the cloak.')

			elseif msgcontains(msg, 'addon') and malesheriffdone == 1 and getPlayerSex(cid) == 1 then
			selfSay('The sheriff sent me mail telling he has given you the cloak. Hope you like it.')
end
return true
end
-----------------------------------------------------------------------------------------------------
function returnVials(cid, message, keywords, parameters, node)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	local amount = removePlayerItemsWithCharges(cid, parameters.itemid, parameters.charges)
	if(amount <= 0) then
		npcHandler:say('You do not have any.')
	else
		local price = amount*parameters.cost
		if(doPlayerAddMoney(cid, price) == LUA_NO_ERROR) then
			npcHandler:say('Here are your reward of ' .. price .. ' gold coins. It was a pleasure doing business with you.')
		else
			error('[Error] returnVials:', 'Could not give ' .. price .. ' gold coins to player ' .. getPlayerName(cid))
		end
	end
	npcHandler:resetNpc()
	return true
end
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 	2006, 55, 	7,	'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 		2006, 25, 	10, 	'life fluid')
shopModule:addBuyableItem({'heavy magic missile rune', 'heavy magic missile rune'}, 	2311, 125, 	5,	'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball rune', 'great fireball rune'}, 		2304, 180, 	2, 	'great fireball rune')
shopModule:addBuyableItem({'ultimate healing rune', 'ultimate healing rune'}, 		2273, 175, 	1, 	'ultimate healing rune')
shopModule:addBuyableItem({'sudden death rune', 'sudden death rune'}, 		2268, 325, 	1, 	'sudden death rune')
shopModule:addBuyableItem({'destroy field rune', 'destroy field rune'}, 		2261, 85, 	3, 	'destroy field rune')
shopModule:addBuyableItem({'firebomb rune', 'firebomb rune'}, 		2305, 235, 	2, 	'firebomb rune')
shopModule:addBuyableItem({'antidote rune', 'antidote rune'}, 		2266, 65, 	1, 	'antidote rune')
shopModule:addBuyableItem({'intense healing rune', 'intense healing rune'}, 		2265, 95, 	1, 	'intense healing rune')
shopModule:addBuyableItem({'poisonbomb rune', 'poisonbomb rune'}, 		2286, 170, 	2, 	'poisonbomb rune')
shopModule:addBuyableItem({'magicwall rune', 'magic wall rune'}, 		2293, 350, 	3, 	'magic wall rune')
shopModule:addBuyableItem({'soulfire rune', 'soulfire rune'}, 		2308, 210, 	2, 	'soulfire rune')
shopModule:addBuyableItem({'wand of vortex', 'wand of vortex'}, 		2190, 500, 		'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'wand of dragonbreath'}, 		2191, 1000, 		'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'wand of plague'}, 		2188, 5000, 		'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'wand of cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'wand of inferno'}, 2187,  15000, 'wand of inferno')
shopModule:addBuyableItem({'snakebite rod', 'snakebite rod'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight rod'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic rod'}, 2185, 5000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire rod'}, 2181, 10000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest rod'}, 2183, 15000, 'tempest rod')
shopModule:addBuyableItem({'blank', ' blank rune'}, 			2260, 10, 		'blank rune')

local node = keywordHandler:addKeyword({'flask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Alright then.'})
local node = keywordHandler:addKeyword({'vial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will pay you 5 gold for every empty vial. Ok?'})
	node:addChildKeyword({'yes'}, returnVials, {itemid = 2006, charges = 0, cost = 5})
	node:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Alright then.'})



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
