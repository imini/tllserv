
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
	if (os.clock() - talk_story) > 7 and story > 0 then
    
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

            story = 5
             elseif story == 5 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()

            story = 0

        elseif story == 6 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 7
            elseif story == 7 then 
        
            selfSay(storyMessage[story])
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

	value3 = getPlayerStorageValue(cid,9610)
	value1 = getPlayerStorageValue(cid,9609)
	value2 = getPlayerStorageValue(cid,4303)
	value4 = getPlayerStorageValue(cid,9613)
	value5 = getPlayerStorageValue(cid,4306)
  value6 = getPlayerStorageValue(cid,9611)
  value7 = getPlayerStorageValue(cid,4311)
  msg = string.lower(msg)
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid,9543) == 2 then
			selfSay('A mission? I don’t know. After all, you’re actually a human. ...')
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'But after all, Otarn spoke nicely about you. ...'
			storyMessage[2] = 'Actually, I believe I might have some use of you. ...'
			storyMessage[3] = 'You see, we have since long ago had a spy in the efreets fortress. They have been unaware of this, but we have not heard from him for a while. ...'
			storyMessage[4] = 'Therefore, I ask you to go there and seek our spy. If you find him, ask him for a spy report or something. He should have had time enough to finish one. ...'
			storyMessage[5] = 'Do we understand each other?'
			talk_state = 1
			
			elseif msgcontains(msg,'no') and talk_state == 1 then
			selfSay('I hate humans.')
			talk_state = 0
			
			elseif msgcontains(msg,'yes') and talk_state == 1 then
			selfSay('Good. Then return to me when or if you have found our spy and acquired his report.')
			talk_state = 0
			setPlayerStorageValue(cid,9543,3)

      elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 3 then
      selfSay('Ah, have you found our spy and acquired any spy report?')
      talk_state = 2
      
      elseif msgcontains(msg,'no') and talk_state == 2 then
			selfSay('That\'s truly a shame.')
			talk_state = 0
			
			elseif msgcontains(msg,'yes') and talk_state == 2 then
			if getPlayerItemCount(cid,2345) >= 1 then
			selfSay('Really? How come you didn\'t get slaughtered? Truly amazing, your kind never seizes to surprise me. ...')
			story = 6
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[6] = 'Well, let\'s see. ...'
			storyMessage[7] = 'I think I need to speak with Umar about this. He should know what to do. You better speak with him too.'
			doPlayerRemoveItem(cid,2345,1)
			setPlayerStorageValue(cid,9543,6)
			talk_state = 0
			else
			selfSay('No, that is a lie.')
			talk_state = 0
			end

elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == -1 then
  selfSay('Otarn told me he needed your help with his book collection.')

elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 6 then
  selfSay('You should have a talk with Umar. He should know what to do now.')

elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9543) == 11 then
  selfSay('You have finished all our missions.') 
  

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
