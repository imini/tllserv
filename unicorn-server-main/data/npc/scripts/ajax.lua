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
	story = 0
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
	
	local value0 = getPlayerStorageValue(cid,9804)
	local value1 = getPlayerStorageValue(cid,9805)
	local value2 = getPlayerStorageValue(cid,9806)
	local value3 = getPlayerStorageValue(cid,9807)
	local value4 = getPlayerStorageValue(cid,9808)
	local value5 = getPlayerStorageValue(cid,9814)
	local value6 = getPlayerStorageValue(cid,9815)
	local value7 = getPlayerStorageValue(cid,9816)
	local value8 = getPlayerStorageValue(cid,9817)
	local value9 = getPlayerStorageValue(cid,9818)
	local value10 = getPlayerStorageValue(cid,9819)
	local value11 = getPlayerStorageValue(cid,9820)
	msg = string.lower(msg)
	if value1 == 1 and msgcontains(msg,'mine') or
  value1 == 1 and msgcontains(msg,'MINE') then
  selfSay('YOURS? WHAT IS YOURS! NOTHING IS YOURS! IS MINE! GO AWAY, YES?!')
  talk_state = 1
  
  elseif talk_state == 1 and msgcontains(msg,'no') then
  selfSay('YOU STUPID! STUBBORN! I KILL YOU! WILL LEAVE NOW?!')
  talk_state = 2
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
  selfSay('GOOD!')
  talk_state = 0
  
  elseif talk_state == 2 and msgcontains(msg,'no') then
  selfSay('ARRRRRRRRRR! YOU ME DRIVE MAD! HOW I MAKE YOU GO??')
  talk_state = 3
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
  selfSay('GOOD!')
  talk_state = 0
  
  elseif talk_state == 3 and msgcontains(msg,'please') then
  selfSay('Please? What you mean please? Like I say please you say bye? Please?')
  talk_state = 4
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
  selfSay('LEAVE!')
  talk_state = 0
  
  elseif talk_state == 4 and msgcontains(msg,'yes') then
  selfSay('Oh. Easy. Okay. Please is good. Now don\'t say anything. Head aches. ...')
  story = 1
  talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'You know, you right. Brother is right. Fist not always good. Tell him that!'
  setPlayerStorageValue(cid,9806,1)
  setPlayerStorageValue(cid,9805,-1)
  talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
  selfSay('THEN WHAT!? LEAVE!')
  talk_state = 0
  
  elseif value2 == 1 and msgcontains(msg,'addon') or
  value2 == 1 and msgcontains(msg,'outfit') then
  selfSay('Go brother and tell fist is no good.')
  talk_state = 0
  
  elseif value3 == 1 and msgcontains(msg,'gelagos') then
  selfSay('Annoying kid. Bro hates him, but talking no help. Bro needs fighting spirit!')
  talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'fighting spirit') then
  selfSay('If you want to help bro, bring him fighting spirit. Magic fighting spirit. Ask Djinn.')
  setPlayerStorageValue(cid,9807,1)
  setPlayerStorageValue(cid,9806,-1)
  talk_state = 0
	
	elseif value2 == 1 and msgcontains(msg,'fighting spirit') or
  value2 == 1 and msgcontains(msg,'gelagos') then
  selfSay('If you want to help bro, bring him fighting spirit. Magic fighting spirit. Ask Djinn.')
  talk_state = 0
  
  elseif value5 == 1 and msgcontains(msg,'outfit') or
  value5 == 1 and msgcontains(msg,'present') or
  value5 == 1 and msgcontains(msg,'addon') then
  selfSay('Bron gave me present. Ugly, but nice from him. Me want to give present too. You help me?')
  talk_state = 6
  
  elseif talk_state == 6 and msgcontains(msg,'no') then
  selfSay('Oh. Ok.')
  talk_state = 0
  
  elseif talk_state == 6 and msgcontains(msg,'yes') then
  selfSay('Good! Me make shiny weapon. If you help me, I make one for you too. Like axe I wear. I need stuff. Listen. ...')
  story = 2
  talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[2] = 'Me need 100 iron ore. Then need crude iron. Then after that 50 behemoth fangs. And 50 white piece of cloth. You understand?'
  talk_state = 7
  
  elseif talk_state == 7 and msgcontains(msg,'no') then
  selfSay('Stupid you?')
  talk_state = 0
  
  elseif talk_state == 7 and msgcontains(msg,'yes') then
  selfSay('Help me yes or no?')
  talk_state = 8
  
  elseif talk_state == 8 and msgcontains(msg,'no') then
  selfSay('Ok.')
  talk_state = 0
  
  elseif talk_state == 8 and msgcontains(msg,'yes') then
  selfSay('Good. You get 100 iron ore first. Come back.')
  setPlayerStorageValue(cid,9814,-1)
  setPlayerStorageValue(cid,9816,1)
	talk_state = 0
	
	elseif value7 == 1 and msgcontains(msg,'outfit') or
  value7 == 1 and msgcontains(msg,'ore') or
  value7 == 1 and msgcontains(msg,'addon') then
  selfSay('You bring 100 iron ore?')
  talk_state = 9
  
  elseif talk_state == 9 and msgcontains(msg,'no') then
  selfSay('Ok.')
  talk_state = 0
  
  elseif talk_state == 9 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5880) >= 100 then
  doPlayerRemoveItem(cid,5880,100)
  setPlayerStorageValue(cid,9816,-1)
  setPlayerStorageValue(cid,9817,1)
  selfSay('Good! Now bring crude iron.')
  talk_state = 0
  else
  selfSay('No, you no have.')
  talk_state = 0
  end
  
  elseif value8 == 1 and msgcontains(msg,'outfit') or
  value8 == 1 and msgcontains(msg,'crude iron') or
  value8 == 1 and msgcontains(msg,'addon') then
  selfSay('You bring crude iron now?')
  talk_state = 10
  
  elseif talk_state == 10 and msgcontains(msg,'no') then
  selfSay('Ok.')
  talk_state = 0
  
  elseif talk_state == 10 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5892) >= 1 then
  doPlayerRemoveItem(cid,5892,1)
  setPlayerStorageValue(cid,9817,-1)
  setPlayerStorageValue(cid,9818,1)
  selfSay('Good! Now bring 50 behemoth fangs.')
  talk_state = 0
  else
  selfSay('No, you no have.')
  talk_state = 0
  end
  
  elseif value9 == 1 and msgcontains(msg,'outfit') or
  value9 == 1 and msgcontains(msg,'behemoth fang') or
  value9 == 1 and msgcontains(msg,'addon') then
  selfSay('You have behemoth fang? 50?')
  talk_state = 11
  
  elseif talk_state == 11 and msgcontains(msg,'no') then
  selfSay('Ok.')
  talk_state = 0
  
  elseif talk_state == 11 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5893) >= 50 then
  doPlayerRemoveItem(cid,5893,50)
  setPlayerStorageValue(cid,9818,-1)
  setPlayerStorageValue(cid,9819,1)
  selfSay('Good. Now bring 50 white piece cloth.')
  talk_state = 0
  else
  selfSay('No, you no have.')
  talk_state = 0
  end
  
  elseif value10 == 1 and msgcontains(msg,'outfit') or
  value10 == 1 and msgcontains(msg,'cloth') or
  value10 == 1 and msgcontains(msg,'addon') then
  selfSay('You bring 50 white piece cloth?')
  talk_state = 13
  
  elseif talk_state == 13 and msgcontains(msg,'no') then
  selfSay('Ok.')
  talk_state = 0
  
  elseif talk_state == 13 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,5909) >= 50 then
  doPlayerRemoveItem(cid,5909,50)
  setPlayerStorageValue(cid,9819,-1)
  setPlayerStorageValue(cid,9820,1)
  doPlayerAddOutfit(cid,143,1)
	doPlayerAddOutfit(cid,147,1)
	doSendMagicEffect(getThingPos(cid),13)
  selfSay('Ah! All stuff there. I will start making axes now. Take my old. I make new for me. And Bron.')
  talk_state = 0
  else
  selfSay('No, you no have.')
  talk_state = 0
  end
  
  elseif value11 == 1 and msgcontains(msg,'outfit') or
  value11 == 1 and msgcontains(msg,'axe') or
  value11 == 1 and msgcontains(msg,'addon') then
  selfSay('Axe Bron done. Axe you done. Axe me done. Thank much.')
  talk_state = 0
	end
	return true
	end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())