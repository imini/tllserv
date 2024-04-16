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

        elseif story == 5 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 6

        elseif story == 6 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 7

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

        elseif story == 10 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 11

        elseif story == 11 then 
        
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

	value1 = getPlayerStorageValue(cid,4300)
msg = string.lower(msg)
			if msgcontains(msg, 'spiritual shielding') or msgcontains(msg, 'the spiritual shielding')then
			selfSay('Would you want me to bless you, for a fee of 10000 coins, with the Spiritual Shielding. It will reduce the death penalty by one percent?')
			talk_state = 1
			
			elseif talk_state == 1 and msgcontains(msg, 'no') then
		selfSay('Pity. It could have been usful in your position.')
		talk_state = 0
		
		elseif talk_state == 2 and msgcontains(msg, 'no') or
		talk_state == 3 and msgcontains(msg, 'no') or
		talk_state == 4 and msgcontains(msg, 'no') or
		talk_state == 6 and msgcontains(msg, 'no') or
		talk_state == 7 and msgcontains(msg, 'no') then
		selfSay('Very well. Then not.')
		talk_state = 0
		
		elseif talk_state == 5 and msgcontains(msg, 'combinationsystem') then
				selfSay('When the magican passed away he decided not to bring his secret with him into his grave. Instead, he passed the information of how to enter the gateway to one single person, which he trusted with his life. ....')
				story = 5
				talk_start = os.clock()
				talk_story = os.clock()
				storyMessage[5] = 'That person was me. And although I have decided not to ever mention this secret to any living creature, the burden has become to much even for me. ...'
				storyMessage[6] = 'The secret tore me apart, and I had to flee to this lonely ruin where I didn’t have to share the presence with noone else but unintelligent creatures... but the loneliness has became too much. I’m turning into an animal! ...'
				storyMessage[7] = 'I have to share my secret, but I’m getting too old to fight my way through the labyrinth below. And I don’t get very much visitors here, if you know what I mean, <sneers silently>. ...'
				storyMessage[8] = 'So when I first saw you, ' .. getPlayerName(cid) .. ', I decided that I would ask you if you would like to share my secret... and that’s what I’m going to do right now. ...'
				storyMessage[9] = '' .. getPlayerName(cid) .. ', can you find any interest in learning the true combinationcode to the gateway?'
				talk_state = 6

----------------------------------------------------------

			elseif msgcontains(msg, 'questions') then
    if value1 == -1 then
		selfSay('Aaah, the questions... how funny you mentioned that! Hehehe! So you want to talk about the questions?')
				talk_state = 2
				else
		selfSay('You are in on the secret already, silly youth.')
				talk_state = 0
    end
    

		elseif msgcontains(msg, 'combinationsystem') then
		if value1 == 1 then
		selfSay('Have you already forgot the combinationsystem? You must be careful, these powers are not to play around with. But very well, here it is again: Pulled, pulled, not pulled, not pulled, not pulled, pulled, not pulled, not pulled, pulled, pulled, pulled, not pulled.')
				talk_state = 0
				else
				talk_state = 0
		end

			elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
				selfSay('Interesting... I can see a glimpse of curiosity in your eyes. That\'s strange, because I can also see you don\'t have the slighest clue of what I am talking about... correct?')
				talk_state = 3
		end
		elseif talk_state == 3 then
			if msgcontains(msg, 'yes') then
				selfSay('Hahaha! I am talking about the unknown. The X\'s on the maps. The yet unexplored. I can see on the way you move that you have thought about these places... I\'m psychic, you see! Hehe! So, would you like me to introduce you to one of these secrets, one which I have possessed for very long?')
				talk_state = 4
		end
		
		
				
		elseif talk_state == 4 and msgcontains(msg, 'yes') then
				selfSay('Alright then... I will tell you. ...')
				story = 1
				
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[1] = 'Far back in the webs of history, there was a man who was famously known as a great explorer. He travelled the world in order explore it all. But one day, when sailing the Northern Seas he came across an island... harmless, for the bare eye. ...'
			storyMessage[2] = 'It didn’t take long until our hero ran ashore and faced the creations on this isle – what it was... I don’t know. The magican fled from the isle, shortly afterwards he cast a powerful spell upon it, to make sure noone ever came to find it again. ...'
			storyMessage[3] = 'However, our wizard was smart, and he understood that this island wasn’t only the home for unspeakable horrors – but also for treasures unique of its kind. ...'
			storyMessage[4] = 'So, with great caution he created a secret gateway between the isle and a magic temple in the graveyard of Lucifer. And to prevent curious explorers from entering the gateway, he enchanted it with an extremely complicated combinationsystem.'
			talk_state = 5

		
				
		elseif talk_state == 6 then
			if msgcontains(msg, 'yes') then
				selfSay('Wonderful! But you will have to promise never to tell anyone of this meeting, secret or anything related to me or the Isle of Inferno. Do you promise? Yes?')
				talk_state = 7
		end
		elseif talk_state == 7 then
			if msgcontains(msg, 'yes') then
				selfSay('Alright then! Assume that you begin to pull levers in the south-west corner, and thereafter continue clockwise until you are in the south-east corner. The following formula reveals whether the levers should be pulled or not while entering the teleport. ...')
				story = 10
				talk_start = os.clock()
				talk_story = os.clock()
				storyMessage[10] = 'Pulled, pulled, not pulled, not pulled, not pulled, pulled, not pulled, not pulled, pulled, pulled, pulled, not pulled. ...'
				storyMessage[11] = 'And remember this code, there’s no chance you could crack it by luck... no, there’s a total of 8916100448256 different combinations.'
				setPlayerStorageValue(cid,4300,1)
				talk_state = 0


			end
	elseif talk_state == 1 then
		if msgcontains(msg, 'yes') then
		if getPlayerBlessing(cid, talk_state) then
		selfSay('A god has already blessed you with this blessing.')
		else
		if doPlayerRemoveMoney(cid, 10000) == 1 then
		doPlayerAddBlessing(cid, talk_state)
		selfSay('You have been blessed by one of the five gods!')
		else
		selfSay('You don\'t have enough money.')
				end
			end
			end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())