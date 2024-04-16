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
	if (os.clock() - talk_story) > 9 and story > 0 then
    
        if story == 1 then
    
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
	
	testvalue = getPlayerStorageValue(cid,9764)
	msg = string.lower(msg)
	if msgcontains(msg,'key') and testvalue == -1 then
	selfSay('I will give the key to the crypt only to the closest followers of my master. Would you like me to test you?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Then there will be no key for you.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Before we start, I must say, I need a little donation from you side. Are you willing to pay me 1000 gold coins to continue with the test?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Then there will be no key for you.')
	talk_state = 0

  elseif talk_state == 2 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,2148) >= 1000 or getPlayerItemCount(cid,2152) >= 10 or getPlayerItemCount(cid,2160) >= 1 then
  doPlayerRemoveMoney(cid,1000)
	selfSay('Fine. Here is your first question: what was the name of the creature that killed Remero?')
	talk_state = 3
	else
	selfSay('You don\'t have enough money to do the test.')
	talk_state = 0
	end
 
  elseif talk_state == 3 then
  if msgcontains(msg,'none') or msgcontains(msg,'nameless') then
  selfSay('That was sheer luck, I\'m afraid. Next question: what was the name of Remero\'s favourite spider?')
  talk_state = 4
  else
  selfSay('Completely wrong, fool.')
  talk_state = 0
  end
  
  elseif talk_state == 4 then
  if msgcontains(msg,'lufwa') then
  selfSay('Perhaps you knew my master better than I thought. Tell me, what was the colour of the daemons which my master summoned?')
  talk_state = 5
  else
  selfSay('Completely wrong, fool.')
  talk_state = 0
  end
   
  elseif talk_state == 5 then
  if msgcontains(msg,'grey') then
  selfSay('Also true. It seems you are worthy after all. Do you want the key to the crypt?')
  talk_state = 6
  else
  selfSay('Completely wrong, fool.')
  talk_state = 0
  end 
  
  elseif talk_state == 6 and msgcontains(msg,'yes') then
	selfSay('Here you are.')
	setPlayerStorageValue(cid,9764,1)
	key = doPlayerAddItem(cid,2087,1)
	doSetItemActionId(key,9183)
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Hehe. Alright then. You did the test for fun only, I pressume.')
	talk_state = 0
	
	elseif msgcontains(msg,'key') and testvalue == 1 then
	selfSay('You have already completed the test. But perhaps, you have lost the key... you can redo the test again then, but this time it will cost you 1500 gold coins. Okay?')
	talk_state = 7
 
  elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Then there will be no key for you.')
	talk_state = 0

  elseif talk_state == 7 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,2148) >= 1500 or getPlayerItemCount(cid,2152) >= 15 or getPlayerItemCount(cid,2160) >= 1 then
  doPlayerRemoveMoney(cid,1500)
	selfSay('Fine. Here is your first question: what was the name of the creature that killed Remero?')
	talk_state = 3
	else
	selfSay('You don\'t have enough money to do the test.')
	talk_state = 0
	end
 
 
 
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())