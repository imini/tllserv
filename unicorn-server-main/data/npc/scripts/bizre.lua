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
	if (os.clock() - talk_story) > 10 and story > 0 then
    
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

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	

	value0 = getPlayerStorageValue(cid,9758)
  value1 = getPlayerStorageValue(cid,9759)
  value2 = getPlayerStorageValue(cid,9760)
  value3 = getPlayerStorageValue(cid,9761)
  value4 = getPlayerStorageValue(cid,9762)
  value5 = getPlayerStorageValue(cid,9763)
  msg = string.lower(msg)
  if value0 == -1 and msgcontains(msg,'mission') or
  value0 == -1 and msgcontains(msg,'quest') then
  selfSay('Hm, I do need help, I actually do... can I trust you?')
  talk_state = 1
  
  elseif talk_state == 1 and msgcontains(msg,'no') then
  selfSay('Then you can\'t help me.')
  talk_state = 0
  
  elseif talk_state == 1 and msgcontains(msg,'yes') then
  selfSay('Are you sure?')
  talk_state = 2
  
  elseif talk_state == 2 and msgcontains(msg,'no') then
  selfSay('Then you can\'t help me.')
  talk_state = 0
  
  elseif talk_state == 2 and msgcontains(msg,'yes') then
  selfSay('You\'re not a spy or anything like that then?')
  talk_state = 3
  
  elseif talk_state == 3 and msgcontains(msg,'yes') then
  selfSay('Then you can\'t help me.')
  talk_state = 0
  
  elseif talk_state == 3 and msgcontains(msg,'no') then
  selfSay('Good. Because what I\'m going to tell you is highly confidental. You must promise me not to tell anyone else. Do you promise?')
  talk_state = 4
  
  elseif talk_state == 4 and msgcontains(msg,'no') then
  selfSay('Then you can\'t help me.')
  talk_state = 0
  
  elseif talk_state == 4 and msgcontains(msg,'yes') then
  selfSay('Fine. I recently sold a crossbow to a minotaur by the name of Mirol. He promised me to give me the payment later, but some complications has occurred. ...')
  story = 1
  talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'It\'s obvious we, human and minotaur, can\'t meet and trade items. And I don\'t know where he is, either, so I cannot seek him. ...'
  storyMessage[2] = 'However, I am pretty sure you are an adventurous kid, willing to take on such an assignment. Am I right?'
  talk_state = 5
  
  elseif talk_state == 5 and msgcontains(msg,'no') then
  selfSay('No? Okay.')
  talk_state = 0
  
  elseif talk_state == 5 and msgcontains(msg,'yes') then
  selfSay('Good. Then I want you to travel to the minotaur underground settlement in the north-west and seek the minotaur mage Malakaz. He should know where Mirol is. Now go.')
  setPlayerStorageValue(cid,9758,1)
  setPlayerStorageValue(cid,9759,1)
  talk_state = 0
  
  elseif value1 == 1 and msgcontains(msg,'mission') or
  value1 == 1 and msgcontains(msg,'quest') then
  selfSay('You must seek Malakaz and ask him where Mirol is. Then go to Mirol and collect his payment. Afterwards, return here.')
  talk_state = 0
  
  elseif value4 == 1 and msgcontains(msg,'mission') 
  or value4 == 1 and msgcontains(msg,'payment') or
  value4 == 1 and msgcontains(msg,'quest') then
  selfSay('Have you collected Mirol\'s payment?')
  talk_state = 6
  
  elseif talk_state == 6 and msgcontains(msg,'no') then
  selfSay('Return when you have done so.')
  talk_state = 0
  
  elseif talk_state == 6 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5951) >= 1 then
  doPlayerRemoveItem(cid,5951,1)
  doPlayerAddItem(cid,5948,11)
  setPlayerStorageValue(cid,9763,1)
  setPlayerStorageValue(cid,9762,-1)
  selfSay('Thank you. This fish tail will... eh, here, take these dragon leathers. They will probably serve you well one day.')
  talk_state = 0
  else
  selfSay('Well, at least you don\'t have the agreed payment.')
  talk_state = 0
  end
  
  elseif value5 == 1 and msgcontains(msg,'mission') 
  or value5 == 1 and msgcontains(msg,'payment') or
  value5 == 1 and msgcontains(msg,'quest') then
  selfSay('You have already collected the payment and recieved a reward for doing so.')
  talk_state = 0
  
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())