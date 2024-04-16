
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


	local value3 = getPlayerStorageValue(cid,4356)
	local value4 = getPlayerStorageValue(cid,4357)	
	local value5 = getPlayerStorageValue(cid,9901)
  local value7 = getPlayerStorageValue(cid,4358)
  local value6 = getPlayerStorageValue(cid,9902)
  msg = string.lower(msg)
------------------------------------

	if msgcontains(msg, 'temple of galon') and value5 == -1 or msgcontains(msg, 'galon') and value5 == -1 then
			selfSay('It\'s one of the riddles which prevents too many visitors to enter the Pits of Inferno and was built by Mheawh. Not many men knows how to pass it... but I do. Unfortunately, I\'m not interested in neither entering nor sharing the knowledge.')
			talk_state = 2
			
			elseif talk_state == 4 and msgcontains(msg, 'no') then
			selfSay('Covered in cowardice.')
			talk_state = 0
			
			elseif value5 == 1 and msgcontains(msg, 'galon') and value4 == -1 and value3 == -1 and value6 == -1 and value7 == -1 and value5 == 1 then
			selfSay('Get me the troll green from the mountains north of Tha\'Reen to enter it.')
			talk_state = 0
			elseif msgcontains(msg, 'galon') and value3 == 1 and value4 == -1 and value6 == -1 and value7 == -1 and value5 == 1 then
			selfSay('Obtain Lucifer\'s ash to enter it.')
			talk_state = 0
			elseif msgcontains(msg, 'galon') and value3 == 1 and value4 == 1 and value6 == -1 and value7 == -1 and value5 == 1 then
			selfSay('Find me a moonstone from the giants\' hideout to enter it.')
			talk_state = 0
			elseif msgcontains(msg, 'galon') and value3 == 1 and value4 == 1 and value6 == 1 and value7 == -1 and value5 == 1 then
			selfSay('Find me a skull to enter it.')
			talk_state = 0
			elseif msgcontains(msg, 'galon') and value7 == 1 and value3 == 1 and value4 == 1 and value6 == 1 and value5 == 1 then
			selfSay('You may enter the temple of Galon now.')
			talk_state = 0
			
	elseif talk_state == 2 and msgcontains(msg, 'passage') or msgcontains(msg, 'pass it') or msgcontains(msg, 'pass') or msgcontains(msg, 'enter') then
			selfSay('Hahaha! Now, how can you even imagine I’m giving away a secret like that so cheap? A fee, dear ' .. getPlayerName(cid) .. ', a fee.')
			talk_state = 3
			
	elseif talk_state == 3 and msgcontains(msg, 'fee') then
			selfSay('You will have to bring me four different ingredients in a magical potion which... I need. Unfortunately, these ingredients is spread with the wind... but incase you want to proceed through the gate, you will have to collect them anyways. Are you still sure you want to proceed?')
			talk_state = 4

	elseif talk_state == 4 and msgcontains(msg, 'yes') then
			selfSay('Wonderful! HAHAHA! Now, let\'s take them all one by one to prevent any confusion. First of all... get me a troll green located in the mountains north of Tha’Reen.')
      setPlayerStorageValue(cid,9901,1)
      talk_state = 0
    
		

------------------------------------

	elseif msgcontains(msg, 'troll green') and value5 == 1 and value3 == -1 then
			selfSay('Have you obtained the troll green which I requested?')
			talk_state = 6
					
	elseif msgcontains(msg, 'troll green') and value5 == -1 and value3 == -1 then
			selfSay('What am I supposed to do with a troll green?')
			talk_state = 0
			
	elseif msgcontains(msg, 'troll green') and value3 == 1 then
			selfSay('You have already given me a troll green.')
			talk_state = 0

		elseif talk_state == 6 and msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,2805) >= 1 then
			selfSay('You’re closing up. Three left, and here\’s the second: I want some ash from Lucifer. Search through Agatone carefully to find it.')
			setPlayerStorageValue(cid,4356,1)
			doPlayerRemoveItem(cid,2805,1)
			talk_state = 0
			else
			selfSay('You don\'t have it.')
			talk_state = 0
		end
		elseif msgcontains(msg, 'no') and talk_state == 6 then
			selfSay('Okay.')
			talk_state = 0

