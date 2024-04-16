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
	talk_state = 3
	story = 0

         elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	talk_state = 0
	story = 0

         elseif story == 3 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	talk_state = 0
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

 value1 = getPlayerStorageValue(cid,9542)
			value2 = getPlayerStorageValue(cid,4002)
			value5 = getPlayerStorageValue(cid,9606)
      value6 = getPlayerStorageValue(cid,9607)
      value7 = getPlayerStorageValue(cid,4321)
value8 = getPlayerStorageValue(cid,4301)
ninjavalue1 = getPlayerStorageValue(cid,9635)
ninjavalue2 = getPlayerStorageValue(cid,9636)
msg = string.lower(msg)
 
 if getPlayerStorageValue(cid,9541) <= 0 and msgcontains(msg,'mission') then
    selfSay('Ask Taa\'Feal. He\'ll have something for you.')
    elseif getPlayerStorageValue(cid,9541) == 4 and msgcontains(msg,'mission') then
    selfSay('I heard Alusir craved for your help.')
    elseif getPlayerStorageValue(cid,9541) == 7 and msgcontains(msg,'mission') then
    selfSay('Falor sent for you.')
    elseif getPlayerStorageValue(cid,9541) == 11 and msgcontains(msg,'mission') then
    selfSay('You have fulfilled all tasks given to you. Trading with our people is now okey.')
    
      elseif ninjavalue1 == 1 and ninjavalue2 == -1 and msgcontains(msg,'negotiate') or
      ninjavalue1 == 1 and ninjavalue2 == -1 and msgcontains(msg,'negotiate') then
      selfSay('Ah, so the ninjas would like to form a pact. This, I believe, is not a very bad offer. I suppose they have a plan to defeat the marid. Do they?')
      talk_state = 20 
      
      elseif ninjavalue2 == 1 and msgcontains(msg,'negotiate') or
      ninjavalue1 == 1 and ninjavalue2 == -1 and msgcontains(msg,'negotiate') then
      selfSay('We have formed a pact with the ninjas, already, don\'t you remember?')
      talk_state = 20 
      
      elseif talk_state == 20 and msgcontains(msg, 'yes') then
			selfSay('That\'s what I thought. Go back to them and tell me they have our support. At least until we have defeated our common enemy...')
			setPlayerStorageValue(cid,9635,-1)
			setPlayerStorageValue(cid,9636,1)
			talk_state = 0
			
			elseif talk_state == 20 and msgcontains(msg, 'no') then
			selfSay('Then why should we form a pact?')
			talk_state = 0
      
			elseif msgcontains(msg, 'passage') and value2 == -1 and value8 == -1 and value1 == -1 then
			selfSay('Blue djinns, marids and worms like you should either leave this fortress or something bad will happen. Am I right?')
			talk_state = 1
			
			elseif msgcontains(msg, 'passage') and value1 == 1 then
			selfSay('I have allowed you to enter, already.')

      elseif msgcontains(msg,'passage') and value8 == 1 and value2 == -1 then
  selfSay('GET OUT OF HERE HUMAN SCUM!!')
  
			elseif talk_state == 1 and msgcontains(msg, 'yes') then
			selfSay('So, what are you waiting for! BUUH!')
			talk_state = 0

			elseif talk_state == 1 and msgcontains(msg, 'no') then
			selfSay("Of cou... what? Huh!? No... I can\'t believe this! ...")
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'You have got some nerves human. Perhaps we could have use for you. Would you like to help us?'

elseif talk_state == 4 and msgcontains(msg, 'no') then
				selfSay('Then I see no other use of you than filling up space in the earth.')
				talk_state = 0
				elseif talk_state == 3 and msgcontains(msg, 'no') then
				selfSay('Then I see no other use of you than filling up space in the earth.')
				talk_state = 0
			elseif talk_state == 3 and msgcontains(msg, 'yes') then
				selfSay('So you pledge loyalty to Falor and will never ever set foot on the lands of the blue djinns... unless you want to slay them, of course?')
				talk_state = 4

		
			elseif talk_state == 4 and
			msgcontains(msg, 'yes') then
			selfSay("Well then, welcome little worm. I won\'t kill you... yet. ...")
			story = 2
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[2] = 'But don\'t touch anything.'
				setPlayerStorageValue(cid,9542,1)
				
			
				end
return true
			end
	
function sayMessage(cid, message, keywords, parameters)     return npcHandler:defaultMessageHandler(cid, message, keywords, parameters) end

function greet(cid, message, keywords, parameters)
	value1 = getPlayerStorageValue(cid,9542)
	if value1 == -1 then
        selfSay('I’m already considering whether I should kill you or not. But well, let go for it. What do you want,  ' .. getPlayerName(cid) .. '?')
        npcHandler.focus = cid
        npcHandler.talkStart = os.clock()
	else
        selfSay('Welcome back worm-human.')
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