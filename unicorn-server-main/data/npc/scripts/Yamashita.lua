
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
local storyMessage = {}
local story = 0
local talk_story = 0
function onThink() npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 8 and story > 0 then
    
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
			story = 13
		elseif story == 13 then 
        
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


  msg = string.lower(msg)
	value1 = getPlayerStorageValue(cid,4356)
	value2 = getPlayerStorageValue(cid,4355)
	
	value3 = getPlayerStorageValue(cid,7468)
	value4 = getPlayerStorageValue(cid,7466)
	value5 = getPlayerStorageValue(cid,7467)
	value6 = getPlayerStorageValue(cid,7469)
	value7 = getPlayerStorageValue(cid,7470)
	value8 = getPlayerStorageValue(cid,7471)
	value9 = getPlayerStorageValue(cid,7472)
	ninjavalue1 = getPlayerStorageValue(cid,9633)
  ninjavalue2 = getPlayerStorageValue(cid,9629)
  
	if msgcontains(msg, 'revenge') then
	if value1 == -1 then
			selfSay('I’m longing for the day when I can get my own back! Wait a minute... perhaps, perhaps you could help me? I would reward you generously. Can you?')
	    		talk_state = 5
		else
			selfSay('You have already helped me with the revenge. Thank you alot, ' .. getPlayerName(cid) .. '!')
	    		talk_state = 5
	end
	elseif talk_state == 5 and msgcontains(msg, 'yes') then
        		selfSay('Ah, finally! But, I must warn you of my people... sorry, my former people. They are very, very skilled with their weapons and only one can be a lethal threat to you. ...')
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'My advice is that you try to sneak past them instead of slaying them. But very well, are you really willing to take the risk?'
			talk_state = 6

	elseif talk_state == 6 and msgcontains(msg, 'yes') then
	selfSay('Wonderful! Listen then, deep down in their underground hideout, they have buried their ancient master Sanjuro Yukihime. He was a legend when he was alive, and even more when he died. ...')
			story = 2
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[2] = 'However, his tomb lays in a sacrifical hall beneath the throneroom, heavily guarded, presumably. You must sneak in their, and then steal Sanjuros skull from his tomb. Bring it here to me, but treat it carefully – it’s of high value to me... and all other ninjas aswell. ...'
			storyMessage[3] = 'My intentions are to have it here with me, not with them. And here’s the best part of the plan: if you succeed in stealing it, and don’t show yourself too much, they will believe that the theft has been made by the djinns. They’re in war with the djinns, you know. ...'
			storyMessage[4] = 'But now go. Good luck, brave warrior. Just stay cautious at all times.'
			setPlayerStorageValue(cid,4335,1)
			talk_state = 0


	elseif msgcontains(msg, 'skull') or msgcontains(msg, 'mission') then
			if value2 == 1 then
			if value1 == -1 then
			selfSay('Have you already obtained the skull of Sanjuro?')
			talk_state = 1
		else
			talk_state = 0
			selfSay('Thanks again for the skull of Sanjuro.')
	end
		else

			talk_state = 0
	end
		elseif talk_state == 1 then
			if value1 == -1 then
			if msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,2320)  >= 1 then
			doPlayerTakeItem(cid,2320,1)
			doPlayerAddItem(cid,7407,1)
			setPlayerStorageValue(cid,4356,1)
			   selfSay('Wonderful! This must be rewarded. Take this weapon as an appreciation of your struggles.')
			talk_state = 0
			else
				selfSay('No, you haven\'t! Please bring it to me.')
			talk_state = 0
