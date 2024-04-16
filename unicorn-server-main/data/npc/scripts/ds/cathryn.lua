
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
function callbackOnThink(msg)
	if (os.clock() - talk_story) > 8 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
	focus = 0
	elseif story == 2 then
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 0
	talk_state = 0
	focus = 0

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
	storagevalue1 = getPlayerStorageValue(cid,6001)
                addon = getPlayerStorageValue(cid,10002)
msg = string.lower(msg)
	if msgcontains(msg, 'quest') or msgcontains(msg, 'mission') or msgcontains(msg, 'outfit') or msgcontains(msg, 'addon') then
		if storagevalue1 == -1 then
			selfSay('I can see you\'re glancing at my hat. Isn\'t it cute? You want one too?')
			talk_state = 9

		else
			selfSay('Have you obtained the legion helmet and collected the 100 chicken feathers and the 50 honeycombs?')
			talk_state = 15

		end
	elseif talk_state == 15 and msgcontains(msg, 'yes') then  			
            talk_state = 0  
            if getPlayerItemCount(cid,5890) >= 100 and   

		getPlayerItemCount(cid,5902) >= 50 and getPlayerItemCount(cid,2480) >= 1 then  
  
                if addon == -1 then  
                    if doPlayerTakeItem(cid,5890,100) == 0 and   

			doPlayerTakeItem(cid,5902,50) == 0 and doPlayerTakeItem(cid,2480,1) == 0 then  
                        selfSay('Wonderful! That must\'ve taken you quite a while. Okey, so, this is how you do... you put it like this... then a little glue... here!')  
                        doPlayerAddOutfit(cid, 128, 2)  
                        doPlayerAddOutfit(cid, 136, 2)  
                        setPlayerStorageValue(cid,10002,1)  
                    end  
                else  
                    selfSay('You already have this addon.')  
                end  
            else  
                selfSay('You dont have all those items yet. Come back when you do.')  
            end  
				elseif talk_state == 15 and msgcontains(msg, 'no') then
				selfSay('So why u came here?')
				talk_state = 0
	elseif talk_state == 9 and msgcontains(msg, 'yes') then
        			selfSay('Tihi... well, not for free of course. I demand a few favours in return, and of course the material for the hat. Do you agree with that?')
				talk_state = 10

				elseif talk_state == 9 and msgcontains(msg, 'no') then
				selfSay('Oh, I see.')
				talk_state = 0

		elseif talk_state == 10 and msgcontains(msg, 'yes') then
        			selfSay('First of all we could use a basic hat... I guess a legion helmet will do perfectly fine. Thereafter, 100 chicken feathers... and 50 honecombs as glue. That\'s it, return when you have it.')
				setPlayerStorageValue(cid,6001,1)
				talk_state = 0

				elseif talk_state == 10 and msgcontains(msg, 'no') then
				selfSay('Okey then, but don\'t hesitate to ask for one later.')
				talk_state = 0


	elseif msgcontains(msg, 'coalition') or msgcontains(msg, 'unified') or msgcontains(msg, 'unified coalition') then
			selfSay('I found this place by a rather peculiar occasion. I was backpacking a few years ago and stumbled into this place, where, tired as I was, I got some food and sleep. ...')

				story = 2
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[2] = 'I found myself in love with this place, so I decided to stay and it didn\'t take long before kind Roy gave me this job.'






end
return true
end




npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
