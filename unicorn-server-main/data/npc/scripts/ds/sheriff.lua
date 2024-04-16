local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()
    end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	value1 = getPlayerStorageValue(cid,8901)
	value2 = getPlayerStorageValue(cid,8900)
	
	value0 = getPlayerStorageValue(cid,9996)
  value3 = getPlayerStorageValue(cid,9997)
  value4 = getPlayerStorageValue(cid,9998)
  value5 = getPlayerStorageValue(cid,9999)
  value6 = getPlayerStorageValue(cid,9800)
  msg = string.lower(msg)
  value7 = getPlayerStorageValue(cid,3041)
  value8 = getPlayerStorageValue(cid,3042) 
  value9 = getPlayerStorageValue(cid,3043)
  value10 = getPlayerStorageValue(cid,9801)
  value11 = getPlayerStorageValue(cid,2045)
  value12 = getPlayerStorageValue(cid,7312)
  value13 = getPlayerStorageValue(cid,7313)
   malesheriff = getPlayerStorageValue(cid,7601)
  femalesheriff =  getPlayerStorageValue(cid,7602)
  malesheriffdone = getPlayerStorageValue(cid,7603)
  femalesheriffdone =  getPlayerStorageValue(cid,7604)
  
  if msgcontains(msg, 'mission') and value7 == -1 then
  selfSay('Would you like to help me in a murder investigation?')
  talk_state = 6
  
  elseif msgcontains(msg, 'no') and talk_state == 6 then
	selfSay('Ah. Okey.')
	talk_state = 0 
	
	elseif msgcontains(msg, 'mission') and value7 == 1 then
	selfSay('I have told you to track down Burt Baldingsen and Johnny Knoxville and eliminate them. Thereafter, bring their mandrake and stone herb to me as a proof.')
	talk_state = 0 
  
  elseif msgcontains(msg, 'yes') and talk_state == 6 then
	selfSay('Alright then. There are two infamous bandit leaders known as Burt Baldingsen and Johnny Knoxville. They have commited several murders and now I want them. Are you still convinced you would like to catch them?')
	talk_state = 7 
	
	elseif msgcontains(msg, 'no') and talk_state == 7 then
	selfSay('Ah. Okey.')
	talk_state = 0 
  
  elseif msgcontains(msg, 'yes') and talk_state == 7 then
	selfSay('Good. I know as a matter of fact that they live somewhere in the mountain to the south. I just can\'t seem to find their hidden entrance. However, if you find them, kill them directly and bring me their stone herb and mandrake as proof.')
	setPlayerStorageValue(cid,3041,1)
	talk_state = 0 

