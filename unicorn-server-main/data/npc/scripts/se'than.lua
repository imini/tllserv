local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()
    end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

	value1 = getPlayerStorageValue(cid,5050)
	value2 = getPlayerStorageValue(cid,9917)
	value3 = getPlayerStorageValue(cid,9918)
	sethanvalue1 = getPlayerStorageValue(cid,9442)
  sethanvalue2 = getPlayerStorageValue(cid,9458)
	msg = string.lower(msg)
	
	if msgcontains(msg, 'starlight amulet') or msgcontains(msg, 'amulet') or msgcontains(msg, 'fishing') then
	if value2 == 1 and value1 == -1 then
			selfSay('Have you recovered my amulet?')
			talk_state = 1
		end
		
	elseif msgcontains(msg, 'starlight amulet') or msgcontains(msg, 'amulet') or msgcontains(msg, 'fishing') then
	if value2 == -1 and value1 == -1 then
			selfSay('You are not to be involved in issues which doesn\'t concern you.')
			talk_state = 0
		end	
	
	elseif msgcontains(msg,'magical prison') and sethanvalue1 == 1 and sethanvalue2 == -1 then
	selfSay('A magical prison to imprison a bear!? So that you can lead it to Casteldine??? You humans are so strange. Anyway, of course I can help you as it will kill humans, but I still think it\'d be better if you commited it in Celeres. Well, are you sure you want to do it?')
	talk_state = 25
	
	elseif talk_state == 25 and msgcontains(msg,'no') then
	selfSay('Alright, then.')
	talk_state = 0
		
	elseif talk_state == 25 and msgcontains(msg,'yes') then
	selfSay('Very well. Take this rune. Use it on the bear to magically trap it within, then extract it wherever you want.')
	setPlayerStorageValue(cid,9458,1)
	doPlayerAddItem(cid,2297,1)
	talk_state = 0	
	
	elseif msgcontains(msg,'magical prison') and sethanvalue2 == 1 then
	selfSay('I have given you the rune...')
	talk_state = 0
		
	elseif msgcontains(msg, 'scroll') or msgcontains(msg, 'poem scroll') or msgcontains(msg, 'poem') then
	if value2 == 1 and value1 == 1 and value3 == -1 then
			selfSay('Do you like poems, human?')
			talk_state = 12
		end	
		
	elseif msgcontains(msg, 'scroll') or msgcontains(msg, 'poem scroll') or msgcontains(msg, 'poem') then
	if value2 == 1 and value1 == 1 and value3 == 1 then
			selfSay('You have given me this poem already')
			talk_state = 0
		end
		
	elseif msgcontains(msg, 'starlight amulet') or msgcontains(msg, 'amulet') or msgcontains(msg, 'fishing') then
	if value2 == 1 and value1 == 1 then
			selfSay('You have given me the lost amulet and I have granted you access to the chamber of Khamos.')
			talk_state = 0
		end	
		
    elseif talk_state == 4 and msgcontains(msg, 'no') then
    selfSay('Very well. You have helped me tremendously, so then keep it.')
    talk_state = 0
    
    elseif talk_state == 4 and msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,6119)  >= 1 then
			doPlayerTakeItem(cid,6119,1)
			setPlayerStorageValue(cid,9918,1)
			setPlayerStorageValue(cid,9920,1)
			bag = doPlayerAddItem(cid,1987,1)
			doAddContainerItem(bag,2580,1)
			doAddContainerItem(bag,2318,1)
			doAddContainerItem(bag,2150,4)
			doAddContainerItem(bag,2664,1)
			   selfSay('Nice of you, human. Take this little gift from me instead. Especially the cowl will probably suite you very well. I promise.')
			talk_state = 0
			else
				selfSay('You must have dropped it or something. You don\'t have it.')
			talk_state = 0
		end
    
     elseif talk_state == 12 and msgcontains(msg, 'yes') then
    selfSay('Interesting. I noticed you brought the poem scroll with you from Khamos\' chamber. I had forgotten about it, but now that you have taken it I cannot of course force you to give it to me. But perhaps you will give it to me as a friend?')
    talk_state = 4
		
		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,2138)  >= 1 then
			doPlayerTakeItem(cid,2138,1)
			setPlayerStorageValue(cid,5050,1)
			   selfSay('Thank you! As a reward, I hereby grant you access to the holy chamber of Khamos!')
			talk_state = 0
			else
				selfSay('Disgusting human! Don\'t you lie to me!')
			talk_state = 0
		end

			elseif talk_state == 1 and msgcontains(msg, 'no') then
				selfSay('Well, what are you waiting for? And don\'t fail me this time...')
				talk_state = 0
				

end

    elseif talk_state == 2 and msgcontains(msg, 'no') then
    selfSay('It didn\'t surprise me the least.')
    talk_state = 0

		elseif msgcontains(msg, 'quest') or msgcontains(msg, 'mission') and value2 == -1 and value1 == -1 then	
		if value1 == -1 then
			selfSay('I don\'t encourage the thought of relying such an important mission to a simple creation as a human, but I guess I have no choice... will you help me?')
			talk_state = 2
		else
		selfSay('Thanks again for returning my amulet.')
		talk_state = 0
		end
		
		
		elseif msgcontains(msg, 'quest') or msgcontains(msg, 'mission') and value2 == 1 and value1 == -1 then	
			selfSay('Your memory fails you, human. I have asked you to retrieve the lost amulet from Paschendale.')
			talk_state = 0
			
		elseif msgcontains(msg, 'quest') or msgcontains(msg, 'mission') and value2 == 1 and value1 == 1 then	
			selfSay('You have already fulfilled my mission, human.')
			talk_state = 0
		
		elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
			setPlayerStorageValue(cid,5051,1)
			selfSay("Very well, a horrifying giant spider killed one of my scouts, who was ordered bring a holy amulet to... hmm, you don\'t have to know all the details, right?")
			  talk_state = 3
end

		elseif talk_state == 3 then
			if msgcontains(msg, 'no') then
			selfSay("The only information I can spare is that the scout disappeared somewhere in Paschendale. Your mission is to recover the stolen amulet, and bring it back to me... as soon as possible.")
			  talk_state = 0
			  setPlayerStorageValue(cid,9917,1)
			  
			  elseif talk_state == 3 then
			if msgcontains(msg, 'yes') then
			selfSay("Perhaps this wasn\'t a wise decision after all, entrusting a human with important information.")
			  talk_state = 0

end
end
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())