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
	story = 3
	elseif story == 3 then
    
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
	
	value0 = getPlayerStorageValue(cid,9873)
	value1 = getPlayerStorageValue(cid,9871)
	value2 = getPlayerStorageValue(cid,9872)
	value3 = getPlayerStorageValue(cid,1333)
	value4 = getPlayerStorageValue(cid,1334)
	msg = string.lower(msg)
	voc = getPlayerVocation(cid)
	if msg == 'heal' then
		healed = false
		if (getCreatureHealth(cid) < 65) then
			doCreatureAddHealth(cid,65  - getCreatureHealth(cid))
			doSendMagicEffect(getThingPos(cid),12)
			selfSay('You are looking bad. I will help you!')
			talkState = 0
			healed = true
		end
		if (getCreatureCondition(cid,1) == 1 or getCreatureCondition(cid,2) == 1 or getCreatureCondition(cid,4) == 1) then
			doCreatureRemoveCondition(cid,1)
			doCreatureRemoveCondition(cid,2)	
			doCreatureRemoveCondition(cid,4)
			doSendMagicEffect(getThingPos(cid),12)
			selfSay('You are looking bad. I will help you!')
			talkState = 0
			healed = true
		end
		if (healed == false) then
			selfSay('You aren\'t looking really bad.')
		end
	elseif msgcontains(msg,'wooden stake') and value0 == -1 then
	selfSay('A blessed stake to defeat evil spirits? I do know an old prayer which is said to grant sacred power and to be able to bind this power to someone, or something. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'However, this prayer needs the combined energy of four priests. Each of them has to say one line of the prayer. ...'
  storyMessage[2] = 'I could start with the prayer, but since the next priest has to be in a different location, you probably will have to travel a lot. ...'
  storyMessage[3] = 'Is this stake really important enough to you so that you are willing to take this burden?'
  talk_state = 1
  
  elseif talk_state == 1 and msgcontains(msg,'no') then
  selfSay('Then I suggest you to leave it.')
  talk_state = 0
  
  elseif talk_state == 1 and msgcontains(msg,'yes') then
  selfSay('Alright, I guess you need a stake first. Maybe Alfred can help you, the leg of a chair or something could just do. Try asking him for a stake, and if you have one, bring it back to me.')
  setPlayerStorageValue(cid,9871,1)
  setPlayerStorageValue(cid,9872,1)
  setPlayerStorageValue(cid,9873,1)
  talk_state = 0
  
  elseif msgcontains(msg,'wand') and value3 == -1 and voc == 1 then
  selfSay('Do you want a wand of vortex?')
  talk_state = 10
  
  elseif talk_state == 10 and msgcontains(msg,'no') then
  selfSay('Very well.')
  talk_state = 0
  
  elseif talk_state == 10 and msgcontains(msg,'yes') then
  selfSay('Here you go. Use it wisely.')
  setPlayerStorageValue(cid,1333,1)
  doPlayerAddItem(cid,2190,1)
  talk_state = 0
  
  elseif msgcontains(msg,'wand') and value3 == 1 then
  selfSay('I have already given you a wand, ' .. getPlayerName(cid) ..'.')
  talk_state = 0
  
  elseif msgcontains(msg,'wand') and voc ~= 1 then
  selfSay('I do only give wands to sorcerers, I\'m afraid.')
  talk_state = 0
  
  elseif msgcontains(msg,'rod') and value4 == -1 and voc == 2 then
  selfSay('Do you want a snakebite rod')
  talk_state = 11
  
  elseif talk_state == 11 and msgcontains(msg,'no') then
  selfSay('Very well.')
  talk_state = 0
  
  elseif talk_state == 11 and msgcontains(msg,'yes') then
  selfSay('Here you go. Use it wisely.')
  setPlayerStorageValue(cid,1334,1)
  doPlayerAddItem(cid,2182,1)
  talk_state = 0
  
  elseif msgcontains(msg,'rod') and value4 == 1 then
  selfSay('I have already given you a rod, ' .. getPlayerName(cid) ..'.')
  talk_state = 0
  
  elseif msgcontains(msg,'rod') and voc ~= 2 then
  selfSay('I do only give wands to druids, I\'m afraid.')
  talk_state = 0
  
  elseif msgcontains(msg,'wooden stake') and value1 == 1 then
  if getPlayerItemCount(cid,5941) >= 1 then
  selfSay('Ah, I see you brought a stake with you. Are you ready to receive my line of the prayer then?')
  talk_state = 2
  else
  selfSay('Please, bring your stake first.')
  talk_state = 0
  end
  
  elseif talk_state == 2 and msgcontains(msg,'no') then
  selfSay('Perhaps later, then.')
  talk_state = 0
  
  elseif talk_state == 2 and msgcontains(msg,'yes') then
  selfSay('So receive my prayer: \'Light shall be near - and darkness afar\'. Now, bring your stake to Sigiric in the Celerian temple for the next line of the prayer. I will inform her what to do.')
  setPlayerStorageValue(cid,9871,-1)
  setPlayerStorageValue(cid,9873,1)
  talk_state = 0
    
  elseif value2 == 1 and msgcontains(msg,'wooden stake') then
  selfSay('You must travel to Sigiric in Celeres to continue the prayer.')
  
  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())