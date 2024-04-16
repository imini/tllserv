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
	if (os.clock() - talk_story) > 14 and story > 0 then
    
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
		msg = string.lower(msg)	
	value19 = getPlayerStorageValue(cid,9720)
	value20 = getPlayerStorageValue(cid,9712)
	value1 = getPlayerStorageValue(cid,9897)

	value2 = getPlayerStorageValue(cid,9525)
	value3 = getPlayerStorageValue(cid,9526)
	value4 = getPlayerStorageValue(cid,9527)
	value5 = getPlayerStorageValue(cid,9528)

	if value20 == 1 and value19 == -1 and msgcontains(msg,'measurements') then
	selfSay('Oh no! I knew that day would come! I am slightly above the allowed weight and if you can\'t supply me with some grapes to slim down I will get fired. Do you happen to have some grapes with you?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Okay. Come back when you have if you want to know my measurements.')
	talk_state = 0
	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2681) >= 3 then
	doPlayerRemoveItem(cid,2681,3)
	setPlayerStorageValue(cid,9720,1)
	selfSay('Oh thank you! Thank you so much! So listen ... <whispers her measurements>.')
	talk_state = 0
	else
	selfSay('You don\'t have enough grapes.')
	talk_state = 0
	end
	
	elseif value19 == 1 and msgcontains(msg,'measurements') then
	selfSay('I have told you them already.')
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value2 == -1 or
	msgcontains(msg,'quest') and value2 == -1 then
	selfSay('Are you looking for a mission, ' .. getPlayerName(cid) .. '?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Oh, I just had the impression you were...')
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'yes') then
	selfSay('Terrific, for I am actually in need of some help right now. It recently came to my knowledge that gigantic insects actually lives under the sand. I have some kind of phobia for insects you see, and when they come in such big properties... woah. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'If you could just kill a few... or preferably many, just to ease my mind, I would be very grateful. Bring me those shiny things that they drop sometimes, too, partly because they\'re nice and partly because it\'d serve as a proof. ...'
  storyMessage[2] = 'Well, ' .. getPlayerName(cid) .. ', have you fully understood what you are asked to do?'
	talk_state = 7
	
	elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Well, refresh your mind and return again later then.')
	talk_state = 0
	
	elseif talk_state == 7 and msgcontains(msg,'yes') then
	selfSay('Good. Then I will await your return. Just don\'t forget to bring the shiny... things. 15 will do.')
	setPlayerStorageValue(cid,9525,1)
	setPlayerStorageValue(cid,9526,1)
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value3 == 1 or
	msgcontains(msg,'coins') and value3 == 1 or
	msgcontains(msg,'scarab') and value3 == 1 or
	msgcontains(msg,'quest') and value3 == 1 then
	selfSay('Have you collected 15 scarab coins as a proof that you have slayed these terrible insects of giant properties, ' .. getPlayerName(cid) .. '?')
	talk_state = 8
	
	elseif talk_state == 8 and msgcontains(msg,'no') then
	selfSay('Come back when you have collected them then.')
	talk_state = 0
	
	elseif talk_state == 8 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2159) >= 15 then
  doPlayerRemoveItem(cid,2159,15)
	setPlayerStorageValue(cid,9526,-1)
	setPlayerStorageValue(cid,9527,1)
	selfSay('Very good. This will certainly make me sleep better at night. Now, I want to give you a little something for your trouble. Will you accept this from me, ' .. getPlayerName(cid) .. '?')
	talk_state = 9
	else
	talk_state = 0
	selfSay('You don\'t have them.')
	end
	
	elseif talk_state == 9 and msgcontains(msg,'no') then
	selfSay('Fine, but remember to ask me about a reward some day then.')
	talk_state = 0
	
	elseif talk_state == 9 and msgcontains(msg,'yes') then
	selfSay('Good, I hoped you\'d accept it. This key was given to me by my father. I think it might help you someday... perhaps by opening a door. Or something. Who knows?')
	bag = doPlayerAddItem(cid,1987,1)
	setPlayerStorageValue(cid,9527,-1)
	setPlayerStorageValue(cid,9528,1)
	doAddContainerItem(bag,2214,1)
	key = doAddContainerItem(bag,2087,1)
	doSetItemActionId(key,3412)
	talk_state = 0
	
	elseif value4 == 1 and msgcontains(msg,'mission') or 
	value4 == 1 and msgcontains(msg,'reward') then
	selfSay('Well, I promised you a reward, didn\'t I? Do you want it now?')
	talk_state = 9
	
	elseif value5 == 1 and msgcontains(msg,'mission') or 
	value5 == 1 and msgcontains(msg,'reward') then
	selfSay('You have had a reward already.')
	talk_state = 0
	
	
	
	
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())