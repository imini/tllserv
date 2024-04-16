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
function callbackOnThink(cid)
	if (os.clock() - talk_story) > 9 and story > 0 then
    
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
	
	local value1 = getPlayerStorageValue(cid,9897)
	local agornvalue = getPlayerStorageValue(cid,9718)
	local value20 = getPlayerStorageValue(cid,9712)
	local value0 = getPlayerStorageValue(cid,9773)
	local value2 = getPlayerStorageValue(cid,9774)
	local value3 = getPlayerStorageValue(cid,9775)
	local value7 = getPlayerStorageValue(cid,9770)
	msg = string.lower(msg)
	if value20 == 1 and agornvalue == -1 and msgcontains(msg,'measurements') then
	selfSay('Oh they dont change that much since in the old days as... <tells a boring and confusing story about a cake, a parcel, himself and two squirrels, at least he tells you his measurements in the end>')
	setPlayerStorageValue(cid,9718,1)
	talk_state = 0
	
	elseif agornvalue == 1 and msgcontains(msg,'measurements') then
	selfSay('I have told you my measurements already.')
	
	elseif value0 == -1 and value7 == 1 and msgcontains(msg,'outfit') or
	value0 == -1 and msgcontains(msg,'addon') then
	selfSay('I use this staff for my back. But to some, it seems to have a great value. I think I know why. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'It is said to have belonged to the warrior of Akteh. I wonder how it ended up in my hands, but I remember that I bought it from a strange man at the inn. ...'
  storyMessage[2] = 'And no, before you ask. You can’t have my staff.'
  talk_state = 1
  
  elseif talk_state == 1 and msgcontains(msg,'staff') then
  selfSay('I said, no! Or well – I have a suggestion to make. Will you listen?')
  talk_state = 2
  
  elseif talk_state == 2 and msgcontains(msg,'no') then
  selfSay('Okay then.')
  talk_state = 0
  
  elseif talk_state == 2 and msgcontains(msg,'yes') then
  selfSay('Only if you bring me another staff I can give you my old one. It will probably be very dangerous, because Akteh is said to be a follower of Zathroth and I daresay he will not let his warrior give it to you for free. Are you willing to proceed, despite this?')
  talk_state = 3
  
  elseif talk_state == 3 and msgcontains(msg,'no') then
  selfSay('A little coward is what you are. Hehehe.')
  talk_state = 0
  
  elseif talk_state == 3 and msgcontains(msg,'yes') then
  selfSay('Good! Come back to me once you have retrieved my staff. I suggest you to seek Akteh in the Fields of Wilderness, far north of Celeres. Good luck.')
  setPlayerStorageValue(cid,9773,1)
  setPlayerStorageValue(cid,9774,1)
  talk_state = 0
  
  elseif value2 == 1 and msgcontains(msg,'outfit') or
  value2 == 1 and msgcontains(msg,'staff') or
	value2 == 1 and msgcontains(msg,'addon') then
	selfSay('Did you bring me a new staff?')
	talk_state = 4
	
  elseif talk_state == 4 and msgcontains(msg,'no') then
  selfSay('I wait.')
  talk_state = 0
  
  elseif talk_state == 4 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,6107) >= 1 then
  doPlayerRemoveItem(cid,6107,1)
  setPlayerStorageValue(cid,9774,-1)
  setPlayerStorageValue(cid,9775,1)
  doPlayerAddOutfit(cid,157,1)
  doPlayerAddOutfit(cid,153,2)
  doSendMagicEffect(getThingPos(cid),13)
  selfSay('Yes!! That\'s it! Here, you can have my other one. Thanks!')
  talk_state = 0
  else
  selfSay('You don\'t have the staff.')
  talk_state = 0
  end
  
  elseif value3 == 1 and msgcontains(msg,'outfit') or
  value3 == 1 and msgcontains(msg,'staff') or
	value3 == 1 and msgcontains(msg,'addon') then
	selfSay('You have given me a staff and I have given you a staff.')
	talk_state = 0 

	 end
	 return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())