local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local storyMessage = {}
local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function callbackOnThink()


	if (os.clock() - talk_story) > 6 and story > 0 then
    
         if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	talk_state = 3
	story = 0

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
	talk_state = 4
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
	    talk_state = 3
            story = 0

end
end
return true
end
npcHandler:setCallback(CALLBACK_ONTHINK, callbackOnThink)





-- OTServ event handling functions end



-----------------------------------------------------------------------------------------------------
function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	value0 = getPlayerStorageValue(cid,7070)
	value2 = getPlayerStorageValue(cid,7321)
	value3 = getPlayerStorageValue(cid,7322)
	value4 = getPlayerStorageValue(cid,7323)
	value5 = getPlayerStorageValue(cid,7324)
	value6 = getPlayerStorageValue(cid,7325)
	value7 = getPlayerStorageValue(cid,7020)
  msg = string.lower(msg)

		if msgcontains(msg, 'outfit') or msgcontains(msg, 'addon') and value7 == -1 then
			selfSay('How do you like my blessed wand? Is it nice?')
			talk_state = 1
	
		elseif talk_state == 1 and msgcontains(msg, 'yes') then
			   selfSay('I thought so too. It’s made out of a quite complex ritual.')
			talk_state = 99

		elseif talk_state == 1 and msgcontains(msg, 'no') then
			   selfSay('How arrogant!')
			talk_state = 0


		elseif talk_state == 99 and msgcontains(msg, 'ritual') then
			selfSay('Would you like me to do a ritual for you too, so you can carry a wand similar to my own?')
			talk_state = 2

		elseif talk_state == 2 and msgcontains(msg, 'no') then
			   selfSay('No? Okey then.')

		elseif talk_state == 2 and msgcontains(msg, 'yes') then
			   selfSay('I fear I need some important ingredients for my blessing spell first. ...')
				story = 1
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[1] = 'Will you gather them for me?'
			
			elseif talk_state == 3 and msgcontains(msg, 'no') then
			selfSay('Very well...')
			talk_state = 0
		elseif talk_state == 3 and msgcontains(msg, 'yes') then
			   selfSay('Thank you, I promise that your efforts won’t be in vain! Listen closely now. First, I need a sample of each druid rod and sorcerer wand there is in the Lost Lands. Please bring them all at once so that their energy will be balanced. ...')
				story = 2
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[2] = 'Secondly, I need 10 ounces of magic sulphur. It can absorb the elemental energy of all wands and rods and bind it to something else. ...'
			storyMessage[3] = 'Next, I will need a soul stone. There can be used a vessel for energy, evil as well as good. They are rarely used nowadays though, but I suppose the necromantic lord should have one. ...'
			storyMessage[4] = 'Lastly, I will need a lot of holy energy. I can extract it from ankhs, but only a small amount each time. I will need about 20 ankhs. ...'
			storyMessage[5] = 'Did you understand everything I told you and will help me with my blessing?'
elseif talk_state == 4 and msgcontains(msg, 'no') then
			selfSay('Very well...')
			talk_state = 0

		elseif talk_state == 4 and msgcontains(msg, 'yes') then
			   selfSay('Alright then. Come back to with a sample of all five wands and five rods, please.')
			setPlayerStorageValue(cid,7020,1)
			setPlayerStorageValue(cid,7070,1)
			talk_state = 0

	
---------------------------------- wands\rods ----------------------------
		
		elseif msgcontains(msg, 'wand') or msgcontains(msg, 'rod') or msgcontains(msg, 'outfit') or msgcontains(msg, 'addon') and value0 == 1 then
			selfSay('Did you bring a sample of each wand and each rod with you?')
			talk_state = 20
