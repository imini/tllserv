
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
local storyMessage = {}
local story = 0
local talk_story = 0
function onThink() npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 10 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2

        elseif story == 2 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
        

            story = 3

        elseif story == 3 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 4

        elseif story == 4 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 5

        elseif story == 5 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()

            story = 6

        elseif story == 6 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 0
            talk_state = 1

        elseif story == 7 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 0





        end
            
    end
    return true
    end
    npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)
-- OTServ event handling functions end
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end


  msg = string.lower(msg)
	value1 = getPlayerStorageValue(cid,4306)
	value2 = getPlayerStorageValue(cid,4308)
	value3 = getPlayerStorageValue(cid,4310)
	value4 = getPlayerStorageValue(cid,9610)
	value5 = getPlayerStorageValue(cid,9611)
 value6 = getPlayerStorageValue(cid,4311)
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid,9543) == 6 then
			selfSay(' Sooo, Fa’hadir told me about how you helped us. ...')
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'I’m afraid to ask, because you have already done so much for us, but there is actually one task left which would be perfect for a strong and smart warrior like you. ...'

			storyMessage[2] = 'For quite long now, we have been planning a major and determining attack against the efreets, but before we are doing it we have a special plan which can eliminate their leader once and for all. ...'

			storyMessage[3] = 'Long time ago, a stupid orc found Falors magical lamp, and released him by pure greed for power. Those orcs are nothing but stupid, filthy fools! ...'
			
			storyMessage[4] = 'However, if we could steal that lamp from the orcs and thereafter exchange it for Falors personal sleeping lamp we could trap him again and the war would be over one night after. ...'

			storyMessage[5] = 'Perhaps you start to realise what a dangerous mission this is, ' .. getPlayerName(cid) .. ', but if you would like to help us in this matter you will forever be remembered as a true helper of the blue djinns! ...'

			storyMessage[6] = 'So, do you want to do this?'
	    
  
  elseif talk_state == 1 and msgcontains(msg, 'no') then
  selfSay('I understand how you not want to, but please consider it. It is of great importance.')
  talk_state = 0

	elseif talk_state == 1 and msgcontains(msg, 'yes') then
  selfSay('Very well. Deep below the fields east of Casteldine the orcs have built their very biggest base this far. I want you to travel there and then locate that stupid orc and steal the lamp from him. ...')
			story = 7
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[7] = 'Thereafter, you will have to infiltrate the efreets tower once again, sneak into Falors personal sleeping room and then exchange his sleeping lamp for the other one. Have you understood everything?'
			talk_state = 2
			
	elseif talk_state == 2 and msgcontains(msg, 'no') then
  selfSay('Very well.')
  talk_state = 0

	elseif talk_state == 2 and msgcontains(msg, 'yes') then
	selfSay('Good. Before you leave, I must remind you that this mission is very dangerous and you will have to expect no mercy from our green foes... nor the orcs. Good luck, human ' .. getPlayerName(cid) .. '!')
	setPlayerStorageValue(cid,9543,8)
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 8 then
	selfSay('I need you to go to the orcish base in Casteldine and retrieve the lamp, then sneak into Falors sleeping room and exchange his sleeping lamp.')
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 10 then
	selfSay('Intelligence reports have told me you have successfully finished your mission. I now allow you to trade with our kind. Thank you again, human.')
	setPlayerStorageValue(cid,4311,1)
	getPlayerStorageValue(cid,9543,11)
	
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == -1 then
  selfSay('Otarn told me he needed your help with his book collection.')
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 2 then
  selfSay('Fa\'hadir needs your help.')
elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 11 then
  selfSay('You have already helped us enough. You are allowed to trade with our kind, now.')  
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
