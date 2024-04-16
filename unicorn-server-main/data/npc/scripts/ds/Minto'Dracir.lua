local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()

    end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	msg = string.lower(msg)
	value1 = getPlayerStorageValue(cid,4347)
  value2 = getPlayerStorageValue(cid,9848)
  value3 = getPlayerStorageValue(cid,4348)
  lolvalue1 = getPlayerStorageValue(cid,9729)
	lolvalue2 = getPlayerStorageValue(cid,9725)
	value10 = getPlayerStorageValue(cid,4619)
				value11 = getPlayerStorageValue(cid,9622)
        if msgcontains(msg,'math') and value10 == 1 and value11 == -1 then
        selfSay('My surreal numbers are based on astonishing facts. Are you interested in learning the secret of mathemagics?')
        talk_state = 15
        
        elseif talk_state == 15 and msgcontains(msg,'no') then
        selfSay('Are you trying to be funny? If so, you are drastically failing.')
        talk_state = 0

	elseif msgcontains(msg,'celix cipher') then
        selfSay('That is truly an interesting thing to have come from a human boy. I wish more people were concerned of its true secrets, and passions!')
        talk_state = 44

	elseif talk_state == 44 and msgcontains(msg,'passion') then
        selfSay('Oh, yes, it is a passion, human! Deciphering a real cipher is very exciting. I assure you, it is like magic!')
        talk_state = 45

	elseif talk_state == 45 and msgcontains(msg,'decipher') then
        selfSay('I can teach you how to decipher the Celix Cipher if you want. Do you want? Really?')
        talk_state = 46

	elseif talk_state == 46 and msgcontains(msg,'no') then
        selfSay('Oh, but I thought... never mind, filthy human.')
        talk_state = 0

	elseif talk_state == 46 and msgcontains(msg,'yes') then
        selfSay('Good! The Celix Cipher shows rows containing three different numbers listed beside each other. These three numbers indicates a certain page number or book edition, the word in this book and then the letter in this word. More?')
        talk_state = 47

	elseif talk_state == 47 and msgcontains(msg,'no') then
        selfSay('You have heard enough anyway.')
        talk_state = 0
	
	elseif talk_state == 47 and msgcontains(msg,'yes') then
        selfSay('The Celix Cipher often refers to a randomly picked book, or in the worst cases an entire library. Decoding this cipher is not done quickly.')
        talk_state = 0


        elseif talk_state == 15 and msgcontains(msg,'yes') then
        selfSay('But first tell me your favourite colour please!')
        talk_state = 16
        
        elseif talk_state == 16 then
        if msgcontains(msg,'orange') then
        selfSay('Very interesting. So are you ready to proceed in you lesson in mathemagics?')
        talk_state = 17
        else
        selfSay('No, that\'s not your favourite colour.')
        talk_state = 0
        end
        
        elseif talk_state == 17 and msgcontains(msg,'no') then
        selfSay('Are you trying to be funny? If so, you are drastically failing.')
        talk_state = 0

        elseif talk_state == 17 and msgcontains(msg,'yes') then
        selfSay('So know that everthing is based on the simple fact that 1 + 1 = 46!')
        setPlayerStorageValue(cid,9622,1)
        talk_state = 16
        
        elseif value11 == 1 and msgcontains(msg,'math') then
        selfSay('Everthing is based on the simple fact that 1 + 1 = 46!')
        talk_state = 0
	
		elseif msgcontains(msg,'letter') and lolvalue2 == 1 then
		selfSay('Ah, you have the letter from my ol\' mama minotaur?')
		talk_state = 7
		
		elseif talk_state == 7 and msgcontains(msg,'no') then
    selfSay('Okay.')
		talk_state = 0
	
    elseif talk_state == 7 and msgcontains(msg,'yes') then
    if getPlayerItemCount(cid,2333) >= 1 then
    doPlayerRemoveItem(cid,2333,1)
   setPlayerStorageValue(cid,9729,1)
	setPlayerStorageValue(cid,9725,-1)
    npcHandler:say('Thank you.')
		talk_state = 0
		else
selfSay('Looks to me like you don\'t have it at least.')
talk_state = 0
		end
		elseif lolvalue1 == 1 and msgcontains(msg,'letter') then
		selfSay('You have already given me the letter.')
		
	elseif msgcontains(msg, 'prove') or msgcontains(msg, 'worthy') then
			selfSay('Do you want to prove yourself worthy to me, little worm? Then bow before me! And also, you could pay a tribute to Tuthin... you can find his grave somewhere in the excavations above us. Then return here, and remember to look humble and adress me as if I were your king.')
			setPlayerStorageValue(cid,4347,1)
			talk_state = 0

    elseif msgcontains(msg, 'tuthin') and value1 == 1 and value2 == -1 then
	   npcHandler:say('Have you paid your tribute to the great Tuthin?')
					talk_state = 2
			  
			  elseif msgcontains(msg, 'tribute') or msgcontains(msg, 'tuthin') and value1 == -1 and value2 == -1 then
			  selfSay('You are not even worthy to pay a tribute to Tuthin, human-worm.')
			  
        elseif msgcontains(msg, 'tribute') or msgcontains(msg, 'tuthin') and value2 == 1 then
			  selfSay('You have paid your tribute to Tuthin. I allow you to enter his chamber.')
					
			elseif talk_state == 2 and msgcontains(msg, 'yes') and value3 == 1 then
				selfSay('That’s good. Now kiss my feet a couple of times... and brush the dust from my cape... and then you could polish my wand – but for now, I will allow you to enter the chamber.')
				setPlayerStorageValue(cid,9848,1)
				talk_state = 0
								
				elseif talk_state == 2 and msgcontains(msg, 'yes') and value3 == -1 then
				selfSay("No, you have not. Be aware so that I don\'t unleash my unspeakable powers upon you.")
				talk_state = 0
				
				elseif talk_state == 2 and msgcontains(msg, 'no') then
				selfSay("Right. Then go ahead and do so, maggot-human.")
				talk_state = 0
				
				
		
	
		end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