end
end
end

	elseif value3 == -1 and msgcontains(msg,'addon') or
	value3 == -1 and msgcontains(msg,'outfit') then
	selfSay('I see you like my outfit. I must tell you though, ' .. getPlayerName(cid) .. ', only certain people may wear them. ...')
			story = 6
			talk_start = os.clock()
			talk_story = os.clock()
				storyMessage[6] = 'For you see, the outfit is a true sign of courage and power. I can allow you to wear it, but only if you do me a favour. ...'
				storyMessage[7] = 'The favour is undeniably dangerous, and you will have to gather many ingredients to an ancient potion which I have to make. ...'
				storyMessage[8] = 'All this is part of a plan which I for so long have been planning. ...'
				storyMessage[9] = 'Anyway. Listen to this old formula, and don’t forget to remember all the ingredients. ...'
				storyMessage[10] = '30 beholder eyes. And then it says 10 red dragon scales and 30 green ones. ...'
				storyMessage[11] = 'I also need 20 blue pieces of cloth. Wait, are you writing this down? It’s alot more. ...'
				storyMessage[12] = '20 oz of vampire dust and 10 oz of demon dust is important too... and lastly, a flask of warriors sweat. I believe the djinns knows more of that.  ...'
				storyMessage[13] = 'Let’s take it step by step. Bring me 30 beholder eyes.'
				setPlayerStorageValue(cid,7468,1)
				setPlayerStorageValue(cid,7466,1)

	elseif value4 == 12 and msgcontains(msg,'addon') or
	value4 == 1 and msgcontains(msg,'beholder eyes') or
	value4 == 1 and msgcontains(msg,'outfit') then
	selfSay('Have you gathered the 30 beholder eyes now?')
	talk_state = 13
	
	elseif talk_state == 13 and msgcontains(msg,'no') then
	selfSay('Come back when you have.')
	talk_state = 0
	
  elseif talk_state == 13 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5898) >= 30 then
	selfSay('Awesome. Now bring me 10 red dragon scales and 30 green ones.')
	setPlayerStorageValue(cid,7466,-1)
	setPlayerStorageValue(cid,7467,1)
	doPlayerRemoveItem(cid,5898,30)
	talk_state = 0
	else
	selfSay('You shouldn\'t lie.')
	talk_state = 0
	end

	elseif value5 == 1 and msgcontains(msg,'addon') or
	value5 == 1 and msgcontains(msg,'dragon scales') or
	value5 == 1 and msgcontains(msg,'outfit') then
	selfSay('Have you gathered the 10 red dragon scales and the 30 green?')
	talk_state = 14
	
	elseif talk_state == 14 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0

  elseif talk_state == 14 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5920) >= 30 and getPlayerItemCount(cid,5882) >= 10 then
	selfSay('Truly amazing. Now go for the 20 blue pieces of cloth.')
	setPlayerStorageValue(cid,7467,-1)
	setPlayerStorageValue(cid,7469,1)
	doPlayerRemoveItem(cid,5882,10)
	doPlayerRemoveItem(cid,5920,30)
	talk_state = 0
	else
	selfSay('Don\'t lie me.')
	talk_state = 0
	end


	elseif value6 == 1 and msgcontains(msg,'addon') or
	value6 == 1 and msgcontains(msg,'blue cloth') or
	value6 == 1 and msgcontains(msg,'outfit') then
	selfSay('Have you collected 20 pieces of blue cloth?')
	talk_state = 15
	
	elseif talk_state == 15 and msgcontains(msg,'no') then
	selfSay('Come back when you have, then.')
	talk_state = 0
	
  elseif talk_state == 15 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5912) >= 20 then
	selfSay('Good work. Now collect the 20 oz of vampire dust and the 10 oz of demon dust.')
	setPlayerStorageValue(cid,7469,-1)
	setPlayerStorageValue(cid,7470,1)
	doPlayerRemoveItem(cid,5912,20)
	talk_state = 0
	else
	selfSay('You don\'t have it.')
	talk_state = 0
	end

	elseif value7 == 1 and msgcontains(msg,'addon') or
	value7 == 1 and msgcontains(msg,'dust') or
	value7 == 1 and msgcontains(msg,'outfit') then
	selfSay('So have you found the 20 oz of vampire dust and the 10 oz of demon dust?')
	talk_state = 16
	
	elseif talk_state == 16 and msgcontains(msg,'no') then
	selfSay('Come back when you have it.')
	talk_state = 0
	
  elseif talk_state == 16 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5906) >= 10 and getPlayerItemCount(cid,5905) >= 20 then
	selfSay('Finally. We are soon done. Now I will need one flask of warriors sweat, and the potion shall be done.')
	setPlayerStorageValue(cid,7470,-1)
	setPlayerStorageValue(cid,7471,1)
	doPlayerRemoveItem(cid,5906,10)
	doPlayerRemoveItem(cid,5905,20)
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have it. Please bring me it.')
	talk_state = 0
	end

	elseif value8 == 1 and msgcontains(msg,'addon') or
	value8 == 1 and msgcontains(msg,'warriors sweat') or
	value8 == 1 and msgcontains(msg,'outfit') then
	selfSay('So have you found the warriors sweat?')
	talk_state = 17
	
	elseif talk_state == 17 and msgcontains(msg,'no') then
	selfSay('Come back when you have it.')
	talk_state = 0
	
  elseif talk_state == 17 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5885) >= 1 then
	selfSay('Well then. I will keep my word, and here are your outfit. Wear it with true pride, although it lacks its headpiece.')
	doPlayerAddOutfit(cid,156,0)
	doPlayerAddOutfit(cid,152,0)
	setPlayerStorageValue(cid,7471,-1)
	setPlayerStorageValue(cid,7472,1)
	doPlayerRemoveItem(cid,5885,1)
	talk_state = 0
	else
	selfSay('Sorry, but you don\'t have it.')
	talk_state = 0
	end

	elseif value9 == 1 and msgcontains(msg,'outfit') or
	value9 == 1 and msgcontains(msg,'addon') then
	selfSay('You have already finished the mission I gave you and you have also recieved an outfit as a reward.')
	
	elseif ninjavalue1 == 1 and ninjavalue2 == -1 and msgcontains(msg,'proof') or
  ninjavalue1 == 1 and ninjavalue2 == -1 and msgcontains(msg,'death') or
  ninjavalue1 == 1 and ninjavalue2 == -1 and msgcontains(msg,'kill') or
  ninjavalue1 == 1 and ninjavalue2 == -1 and msgcontains(msg,'eliminate') then
  selfSay('This is bad news. I knew the day would come when they sent an assassin. But listen to me, you don\'t look like a murderer. Are you one?')
  talk_state = 20
  
  elseif ninjavalue2 == 1 and msgcontains(msg,'proof') or
  ninjavalue2 == 1 and msgcontains(msg,'death') or
  ninjavalue2 == 1 and msgcontains(msg,'kill') or
  ninjavalue2 == 1 and msgcontains(msg,'eliminate') then
  selfSay('Bring my pillow to Agilit, and tell him you have successfully killed me.')
  talk_state = 0
  
  elseif talk_state == 20 and msgcontains(msg,'no') then
	selfSay('No, I thought so. You don\'t have to kill me to fulfill your mission. You can convince Agilit that I am dead, and I know exactly how. You must take a dear possesion of mine and bring it to him as proof of my death. Do you understand?')
	talk_state = 21
	
	elseif talk_state == 20 and msgcontains(msg,'yes') then
	selfSay('You are no threat to me, so I suggest you answer the questions as I want it to be answered.')
	talk_state = 0
	
	elseif talk_state == 21 and msgcontains(msg,'yes') then
	selfSay('Fine, then take this pillow. Agilit knows it\'s a very dear possession of mine and that I would let noone take it unharmed.')
	doPlayerAddItem(cid,6105,1)
	setPlayerStorageValue(cid,9629,1)
	talk_state = 0
	
	elseif talk_state == 21 and msgcontains(msg,'no') then
	selfSay('You better, because you\'ll get in trouble if you don\'t fulfill the missions you have been allotted.')
	talk_state = 0
  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
