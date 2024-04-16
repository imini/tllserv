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
	story = 3
	elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
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
	

	value0 = getPlayerStorageValue(cid,9560)
	value1 = getPlayerStorageValue(cid,9561)
	value2 = getPlayerStorageValue(cid,9562)
	msg = string.lower(msg)
	
	if msgcontains(msg,'dubai') and value0 == -1 or
	msgcontains(msg,'portal') and value0 == -1 then
	selfSay('Would you have time to listen to a story about Dubai and his portal?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('I see.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Good. Well then, let me tell you. Dubai is an ancient god who was worshipped by many entities drawn to the evil in our world. I was one of them. As a follower of Dubai I offered my everything to him. ...')
	story = 1
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'I was ordered to guard this portal to his kingdom... well, not directly from Dubai, but I was ordered by... well, yes, I was ordered to do it. They said my life would continue for all eternity. ...'
  storyMessage[2] = 'Quite a decent offer, I thought, but what I didn\'t realise was that I would be trapped here... for ever. Anyway, I have had some time to think, obviously, and I have come up with a plan. ...'
  storyMessage[3] = 'This plan would, if I was lucky, set me free. The thing is that I can\'t execute it myself. So I had to wait for someone to turn up who was willing to do it for me. I believe the time has come. Am I right?'
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Then leave me.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Good. Then I will tell you how to enter the portal. The thing is that you must sacrifice items to Dubai\'s spirit. I can tell you what the items are, but you will have to collect them by yourself. Do you understand?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('Then leave me.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('There\'s no need for every person who wants to enter the portal to collect the items, one example of each item is perfectly fine. Apart from the items, you will probably need a certain key too. But there\'s a problem. ...')
	story = 4
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[4] = 'You see, the last known owner of this key was a man who has passed away. But the hope is not relinquished, no, the man had a daughter who should live somewhere here on Dustwit. Walk around and ask different girls for missions and you might turn up with the key in your hands. Return after you have obtained the key.'
  setPlayerStorageValue(cid,9560,1)
  setPlayerStorageValue(cid,9561,1)
	talk_state = 0
	
	elseif msgcontains(msg,'dubai') and value1 == 1 or
	msgcontains(msg,'key') and value1 == 1 or
	msgcontains(msg,'portal') and value1 == 1 then
	selfSay('Have you obtained the key from the old mans daugther?')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('You need it! Return when you have it.')
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'yes') then
	selfSay('Good. Then you will need to gather the four items. These are a dragon necklace, a fire mushroom, a small ruby and a firebomb rune. Throw them all into the lava pit here. AFTER you have done that, you will need to do one more thing. ...')
	story = 5
	talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[5] = 'You must somehow obtain a fire plant which, as far as I know, doesn\'t grow anywhere. In spite of this, I believe there is someone who sells it somewhere in the capital of Lithaton. Remember to sacrifice it AFTER your have sacrifice the other items. ...'
	storyMessage[6] = 'After this, you should be able to enter the portal. Now, if you defeat Dubai\'s spirit or something, I might be released. You must keep your eyes opened, ' .. getPlayerName(cid) .. '.'
	talk_state = 0
	setPlayerStorageValue(cid,9561,-1)
  setPlayerStorageValue(cid,9562,1)
  
  elseif msgcontains(msg,'dubai') and value2 == 1 or
	msgcontains(msg,'fire plant') and value2 == 1 or
	msgcontains(msg,'portal') and value2 == 1 then
	selfSay('If you have sacrificed the dragon necklace, the fire mushroom, the small ruby and the firebomb rune, and thereafter obtained the key, you can sacrifice the fire plant.')
	talk_state = 0
	
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())