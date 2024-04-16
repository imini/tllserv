
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
	if (os.clock() - talk_story) > 8 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2

        elseif story == 2 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	talk_state = 2
            story = 0

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

        elseif story ==5 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 6

        elseif story == 6 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()


            story = 0


        elseif story == 7 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 8

        elseif story == 8 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 9

        elseif story == 9 then 
        
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


  msg = string.lower(msg)
	value2 = getPlayerStorageValue(cid,4313)
	value3 = getPlayerStorageValue(cid,4314)
  value4 = getPlayerStorageValue(cid,9606)
  value5 = getPlayerStorageValue(cid,9607)
  value6 = getPlayerStorageValue(cid,4321)
  
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid,9541) == -1 then
			selfSay('Each and every mission and operation executed properly is a crucial step towards our victory! ...')
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'Now that we speak of it. ...'
			storyMessage[2] = 'Since you are no djinn, there is something you could help us with. Are you interested, human?'
			setPlayerStorageValue(cid,9541,1)

		elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid,9541) == 3 then
      selfSay('Did you find the thief of our supplies?')
			talk_state = 3

  elseif talk_state == 2 and msgcontains(msg, 'no') then
  selfSay('Fine, then there is no need for us to speak.')
  talk_state = 0
  
	elseif talk_state == 2 and msgcontains(msg, 'yes') then
  selfSay('Well... all right. You may only be a human, but you do seem to have the right spirit. Listen! Since our base of operations is set in the isolated spot we depend on supplies from outside. These supplies are crucial for us to win the war. ...')
			story = 3
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[3] = 'Unfortunately, it has happened that some of our supplies have disappeared on their way to this fortress. At first we thought it was the Efreet, but intelligence reports suggest a different explanation. ...'
			storyMessage[4] = 'We now believe that a human was behind the theft. ...'
			storyMessage[5] = 'His identity is still unknown but we have been told that the thief fled to the human settlement called Celeres. I want you to find him and report back to me. Nobody messes with the Efreet and lives to tell the tale! ...'
			storyMessage[6] = 'Now go! Travel to the city of Celeres! Keep your eyes open and look around for something that might give you a clue!'
			setPlayerStorageValue(cid,9541,2)

			elseif talk_state == 3 and msgcontains(msg, 'yes') then
			if value3 == 1 then
      selfSay('Finally! What is his name then?')
				talk_state = 4
			else
			selfSay('You are lying, fool.')
			talk_state = 0
      end

			elseif talk_state == 4 and msgcontains(msg, 'creyo') then
        			selfSay('You found the thief! Excellent work, soldier! You are doing well – for a human, that is. ...')
        			talk_state = 0
    setPlayerStorageValue(cid,9541,4)
				story = 7
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[7] = 'Here – take this as a reward. ...'
			doPlayerAddItem(cid,2152,6)
			storyMessage[8] = 'Since you have proven to be a capable soldier, we have another mission for you. ...'
			storyMessage[9] = ' If you are interested, go to Alusir and ask him about it.'

    elseif getPlayerStorageValue(cid,9541) == 4 and msgcontains(msg,'mission') then
    selfSay('If you want to continue to help us, I suggest you go to Alusir.')
    elseif getPlayerStorageValue(cid,9541) == 7 and msgcontains(msg,'mission') then
    selfSay('I want you to speak with Falor, human.')
    elseif getPlayerStorageValue(cid,9541) == 11 and msgcontains(msg,'mission') then
    selfSay('We have no more missions for you, maggot human. You can now trade with our people.')
end
return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
