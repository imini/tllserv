local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local QUEST = 1
local storyMessage = {}
local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 3 and story > 0 then
    
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
  story = 4
	elseif story == 4 then
    
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

 value0 = getPlayerStorageValue(cid,2000)
 value1 = getPlayerStorageValue(cid,2001)
 value2 = getPlayerStorageValue(cid,2002)
 value3 = getPlayerStorageValue(cid,2003)
 value4 = getPlayerStorageValue(cid,2004)
 value5 = getPlayerStorageValue(cid,2005)
 value6 = getPlayerStorageValue(cid,2006)
 msg = string.lower(msg)
 
-- Briefing 
 
 
 if msgcontains(msg,'member') and value0 == -1 then
 npcHandler:say('Do you mean you would like to become a applicant member?')
 talk_state = 1
 
 elseif talk_state == 1 and msgcontains(msg,'no') then
 npcHandler:say('Because a you can\'t become a member without becoming an applicant member of the first grade, first.')
 talk_state = 0
 
 elseif talk_state == 1 and msgcontains(msg,'yes') then
 npcHandler:say('So, you would like to become an applicant member of the first grade for the Celerian Academy?')
 talk_state = 2
	
 elseif talk_state == 2 and msgcontains(msg,'no') then
 npcHandler:say('Because a you can\'t become a member without becoming an applicant member of the first grade, first.')
 talk_state = 0
 
 elseif talk_state == 2 and msgcontains(msg,'yes') then
 npcHandler:say('Terrific. Then I grant you the title of applicant member of the first grade. Whenever you want, we can proceed in order to promote you to member of the first grade.')
 setPlayerStorageValue(cid,2000,1)
 setPlayerStorageValue(cid,2001,1)
 talk_state = 0	
 
 elseif value1 == 1 and msgcontains(msg,'member') or
 value1 == 1 and msgcontains(msg,'promote') then
 npcHandler:say('To rise in rank and become a real member you will have to go through three steps. These there steps are a test of knowledge, a test of stamina and finally a briefing of the rules. Would you like to continue with these?')
 talk_state = 3
 
 elseif talk_state == 3 and msgcontains(msg,'no') then
 npcHandler:say('Return later, if it is so that you feel like doing it then.')
 talk_state = 0
 
 elseif talk_state == 3 and msgcontains(msg,'yes') then
 npcHandler:say('Brilliant! First, I suggest you to go to the nearby Illuminatis library to study a little, if you want to pass the test of knowledge. I hereby grant you access to that library. When you feel ready, return and ask me for the test.')
 setPlayerStorageValue(cid,2001,-1)
 setPlayerStorageValue(cid,2002,1)
 talk_state = 0
 
 elseif value2 == 1 and msgcontains(msg,'member') or
 value2 == 1 and msgcontains(msg,'promote') then
 npcHandler:say('You are still an applicant member of the first grade until you pass the tests.')
 talk_state = 0
 
 elseif value2 == 1 and msgcontains(msg,'test') then
 npcHandler:say('Ah, so you feel prepared to do the test of knowledge?')
 talk_state = 4
 
 elseif talk_state == 4 and msgcontains(msg,'yes') then
 npcHandler:say('Okey. But first, before we begin, I must ask you for the members fee of 250 gold coins. Are you willing to pay that?')
 talk_state = 5
	
 elseif talk_state == 4 and msgcontains(msg,'no') then
 npcHandler:say('Very well, we have all time in the world.')
 talk_state = 0
 
 
-- Test I  
 
 
 elseif talk_state == 5 and msgcontains(msg,'yes') then
 if getPlayerItemCount(cid,2148) >= 250 or
 getPlayerItemCount(cid,2152) >= 3 or
 getPlayerItemCount(cid,2160) >= 1 then
 doPlayerRemoveMoney(cid,250)
 selfSay('Excellent. I will very soon begin, but I must first warn you. If you happen to answer incorrect in some way, you will have to reedo the test. Please understand that this is to prevent uncultivated people from applying to our Academy. ...')
 story = 1
 talk_start = os.clock()
 talk_story = os.clock()
 storyMessage[1] = 'So. The first question: what is the name of the Celerian Academys current leader?'
 talk_state = 6
 else
 npcHandler:say('You have not brought enough money.')
 talk_state = 0
 end
 
 elseif talk_state == 6 then
 if msgcontains(msg,'stallion') then
 npcHandler:say('The first question answered perfectly well. But do you know the second? What was the name of the person who founded the Celerian Academy?')
 talk_state = 7
 else
 npcHandler:say('I\'m afraid that is wrong. Please return later when you have refreshed your memory.')
 talk_state = 0
 end
 
 elseif talk_state == 7 then
 if msgcontains(msg,'celero') then
 npcHandler:say('Also correct. But during what war was the Academy on the brink of disbanding?')
 talk_state = 8
 else
 npcHandler:say('I\'m afraid that is wrong. Please return later when you have refreshed your memory.')
 talk_state = 0
 end
 
 elseif talk_state == 8 then
 if msgcontains(msg,'the war of paschendale') then
 npcHandler:say('Terrific, ' .. getPlayerName(cid) .. '. Now, what is the name of the highest rank possible, except for Stallions?')
 talk_state = 9
 else
 npcHandler:say('I\'m afraid that is wrong. Please return later when you have refreshed your memory.')
 talk_state = 0
 end
 
 elseif talk_state == 9 then
 if msgcontains(msg,'the war of paschendale') then
 npcHandler:say('Indeed, you exceed my expectations. You have soon completed the test. There\'s two questions left. Who led the revolt against king Celero II and the Academy?')
 talk_state = 10
 else
 npcHandler:say('I\'m afraid that is wrong. Please return later when you have refreshed your memory.')
 talk_state = 0
 end
 
 elseif talk_state == 10 then
 if msgcontains(msg,'jeremy') then
 npcHandler:say('That is indeed correct. Now, the last question: what is the Celerian Academys motto?')
 talk_state = 11
 else
 npcHandler:say('I\'m afraid that is wrong. Please return later when you have refreshed your memory.')
 talk_state = 0
 end
 
 elseif talk_state == 11 then
 if msgcontains(msg,'spes et veritas') then
 npcHandler:say('I couldn\'t have answered it better myself. Congratulations, my dear ' .. getPlayerName(cid) .. ', you have successfully completed the first test. Now when you feel like continuing, ask me for another one.')
 talk_state = 0
 setPlayerStorageValue(cid,2002,-1)
 setPlayerStorageValue(cid,2003,1)
 else
 npcHandler:say('I\'m afraid that is wrong. Please return later when you have refreshed your memory.')
 talk_state = 0
 end
 
 elseif talk_state == 5 and msgcontains(msg,'no') then
 npcHandler:say('Fine. But without money you won\'t be able to live up to the expectations here.')
 talk_state = 0  
       
            