elseif msgcontains(msg,'office') and getPlayerStorageValue(cid,3912) == 1 or 
	msgcontains(msg,'desk') and getPlayerStorageValue(cid,3912) == 1 or
	msgcontains(msg,'twin') and getPlayerStorageValue(cid,3912) == 1 or
	msgcontains(msg,'table') and getPlayerStorageValue(cid,3912) == 1 then
	selfSay('We have discussed this already.')
	
	elseif msgcontains(msg,'office') or 
	msgcontains(msg,'desk') or
	msgcontains(msg,'twin') or
	msgcontains(msg,'table') then
	selfSay('Only those who actually are meant to enter my office to see the twin should know about this, so I suppose the king has sent you. Go on.')
	setPlayerStorageValue(cid,3912,1)
  
  elseif msgcontains(msg, 'mandrake') and value1 == -1 then
  selfSay('A mandrake is the proof you have caught Johnny Knoxville, do you have it?!')
  talk_state = 1

  elseif msgcontains(msg, 'no') and talk_state == 1 then
	selfSay('Ah. Okey.')
	talk_state = 0
	
	elseif msgcontains(msg, 'yes') and talk_state == 1 then
	if getPlayerItemCount(cid,5015)  >= 1 then
	selfSay('Thank you! Here, take this gold as a reward. Now, perhaps, seeing as you are quite smart, perhaps you would like to help me in further investigations.')
	talk_state = 0
	doPlayerTakeItem(cid,5015,1)
	setPlayerStorageValue(cid,8901,1)
	doPlayerAddItem(cid,2152,30)	
  talk_state = 0
	else
	selfSay('Hey liar! You don\'t have one!')
	talk_state = 0
	end
	
	elseif msgcontains(msg, 'stone herb') and value1 == -1 then
  selfSay('A stone herb is the proof you have caught Burt Baldingsen, do you have it?!')
  talk_state = 5

  elseif msgcontains(msg, 'no') and talk_state == 5 then
	selfSay('Ah. Okey.')
	talk_state = 0
	
	elseif msgcontains(msg, 'yes') and talk_state == 5 then
	if getPlayerItemCount(cid,2799) >= 1 then
	selfSay('Thank you! Here, take this gold as a reward. Now, perhaps, seeing as you are quite smart, perhaps you would like to help me in further investigations.')
	talk_state = 0
	doPlayerTakeItem(cid,2799,1)
	setPlayerStorageValue(cid,8900,1)
	doPlayerAddItem(cid,2152,40)
  talk_state = 0
	else
	selfSay('Hey liar! You don\'t have it!')
	talk_state = 0
	end
	
	elseif msgcontains(msg, 'stone herb') and value2 == 1 or
  msgcontains(msg, 'mandrake') and value1 == 1 then
	selfSay('Thank you for it again.')
	talk_state = 0	
		
	elseif value7 == 1 and value8 == -1 and msgcontains(msg,'investigation') then
	selfSay('You have brought me proof that you have killed at least one of them. But I need more than this. I need to find out where the Barrel of Regret is located.')
	talk_state = 8
	
	elseif value7 == 1 and value8 == 1 and msgcontains(msg,'mission') then
	selfSay('You have completed the missions already. Now, we\'re in the middle of some investigations.')
	talk_state = 0
	
	elseif msgcontains(msg, 'barrel of regret') and talk_state == 8 and value10 == -1 and value11 == -1 then
	selfSay('Well, I don\'t yet know what it is, but I\'m pretty damn sure it\'s illegal. Go to their hideout again and seek the barrel. After having investigated it, come back to me and report.')
	setPlayerStorageValue(cid,3042,1)
	talk_state = 0			
  
  elseif msgcontains(msg, 'barrel of regret') and value2 == 1 and value3 == -1 and value9 == -1 and value10 == -1 and value11 == -1 then
	selfSay('Go to the mountains in the south and find the Barrel of Regret, investigate it and then return to me and report.')
	talk_state = 0		
  
  elseif msgcontains(msg, 'barrel of regret') and value9 == 1 and value10 == 1 and value11 == -1 then
	selfSay('Oh, so it was only a fake, then? I wonder where the real one might be. Well, perhaps in Goldtol, the outlaw encampment? Well, I have an idea. Are you interested in hearing it?')
	talk_state = 9	
	
	elseif talk_state == 9 and msgcontains(msg,'no') then
	selfSay('Very well.')
	talk_state = 0
  
  elseif talk_state == 9 and msgcontains(msg,'yes') then
	selfSay('Well, I suggest you to go there and look for the real Barrel of Regret. If you find it, report to me.')
	setPlayerStorageValue(cid,9801,1)
	talk_state = 0
	
	elseif msgcontains(msg, 'barrel of regret') and value10 == 1 and value11 == -1 then
	selfSay('Go to Goldtol and seek the Barrel, then return to me and report.')
	talk_state = 0	
	
	elseif msgcontains(msg, 'barrel of regret') and value11 == 1 then
	selfSay('Great. Now I know where it is, and if any illegal business is involved with it I know where to attack. Thanks for helping me!')
	talk_state = 0		
  
  elseif value3 == -1 and value4 == -1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 1 or
	value3 == -1 and value4 == -1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 1 then
	selfSay('Okay, kid. I can give you a chance, just because I like you, to recieve my old sword. You may wear it proudly and visible to everyone.')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'sword') then
	selfSay('Great! Simply bring me 100 iron ore and one royal steel and I will happily give you my old sword so I can make me a new one.')
	setPlayerStorageValue(cid,9997,1)
		talk_state = 0
		
  elseif value3 == 1 and msgcontains(msg,'ore') and getPlayerSex(cid) == 1 and value4 == -1 or
  value3 == 1 and msgcontains(msg,'steel') and getPlayerSex(cid) == 1 and value4 == -1 or
  value3 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 1 and value4 == -1 or
  value3 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 1 and value4 == -1 then
  selfSay('Have you brought me the 100 iron ore and the piece of royal steel which I requested?')
  talk_state = 2
  		
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Okay.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5880) >= 1 and getPlayerItemCount(cid,5887) >= 1 then
	selfSay('Fine then, here you go. Take this sword and wear it proudly. Myself, I will go forge me a new one.')
	setPlayerStorageValue(cid,9998,1)
	doPlayerRemoveItem(cid,5887,1)
	doPlayerRemoveItem(cid,5880,100)
	doSendMagicEffect(getThingPos(cid),13)
	doPlayerAddOutfit(cid,131,1)
	talk_state = 0
	else
	selfSay('No, that\'s not true.')
	talk_state = 0
	end
	
	elseif value4 == 1 and msgcontains(msg,'ore') and getPlayerSex(cid) == 1 or
  value4 == 1 and msgcontains(msg,'steel') and getPlayerSex(cid) == 1 or
  value4 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 1 or
  value4 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 1 then
  selfSay('You have already completed my missions.')
  talk_state = 0
	
	 elseif value5 == -1 and value4 == -1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 0 or
	value5 == -1 and value4 == -1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 0 then
	selfSay('Okay, my young lady. Since I like you, I can give you an old helmet of mine which I\'m sure you will appreciate. Not for free though, I should mention.')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'helmet') then
	selfSay('Alright. Simply bring me 100 iron ore and one royal steel and I will happily give you my old helmet so I can make me a new one.')
	setPlayerStorageValue(cid,9999,1)
		talk_state = 0
		
  elseif value5 == 1 and msgcontains(msg,'ore') and getPlayerSex(cid) == 0 and value6 == -1 or
  value5 == 1 and msgcontains(msg,'steel') and getPlayerSex(cid) == 0 and value6 == -1 or
  value5 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 0 and value6 == -1 or
  value5 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 0 and value6 == -1 then
  selfSay('Have you brought me the 100 iron ore and the piece of royal steel which I requested?')
  talk_state = 4
  		
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Okay.')
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5880) >= 1 and getPlayerItemCount(cid,5887) >= 1 then
	selfSay('Fine then, here you go. Take this helmet. Myself, I will make another with the wares you brought.')
	setPlayerStorageValue(cid,9800,1)
	doPlayerRemoveItem(cid,5887,1)
	doPlayerRemoveItem(cid,5880,100)
	doSendMagicEffect(getThingPos(cid),13)
	doPlayerAddOutfit(cid,139,2)
	talk_state = 0
	else
	selfSay('No, that\'s not true.')
	talk_state = 0
	end
	
	elseif value6 == 1 and msgcontains(msg,'ore') and getPlayerSex(cid) == 0 or
  value6 == 1 and msgcontains(msg,'steel') and getPlayerSex(cid) == 0 or
  value6 == 1 and msgcontains(msg,'addon') and getPlayerSex(cid) == 0 or
  value6 == 1 and msgcontains(msg,'outfit') and getPlayerSex(cid) == 0 then
  selfSay('You have already completed my missions.')
  talk_state = 0
	
	elseif msgcontains(msg, 'cloak') and getPlayerSex(cid) == 1 then	
		if malesheriff == 1 then
			selfSay('Bah! This is ridiculus. I am the sheriff of Celeres and I don’t even know where the Celerian Academy has their building. Anyways, Norton is a good mage so I suppose you want your cloak now?')
			talk_state = 14
			else
			selfSay('This does not make any sense to me, I\'m afraid.')
		end
		elseif talk_state == 14 then
			if msgcontains(msg, 'yes') then
			selfSay('Very well, ' .. getPlayerName(cid) .. '. Here you go. Have fun with it.')
