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
	
    
	
      elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
	
       elseif story == 4 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
	
	elseif story == 5 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
	
	elseif story == 6 then
    
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
	value1 = getPlayerStorageValue(cid,9903)
  value2 = getPlayerStorageValue(cid,9904)
  value3 = getPlayerStorageValue(cid,9905)
  value4 = getPlayerStorageValue(cid,9906)
  value5 = getPlayerStorageValue(cid,9907)
  value6 = getPlayerStorageValue(cid,9908)
  value7 = getPlayerStorageValue(cid,9909)
  value8 = getPlayerStorageValue(cid,9010)
  value9 = getPlayerStorageValue(cid,9911)
  value10 = getPlayerStorageValue(cid,9912)
  nadvalue = getPlayerStorageValue(cid,9427)
  nadvalue2 = getPlayerStorageValue(cid,9436)
  msg = string.lower(msg)

  if msgcontains(msg, 'crystal ball') and value1 == -1 and value2 == -1 then
  selfSay('Crystal balls are quite interesting. A skilled witch may even foretell her own future using one properly. I do have one in my possesion, but I’m afraid it’s getting a little old. The images I exhort are blur and distorted somehow. ...')
  story = 1
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[1] = 'I would have bought myself a new one from Selena a long time ago, but I’m not sure I’m welcome in witches\' Haven anymore. Perhaps you could go there and buy me one?'
			talk_state = 1

  elseif talk_state == 1 and msgcontains(msg, 'yes') then
    selfSay('Aha! Thank you. I will wait here until you return then. Go to the Haven, it’s located below this swamp, and talk to Selena. And, hm... just don’t mention me, please. You might get into trouble then.')
			setPlayerStorageValue(cid,9903,1)	
			    talk_state = 0
				
	elseif talk_state == 1 and msgcontains(msg, 'no') or
	talk_state == 2 and msgcontains(msg, 'no') or
	talk_state == 3 and msgcontains(msg, 'no') or
	talk_state == 4 and msgcontains(msg, 'no') or
	talk_state == 7 and msgcontains(msg, 'no') or
	talk_state == 6 and msgcontains(msg, 'no') then
	selfSay('Ah, then not.')
	
	elseif nadvalue == 1 and nadvalue2 == -1 and msgcontains(msg,'protectionspell') then
	selfSay('Hihihi... that sounds like an easy spell. Of course I can do it. But not for free. Bring me a crystal ball from the witches\' haven here in Ravenclaw first. Do you have it with you?')
	talk_state = 30
	
	elseif talk_state == 30 and msgcontains(msg,'no') then
	selfSay('I am waiting then.')
	talk_state = 0
	
	elseif talk_state == 30 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2192) >= 1 then
	doPlayerRemoveItem(cid,2192,1)
	setPlayerStorageValue(cid,9436,1)
	selfSay('Thank you. I will do the protectionspell for you guys as soon as I can.')
	talk_state = 0
	else
talk_state = 0
selfSay('Lies, lies.')
end
	
	elseif nadvalue2 == 1 and msgcontains(msg,'protectionspell') then
	selfSay('I will do the protectionspell for you guys as soon as I can.')
					
	elseif value1 == 1 and value2 == -1 and msgcontains(msg, 'crystal ball') then
	selfSay('Have you bought me a crystal ball from Selena as I requested?')
	talk_state = 2
	
	elseif value2 == 1 and msgcontains(msg, 'crystal ball') then
	selfSay('You have given me a crystal ball already. Thank you, again.')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg, 'yes') then
if getPlayerItemCount(cid,2192) >= 1 then
			selfSay('Oh. Very, very nice of you. Now, I will tell you a little secret as a thank. ...')
			setPlayerStorageValue(cid,9904,1)
			doPlayerRemoveItem(cid,2192,1)
			story = 3
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[3] = 'There is actually a way for people who are not witches to foretell ones future. There\'s a not so well known way to circumvent the restrictions. Would you like me to tell you how to do this?'
			talk_state = 3