elseif talk_state == 20 and msgcontains(msg, 'no') then
			selfSay('Very well...')
			talk_state = 0
		elseif talk_state == 20 and msgcontains(msg, 'yes') then
        		if getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2182) >= 1 then
			doPlayerTakeItem(cid,2187,1)
			doPlayerTakeItem(cid,2189,1)
			doPlayerTakeItem(cid,2188,1)
			doPlayerTakeItem(cid,2190,1)
			doPlayerTakeItem(cid,2191,1)
			doPlayerTakeItem(cid,2183,1)
			doPlayerTakeItem(cid,2181,1)
			doPlayerTakeItem(cid,2182,1)
			doPlayerTakeItem(cid,2185,1)
			doPlayerTakeItem(cid,2186,1)
			setPlayerStorageValue(cid,7070,-1)
			setPlayerStorageValue(cid,7321,1)
			   selfSay('Thank you, that must have been a lot to carry. Now, please bring me 10 ounces of magic sulphur.')
			talk_state = 0
			else
			selfSay('Come back when you got it!')
			talk_state = 0
			end

---------------------------------- magic sulphur ----------------------------

		elseif msgcontains(msg, 'magic sulphur') or msgcontains(msg, 'outfit') or msgcontains(msg, 'addon') and value2 == 1 then
			selfSay('Have you collected 10 ounces of magic sulphur?')
			talk_state = 27
elseif talk_state == 27 and msgcontains(msg, 'no') then
			selfSay('Very well...')
			talk_state = 0

		elseif talk_state == 27 and msgcontains(msg, 'yes') then
        		if getPlayerItemCount(cid, 5904) >= 10 then
			doPlayerTakeItem(cid,5904,10)
			setPlayerStorageValue(cid,7321,-1)
			setPlayerStorageValue(cid,7322,1)
			   selfSay('Very good. I will immediately start to prepare the ritual and extract the elemental energy from the wands and rods. Please bring me the Necromancer\'s soul stone now.')
			talk_state = 0
			else
			selfSay('Come back when you got it!')
			end

---------------------------------- soul stone ----------------------------

		elseif msgcontains(msg, 'soul stone') or msgcontains(msg, 'outfit') or msgcontains(msg, 'addon') and value3 == 1 then
			selfSay('Were you actually able to retrieve the Necromancer\'s soul stone?')
			talk_state = 22
elseif talk_state == 22 and msgcontains(msg, 'no') then
			selfSay('Very well...')
			talk_state = 0
		elseif talk_state == 22 and msgcontains(msg, 'yes') then
        		if getPlayerItemCount(cid, 5809) >= 1 then
			doPlayerTakeItem(cid,5809,1)
			setPlayerStorageValue(cid,7322,-1)
			setPlayerStorageValue(cid,7323,1)
			selfSay('You have found a rarity there, ' .. getPlayerName(cid) .. '. This will become the tip of your blessed wand. Please bring me 20 ankhs now to complete the ritual')
			talk_state = 0
			else
			selfSay('Come back when you got it!')
			end

---------------------------------- ankh ----------------------------

		elseif msgcontains(msg, 'ankh') or msgcontains(msg, 'outfit') or msgcontains(msg, 'addon') and value4 == 1 then
			selfSay('Am I sensing enough holy energy from ankhs here?')
			talk_state = 28
elseif talk_state == 28 and msgcontains(msg, 'no') then
			selfSay('Very well...')
			talk_state = 0

		elseif talk_state == 28 and msgcontains(msg, 'yes') then
        		if getPlayerItemCount(cid, 2193) >= 20 then
			doPlayerTakeItem(cid,2193,20)
			setPlayerStorageValue(cid,7323,-1)
			setPlayerStorageValue(cid,7324,1)
			selfSay('The ingredients for the ritual are complete! Here is your wand which I promised you.')
                	doPlayerAddOutfit(cid, 141, 1)
                	doPlayerAddOutfit(cid, 130, 1)
			setPlayerStorageValue(cid,7325,1)
			talk_state = 0
			else
			selfSay('Come back when you got it!')
			end


		elseif msgcontains(msg, 'outfit') or msgcontains(msg, 'addon') and value6 == 1 then
			   selfSay('You already  recieved my wand.')



end
return true
end

-----------------------------------------------------------------------------------------------------


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