-- Test II            

	
 elseif value3 == 1 and msgcontains(msg,'test') then
 npcHandler:say('Well, you have completed the first test. This was to put your knowledge to test. Now, we are going to see if you can live up to another ideal personality which the members of the Celerian Academy is presumed to have.. ...')
 story = 2
 talk_start = os.clock()
 talk_story = os.clock()
 storyMessage[2] = 'It recently came to the knowledge of the Academy that an ancient prophecy has unearthed itself in a cavity in the Vast Lands. If this prophecy contains the information we suspect it will, it will be of great value to us. ...'
 storyMessage[3] = 'Your mission and second task will be to seek this prophecy and bring it back to us. This will meanwhile show that you are not afraid to take on a challenge, and that you will be reliable in future missions and tasks. ...'
 storyMessage[4] = 'So, have you understood everything properly, and are you willing to continue with this mission?'
 talk_state = 12
 
 elseif talk_state == 12 and msgcontains(msg,'no') then
 npcHandler:say('Very sad to hear. You are barely living up to the expectations.')
 talk_state = 0
 
 elseif talk_state == 12 and msgcontains(msg,'yes') then
 npcHandler:say('Good. Then go to the Vast Lands in the west and seek this ancient prophecy, but be as quick as you can. Time is valuable.')
 setPlayerStorageValue(cid,2003,-1)
 setPlayerStorageValue(cid,2004,1)
 talk_state = 0
 
 elseif value4 == 1 and msgcontains(msg,'task') or
 value4 == 1 and msgcontains(msg,'prophecy') or
 value4 == 1 and msgcontains(msg,'mission') then
 npcHandler:say('Is it true that you have found the prophecy?')
 talk_state = 13
 
 elseif talk_state == 13 and msgcontains(msg,'no') then
 npcHandler:say('Come back when you have found it, please.')
 talk_state = 0
 
 elseif talk_state == 13 and msgcontains(msg,'yes') then
 if getPlayerItemCount(cid,xxxx) >= 1 then
 npcHandler:say('Amazing. It\'s really the one! Well, this has to be rewarded. You are on the brink of becoming a member of the first grade, dear ' .. getPlayerName(cid) .. '. Now, everything that is left is the little briefing of rules, but I suppose it won\'t be troublesome.')
 setPlayerStorageValue(cid,2004,-1)
 setPlayerStorageValue(cid,2005,1)
 talk_state = 0
 
 elseif value5 == 1 and msgcontains(msg,'briefing') or
 value5 == 1 and msgcontains(msg,'rule') or
 value5 == 1 and msgcontains(msg,'promote') or
 value5 == 1 and msgcontains(msg,'member') then
 npcHandler:say('You are soon a member of the Celerian Academy, ' .. getPlayerName(cid) .. '.')
 talk_state = 0
 
	
function sayMessage(cid, message, keywords, parameters)     return npcHandler:defaultMessageHandler(cid, message, keywords, parameters) end

function greet(cid, message, keywords, parameters)
	value1 = getPlayerStorageValue(cid,2000)
	if value1 == -1 then
        selfSay('We seldom have visitors. What do you want?')
        npcHandler.focus = cid
        npcHandler.talkStart = os.clock()
	else
        selfSay('Welcome back, ' .. getPlayerName(cid) .. '.')
        npcHandler.focus = cid
        npcHandler.talkStart = os.clock()
    end
    
    return true
end


function farewell(cid, message, keywords, parameters)    
return 
npcHandler:onFarewell(cid, message, keywords, parameters)
end
-- Keyword handling functions end

keywordHandler:addKeyword({'hi'}, greet, nil)
keywordHandler:addKeyword({'hello'}, greet, nil)
keywordHandler:addKeyword({'hey'}, greet, nil)
keywordHandler:addKeyword({'bye'}, farewell, nil)
keywordHandler:addKeyword({'farewell'}, farewell, nil)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