else
selfSay('You do not have one.')
talk_state = 0
end
    
    elseif talk_state == 3 and msgcontains(msg, 'yes') then
    selfSay('Alright then. The secret is that you must wear a witch outfit. Go obtain a crystal ball and try it. Use the spell \'retes siogi\'')
    playerLearnInstantSpell(cid, 'outfit2')
    setPlayerStorageValue(cid,9905,1)
    talk_state = 0
    
    elseif value4 == 1 and value5 == -1 and msgcontains(msg, 'broom') then
	selfSay('Did you see yourself with a broom in your hand? Strange. I suppose you will need a broom then. And since you have helped me, I will give you one. Any broom won\'t do of course. ...')
    story = 4
    setPlayerStorageValue(cid,9903,1)
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[4] = 'No, I believe you will need this special broom. It\'s actually quite rare, so I will need something in return. Are you fine with this?'
			talk_state = 4

    elseif value4 == -1 and value5 == -1 and msgcontains(msg, 'broom') then
    selfSay('Broom? What are you talking about?')

    elseif value5 == 1 and msgcontains(msg, 'broom') then
    selfSay('We have discussed the issue about your vision. Now go get those butterflies I requested.')
    

    elseif talk_state == 4 and msgcontains(msg, 'yes') then
    selfSay('I need a sample of every known butterfly. These three samples are quite rare, and the only known place where I know they exist is the north-west regions of Dustwit. ...')
    talk_state = 0
    story = 5 
	 		talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[5] = 'I remember something about a minotaur mage, Malakaz, brewing a potion where these butterflies was part of the ingredients. Go and seek him and ask for them.'
			setPlayerStorageValue(cid,9907,1)
			talk_state = 0
			
    elseif value5 == -1 and msgcontains(msg, 'butterfly') then
    selfSay('This doesn\'t make any sense to me I\'m afraid.')

    elseif value6 == -1 and value5 == 1 and msgcontains(msg, 'butterfly') or value6 == -1 and value5 == 1 and msgcontains(msg, 'butterflies') then
	selfSay('Have you obtained the three samples of dead butterflies as I wanted?')
	talk_state = 5
	
    elseif value6 == 1 and msgcontains(msg, 'butterfly') or value6 == 1 and msgcontains(msg, 'butterflies') then
    selfSay('You have given me these butterflies.')
    
    elseif talk_state == 5 and msgcontains(msg, 'no') then
    selfSay('Okay then.')
    talk_state = 0

    
    elseif talk_state == 5 and msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,4992) >= 1 and getPlayerItemCount(cid,4993) >= 1 and getPlayerItemCount(cid,4994) >= 1 then
			selfSay('Thank you alot! I hereby grant you my old broom.')
			setPlayerStorageValue(cid,9908,1)
			doPlayerRemoveItem(cid,4992,1)
			doPlayerRemoveItem(cid,4993,1)
			doPlayerRemoveItem(cid,4994,1)
			doPlayerAddItem(cid,2324,1)
			talk_state = 0
			else
			selfSay('This is lies. You have not got them.')
			talk_state = 0
		end
		
		elseif value6 == 1 and value7 == -1 and msgcontains(msg, 'bridge') then
    selfSay('A broken bridge, you say? That must be the one guarding the old fountain I have read about. This is very, very interesting. ...')
    story = 6 
	 		talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[6] = 'I need to enchant a life crystal which I have in my possession, and I have happened to read that it\'s at that very fountain you do that. Could you travel there and enchant my life crystal?'
			setPlayerStorageValue(cid,9909,1)
			talk_state = 6	
			
			elseif value6 == -1 and msgcontains(msg, 'bridge') then
			selfSay('We can\'t discuss this yet.')
			
			elseif value7 == 1 and value6 == 1 and msgcontains(msg, 'bridge') then
			selfSay('I have told you to go there and enchant my crystal.')
			
			elseif talk_state == 6 and msgcontains(msg, 'yes') then
    selfSay('Great! Now, take this and return to me as soon as you have enchanted it.')
      doPlayerAddItem(cid,4851,1)
      setPlayerStorageValue(cid,9010,1)
      talk_state = 0
      
      elseif value8 == 1 and msgcontains(msg, 'life crystal') then
      selfSay('Have you enchanted the life crystal I gave you?')
      talk_state = 7
      
      elseif talk_state == 7 and msgcontains(msg, 'yes') then
      if getPlayerItemCount(cid,7242) >= 1 then
      selfSay('Thank you! Finally! Now, perhaps, my quest for the Sword of Fury can come to an end. In return, I would like to enchant you with a gift. Will you accept this gift from me?')
      doPlayerRemoveItem(cid,7242,1)
      setPlayerStorageValue(cid,9913,1)
      talk_state = 8
      else
			selfSay('A shame that you are lying to me. Return when you have it instead.')
			talk_state = 0
		end
      
      elseif talk_state == 8 and msgcontains(msg, 'yes') then
      selfSay('Then, here is what I can offer you. This simple enchantment allows you to take on the outfit of a demon for a few seconds. It will demand 120 mana from you, but I can promise you it\'s way more useful than you can imagine. Just ask Selena. Hihihi! The spellwords are \'repeta siogi\'.')
      doSendMagicEffect(getThingPos(cid),12)
      setPlayerStorageValue(cid,9912,1)
      talk_state = 0
      
      elseif talk_state == 8 and msgcontains(msg, 'no') then
      selfSay('Yes or no, I want you to have it. This simple enchantment allows you to take on the outfit of a demon for a few seconds. It will demand 120 mana from you, but I can promise you it\'s way more useful than you can imagine. Just ask Selena. Hihihi! The spellwords are \'repeta siogi\'.')
      doSendMagicEffect(getThingPos(cid),12)      
      playerLearnInstantSpell(cid, 'Outfit1')
      setPlayerStorageValue(cid,9912,1)
      talk_state = 0
      end
      return true
      end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())