doPlayerAddOutfit(cid, 138, 2)
    doPlayerAddOutfit(cid, 133, 2)
                	setPlayerStorageValue(cid,7601,-1)
                	setPlayerStorageValue(cid,7603,1)
                	talk_state = 0
                	else
                	selfSay('Sure, I don\'t care. Not at all. Bah.')
                	talk_state = 0
		end
	
		
		
		elseif msgcontains(msg, 'tiara') and getPlayerSex(cid) == 0 then	
		if femalesheriff == 1 then
			selfSay('Bah! This is ridiculus. I am the sheriff of Celeres and I don’t even know where the Celerian Academy has their building. Anyways, Norton is a good mage so I suppose you want your tiara now?')
			talk_state = 15
			else
			selfSay('This does not make any sense to me, I\'m afraid.')
		end
		elseif talk_state == 15 then
			if msgcontains(msg, 'yes') then
			selfSay('Very well, ' .. getPlayerName(cid) .. '. Here you go. Have fun with it.')
doPlayerAddOutfit(cid, 138, 2)
    doPlayerAddOutfit(cid, 133, 2)
                	setPlayerStorageValue(cid,7602,-1)
                	setPlayerStorageValue(cid,7604,1)
                	talk_state = 0
                	else
                	selfSay('Sure, I don\'t care. Not at all. Bah.')
                	talk_state = 0
		end

    elseif femalesheriffdone == 1 and msgcontains(msg,'tiara') and getPlayerSex(cid) == 0 then
  selfSay('I have already given you the tiara. Time to refresh your memory, perhaps?')
  talk_state = 0
  
  elseif malesheriffdone == 1 and msgcontains(msg,'cloak') and getPlayerSex(cid) == 1 then
  selfSay('I have already given you the cloak. Time to refresh your memory, perhaps?')
  talk_state = 0
  
  value20 = getPlayerStorageValue(cid,4328)
  value21 = getPlayerStorageValue(cid,4329)
  
  elseif value20 == 1 and msgcontains(msg,'dark time') then
selfSay('Please don’t remind me of that gruesome epoch. I remember how it all began with that strange Hugo.')
talk_state = 21

elseif talk_state == 21 and msgcontains(msg,'hugo') then
selfSay('Yep. Hugo, the demonbunny, came from a pact of ancient and dark magic. They had their hideout in a place called Crunor’s Cottage.')
talk_state = 22

elseif talk_state == 22 and msgcontains(msg,'cottage') then
selfSay('The place was originally built by the ancient follower of Mooh’Tah, Fah’Kull. I can’t really recall where it was, but I think it was a solitary cottage in the north of the Vast Lands. Go there and look for it, I cannot help you more than this.')
setPlayerStorageValue(cid,4329,1)
setPlayerStorageValue(cid,4322,-1)
talk_state = 23

elseif value21 == 1 and msgcontains(msg,'dark time') then
selfSay('I told you to look for Crunor\'s Cottage in the north of the Vast Lands. I don\'t know more about this subject than what I have told you already.')
talk_state = 0
  
		end
		return true
		end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
