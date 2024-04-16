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
	value1 = getPlayerStorageValue(cid,4370)

  freyavalue = getPlayerStorageValue(cid,9724)
  lettervalue = getPlayerStorageValue(cid,9728)
  bizrevalue1 = getPlayerStorageValue(cid,9759)
  bizrevalue2 = getPlayerStorageValue(cid,9760)
  bizrevalue3 = getPlayerStorageValue(cid,9761)
  msg = string.lower(msg)
  
if msgcontains(msg,'letter') and freyavalue == 1 and lettervalue == -1 then
  selfSay('What!? A letter to me...? I don\'t expect any letters. Here, let me take a look at it. ...')
  		story = 2
				talk_start = os.clock()
				talk_story = os.clock()
				storyMessage[2] = 'Well, this letter is not to me. It\'s to Minto\'Dracir from Ravenclaw. Honestly, I am just the kind of person who would steal a letter and read it, but Minto\'Dracir is actually a very nice minotaur. ...'
      storyMessage[3] = 'I think you should go back to whoever gave you this letter and ask him if he\'s really sure about its destination.'
setPlayerStorageValue(cid,9724,-1)
setPlayerStorageValue(cid,9728,1)
    
    elseif msgcontains(msg,'mirol') and bizrevalue1 == 1 and bizrevalue2 == -1 and bizrevalue3 == -1 then
    selfSay('I know where he is, yes, but why should I tell you? I don\'t earn anything on this affair. But if you give me 500 gold coins, I will.')
    setPlayerStorageValue(cid,9760,1)
    
    elseif msgcontains(msg,'mirol') and bizrevalue1 == 1 and bizrevalue2 == 1 and bizrevalue3 == -1 then
    if getPlayerItemCount(cid,2148) >= 500 or getPlayerItemCount(cid,2152) >= 5 or getPlayerItemCount(cid,2160) >= 1 then
    selfSay('Thanks. If you go directly west from this room, you\'ll eventually find a grave. If you then proceed two floors directly down from that room, you\'ll find him.')
    setPlayerStorageValue(cid,9761,1)
    doPlayerRemoveMoney(cid,500)
    talk_state = 0
    else
    talk_state = 0
    selfSay('You don\'t have anough money, fool.')
    end
    
    elseif msgcontains(msg,'mirol') and bizrevalue1 == 1 and bizrevalue2 == 1 and bizrevalue3 == 1 then
    selfSay('If you go directly west from this room, you\'ll eventually find a grave. If you then proceed two floors directly down from that room, you\'ll find him.')


	elseif msgcontains(msg, 'humour') and value1 == -1 then
			selfSay('I have a certain inclination towards humour. Do you know any jokes?')
			talk_state = 1
		
		elseif msgcontains(msg, 'humour') and value1 == 1 then
    selfSay('You have humour, human.')

		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then
			   npcHandler:say('A human who knows jokes? Yeah, right... I’ll tell you a real joke, little filth. Once there was 2 little small minotaurs. They were both... oh, you knew that one already? ...')
				story = 1
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[1] = 'Well, here’s another one. What did the minotaurs say to the human when they had killed him? Well? You don’t know?'
			talk_state = 2
		elseif talk_state == 1 then
			if msgcontains(msg, 'no') then
    selfSay('Hahaha! I knew it!')
    end
    
			end
			elseif talk_state == 2 and msgcontains(msg, 'no') then
				selfSay('Nothing! HE WAS DEAD! Get it? HAHAHAHA! You have a certain feeling for humour after all. Perhaps I could do you a favour.')
				setPlayerStorageValue(cid,4370,1)
				talk_state = 0


		elseif msgcontains(msg, 'favour') then	
		if value1 == -1 then
			selfSay('I do not favours for humans, dirty creep.')
			talk_state = 0
		else
		selfSay('Maybe, I could give you a nice offer... but that is just because you’ve got a sense of humour. Well, what do you say, interested?')
		talk_state = 3
		end
		elseif talk_state == 3 then
			if msgcontains(msg, 'yes') then
			selfSay("Fine... well then, for 500 coins I can give you one of these excellent sticks. They’re very magical! Want to buy it?")
			  talk_state = 4
	end
		elseif talk_state == 4 then
			if msgcontains(msg, 'yes') then
			if doPlayerBuyItem(cid,2184,1,500) == 1 then
			selfSay("Here you go, then.")
			  talk_state = 0
			  

			else
				selfSay('You don\'t have enough money.')
			talk_state = 0
		end
		elseif talk_state == 4 then
			if msgcontains(msg, 'no') then
			selfSay("Pathetic mortal.")
			end
end


  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