-----------------------------------
	elseif msgcontains(msg, 'ash from lucifer') and value3 == 1 and value4 == -1 or msgcontains(msg, 'ash') and value3 == 1 and value4 == -1 then
			selfSay('Have you found Lucifer\'s ash for me?')
			talk_state = 7
			
			elseif msgcontains(msg, 'ash') and value5 == -1 and value4 == -1 then
			selfSay('What am I supposed to do with Lucifer\'s ash?')
			talk_state = 0
			
			elseif msgcontains(msg, 'no') and talk_state == 7 then
			selfSay('Okay.')
			talk_state = 0
			
	elseif msgcontains(msg, 'ash') and value4 == 1 then
			selfSay('You have already given me Lucifer\'s ash.')
			talk_state = 0

		elseif talk_state == 7 then
			if msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,6548) >= 1 then
			selfSay('Hehehe... just what I thought. You are an adventurous little kid. So, this time get me a moonstone from the depths of the Ravenclaw Swamp... in the hideout of the Giants.')
				setPlayerStorageValue(cid,4357,1)
				doPlayerRemoveItem(cid,6548,1)
			talk_state = 0
			else
			selfSay('You do not have Lucifer\'s ash.')
		end
		end
		

------------------------------------

	elseif msgcontains(msg, 'moonstone') and value4 == 1 and value6 == -1 then
			selfSay('Have you retrieved the moonstone which I requested?')
			talk_state = 8
			
	elseif msgcontains(msg, 'moonstone') and value6 == -1 and value5 == -1 then
			selfSay('What am I supposed to do with a moonstone?')
			talk_state = 0
			
	elseif msgcontains(msg, 'no') and talk_state == 9 then
			selfSay('NO!? Fool! You have no choice! BRING ME A SKULL')
			setPlayerStorageValue(cid,9902,1)
			talk_state = 0
			
	elseif msgcontains(msg, 'no') and talk_state == 8 then
			selfSay('Then come back when you have.')
			talk_state = 0

  elseif msgcontains(msg, 'moonstone') and value6 == 1 then
			selfSay('You have already given me a moonstone.')
			talk_state = 0
			
		elseif talk_state == 8 then
			if msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,6546) >= 1 then
		  doPlayerRemoveItem(cid,6546,1)
			selfSay('Oh... I really underestimated you... how interesting! Are you up for the last part of our little agreement?')	
			talk_state = 9
			else
			selfSay('I guess you will have to come back when you have the moonstone.')
	end
end
		elseif talk_state == 9 then
			if msgcontains(msg, 'yes') then
			selfSay('Alright then... bring me a skull.')
			setPlayerStorageValue(cid,9902,1)
			talk_state = 0

		end

--------------------------------------

	elseif msgcontains(msg, 'skull') and value6 == 1 and value7 == -1 then
			selfSay('Do you have the skull?')
			talk_state = 10
	
	elseif msgcontains(msg, 'skull') and value7 == -1 and value5 == -1 then
			selfSay('What am I supposed to do with a skull?')
			talk_state = 0
			
	elseif msgcontains(msg, 'no') and talk_state == 10 then
			selfSay('Okay.')
			talk_state = 0

  elseif msgcontains(msg, 'skull') and value7 == 1 then
			selfSay('You have already given me a skull.')
			talk_state = 0

    elseif talk_state == 10 then
    if msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,2229) >= 1 then
		  doPlayerRemoveItem(cid,2229,1)
			selfSay('Welcome to the Pits of Inferno, fool.')	
			setPlayerStorageValue(cid,4358,1)
			talk_state = 0
			else
			selfSay('Return to me when you have the skull.')
		end
		end	
		end
		return true
		end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
