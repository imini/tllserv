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
	if (os.clock() - talk_story) > 11 and story > 0 then
    
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
	
	value0 = getPlayerStorageValue(cid,9859)
	value1 = getPlayerStorageValue(cid,9860)
	value2 = getPlayerStorageValue(cid,9861)
value3 = getPlayerStorageValue(cid,9862)
value4 = getPlayerStorageValue(cid,9863)
value5 = getPlayerStorageValue(cid,9864)
msg = string.lower(msg)

  if msgcontains(msg,'addon') and value0 == -1 or
	msgcontains(msg,'outfit') and value0 == -1 then
	selfSay('Only the bravest warriors may wear adorned helmets. They were traditionally awarded after having completed a difficult task. At least when I was in my guild.')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'task') then
	selfSay('You mean, you would like to prove that you deserve to wear such a helmet?')
	talk_state = 2
	
	elseif msgcontains(msg,'no') and talk_state == 2 then
	selfSay('I see.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 2 then
	selfSay('Well then, listen closely. First, you will have to prove that you are a fierce and restless warrior by bringing me 100 perfect behemoth fangs. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'Secondly, please retrieve a helmet for me which has been lost a long time ago. The famous Ramsay the Reckless wore it while seeking the giants in Ravenclaw Swamp. ...'
  storyMessage[2] = 'Third, I need a new flask of warrior\'s sweat. I\'ve run out of it recently, but I need a small amount to get past all the cyclops. ...'
  storyMessage[3] = 'Lastly, I will have a fellow smith refine your helmet if you bring me royal steel, an especially noble metal. ...'
  storyMessage[4] = 'Did you understand everything I told you and are willing to handle this task?'
	talk_state = 3

	elseif msgcontains(msg,'no') and talk_state == 3 then
	selfSay('That\'s too bad for you, then.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 3 then
	selfSay('Alright then. Come back to me once you have collected 100 perfect behemoth fangs.')
	setPlayerStorageValue(cid,9859,1)
	setPlayerStorageValue(cid,9860,1)
  talk_state = 0
	
	elseif msgcontains(msg,'behemoth fang') and value1 == 1 or
	msgcontains(msg,'addon') and value1 == 1 or
	msgcontains(msg,'outfit') and value1 == 1 then
	selfSay('Have you really managed to fulfil the task and brought me 100 perfect behemoth fangs?')
	talk_state = 4
	
	elseif msgcontains(msg,'no') and talk_state == 4 then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 4 then
	if getPlayerItemCount(cid,5893) >= 100 then
	doPlayerRemoveItem(cid,5893,100)
	setPlayerStorageValue(cid,9861,1)
	setPlayerStorageValue(cid,9860,-1)
	selfSay('I\'m deeply impressed. Now, please retrieve Ramsay\'s helmet.')
	talk_state = 0
	else
	selfSay('No, you don\'t have them.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'ramsey') and value2 == 1 or
	msgcontains(msg,'addon') and value2 == 1 or
	msgcontains(msg,'outfit') and value2 == 1 then
	selfSay('Did you recover the helmet of Ramsay the Reckless?')
	talk_state = 5
	
	elseif msgcontains(msg,'no') and talk_state == 5 then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 5 then
	if getPlayerItemCount(cid,5924) >= 1 then
	doPlayerRemoveItem(cid,5924,1)
	setPlayerStorageValue(cid,9862,1)
	setPlayerStorageValue(cid,9861,-1)
	selfSay('Good work! Even though it is damaged, it has a lot of sentimental value. Now, please bring me warrior\'s sweat so I can sneak past the cyclops. Human sweat neutalizeses their smelling system.')
	talk_state = 0
	else
	selfSay('No, you don\'t have it.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'sweat') and value3 == 1 or
	msgcontains(msg,'addon') and value3 == 1 or
	msgcontains(msg,'outfit') and value3 == 1 then
	selfSay('Were you able to get hold of a flask with pure warrior\'s sweat?')
	talk_state = 6
	
	elseif msgcontains(msg,'no') and talk_state == 6 then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 6 then
	if getPlayerItemCount(cid,5885) >= 1 then
	doPlayerRemoveItem(cid,5885,1)
	setPlayerStorageValue(cid,9863,1)
	setPlayerStorageValue(cid,9862,-1)
	selfSay('Now that is a pleasant surprise! There is only one task left now: obtain royal steel to have your helmet refined.')
	talk_state = 0
	else
	selfSay('No, you don\'t have it.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'steel') and value4 == 1 or
	msgcontains(msg,'addon') and value4 == 1 or
	msgcontains(msg,'outfit') and value4 == 1 then
	selfSay('Ah, have you brought the royal steel?')
	talk_state = 7
	
	elseif msgcontains(msg,'no') and talk_state == 7 then
	selfSay('Alright then.')
	talk_state = 0
	
	elseif msgcontains(msg,'yes') and talk_state == 7 then
	if getPlayerItemCount(cid,5887) >= 1 then
	doPlayerRemoveItem(cid,5887,1)
	setPlayerStorageValue(cid,9864,1)
	setPlayerStorageValue(cid,9863,-1)
	selfSay('You truly deserve to wear an adorned helmet. Please talk to Andrew and tell him I sent you. I\'m sure he will be glad to refine your helmet.')
	talk_state = 0
	else
	selfSay('No, you don\'t have it.')
	talk_state = 0
	end
	
	elseif msgcontains(msg,'addon') and value5 == 1 or
	msgcontains(msg,'outfit') and value5 == 1 then
	selfSay('Ask Andrew in Celeres to refine your helmet. Told him I sent you.')
	talk_state = 0
	
	end
	return true
	end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())