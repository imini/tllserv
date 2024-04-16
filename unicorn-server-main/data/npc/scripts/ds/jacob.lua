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
	if (os.clock() - talk_story) > 12 and story > 0 then
    
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
        npcHandler.focus = cid

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
	value1 = getPlayerStorageValue(cid,3077)
  value2 = getPlayerStorageValue(cid,3075)
  value3 = getPlayerStorageValue(cid,4370)
  value4 = getPlayerStorageValue(cid,3079)
  jacobvalue1 = getPlayerStorageValue(cid,9435)
  jacobvalue5 = getPlayerStorageValue(cid,9425)
  msg = string.lower(msg)
  
			if msgcontains(msg, 'mission') and value2 == -1 then
			   npcHandler:say('Yes! You must help me! My brother has been caught by the perilous black knights. I don’t even know if he’s alive still, buy please – find out for me. Go down there and look for the black knights – and my brother. Could you do that?')
			talk_state = 2
			
			elseif jacobvalue1 == 1 and msgcontains(msg,'pact') then
			selfSay('Bah, who do you think I am? I better send a letter to the sheriff.')
			
			elseif jacobvalue5 == 1 and msgcontains(msg,'pact') then
			selfSay('A pact to destroy the lives of countless people? Are you stupid!? Get out of here, you fool.')
			setPlayerStorageValue(cid,9435,1)
			setPlayerStorageValue(cid,9425,-1)
			
			elseif msgcontains(msg, 'mission') and value1 == 1 and value4 == -1 then
				selfSay('You have already completed my mission.')
				talk_state = 0

			elseif talk_state == 2 and msgcontains(msg, 'yes') then
				selfSay('Thank god! Finally a rescuer. Good luck then, child.')
				setPlayerStorageValue(cid,3075,1)
				talk_state = 0
				
				elseif talk_state == 2 and msgcontains(msg, 'no') then
				selfSay('Oh. I really thought you would.')
				talk_state = 0
				
				elseif msgcontains(msg, 'mission') and value2 == 1 and value4 -1 then
				selfSay('Please, you must find my brother for me.')
				talk_state = 0
				
				elseif msgcontains(msg, 'mission') and value4 == 1 then
				selfSay('You have already completed my mission.')
				talk_state = 0
				
				elseif msgcontains(msg, 'note') and value4 == 1 then
				selfSay('I have recieved the note from my brother and you have successfully finished all my tasks.')
				talk_state = 0
				
        
		elseif msgcontains(msg, 'note') and value3 == 1 and value1 == -1 and value4 == -1 then	
			selfSay('Do you have a note for me?')
			talk_state = 3
			
		elseif msgcontains(msg, 'note') and value1 == 1 and value4 == -1 then	
			selfSay('You have passed me this note. I want you to seek the ice stalagmite and then sacrifice it to the ice god at the altar in the south.')
			talk_state = 3
			
		elseif msgcontains(msg, 'note') and value3 == -1 and value4 == -1 then	
			selfSay('You could have written it yourself. I can\'t trust anything in any note you give me.')
			talk_state = 0
		
    elseif talk_state == 3 and
			msgcontains(msg, 'no') then
			selfSay('Oh... right. <looks confused>')

			elseif talk_state == 3 and
			msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,4857)  >= 1 then
			doPlayerTakeItem(cid,4857,1)

			selfSay("Oh, okey. I’ll read it. <A minute passes>. OH NO! This can’t be true! Oh please god, tell me this isn’t true. My brother... I will mourn his memory forever. But you were a real hero to bring me this. ...")
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'I know it ain’t much, but I want to reward you. But first, I’ll have to tell you a story. ...'

			storyMessage[2] = 'I understand you have been down where the black knights live. Once in time, that place used to be a home for me and my brother and a few other people. In one of the room me and my brother put our most valuable belongings. ...'

			storyMessage[3] = 'This room is sealed, and can only be entered by those who has sacrificed to the ice god. I want you to have those valuables, ' .. getPlayerName(cid) .. '! I don’t have any need for them now that my brother is about to enter the kingdom of the dead. ...'

			storyMessage[4] = 'I’ll tell you how to make your sacrifice to the ice god. Listen carefully now, ' .. getPlayerName(cid) .. '! ...'

			storyMessage[5] = 'First you must seek the frost dragons. They guard a very special ice stalagmite. You need to break a piece of it and bring it to the secret altar in the mountains to the south. At the altar, you can sacrifice the icicle. Thereafter, you will be able to enter the sealed room down in the cells. ...'

			storyMessage[6] = 'Now go, ' .. getPlayerName(cid) .. '! And I wish you all luck I possibly can.'
			setPlayerStorageValue(cid,3077,1)
			talk_state = 0
			else
				selfSay('No, you don\'t.')
				talk_state = 0
			end

		end
		return true
	end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
