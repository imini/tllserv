
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
function callbackOnThink()
	if (os.clock() - talk_story) > 10 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2

        elseif story == 2 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 0

        elseif story == 3 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
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
            story = 7

        elseif story == 7 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 0

        elseif story == 8 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 9
            elseif story == 9 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 10

        elseif story == 10 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 11

        elseif story == 11 then 
        
            npcHandler:say(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 0
           







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


	local value1 = getPlayerStorageValue(cid,3331)
	local value2 = getPlayerStorageValue(cid,9604)
	local value3 = getPlayerStorageValue(cid,4316)
  local value4 = getPlayerStorageValue(cid,9607)
  local value5 = getPlayerStorageValue(cid,9606)
  local value6 = getPlayerStorageValue(cid,4321)
  msg = string.lower(msg)
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid,9542) == 4 then
	selfSay('So Taa’Feal thinks you are up to do a mission for us? I think he is getting old, entrusting a human scum such as you are with an important mission like that. ...')
	story = 1
	talk_start = os.clock()
	talk_story = os.clock()
	storyMessage[1] = 'Personally, I don’t understand why you haven’t been slaughtered right at the gates. ...'
	storyMessage[2] = 'Anyways. Are you prepared to embark on a dangerous mission for us?'
	talk_state = 1


  elseif msgcontains(msg,'mission') and getPlayerStorageValue(cid,9542) == 6 then
	selfSay('Did you find the tear of Dustwit?')
	talk_state = 5


  elseif talk_state == 1 and msgcontains(msg,'no') then
  selfSay('What are you actually doing here? Spying? I should kill you, I really should.')
  talk_state = 0
  elseif talk_state == 5 and msgcontains(msg,'no') then
  selfSay('Return when you have it then, human.')
  talk_state = 0
  
		elseif talk_state == 1 and msgcontains(msg, 'yes') then
        		selfSay('All right then, human. Have you ever heard of the ‘Tears of Dustwit’? ... They are precious gemstones made of some unknown blue mineral and possess enormous magical power. ...')
			story = 3
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[3] = 'One of them is enough to create thousands of our mighty djinn blades. ...'
			storyMessage[4] = 'Unfortunately, my last gemstone broke and therefor I’m not able to create new blades anymore. ...'
			storyMessage[5] = 'To my knowledge there is only one place where you can these gemstones – I know for a fact that the Efreet have at least one of them. ...'
			storyMessage[6] = 'Well... to cut a long story short, your mission is to sneak into their fortress and to steal it. ...'
			storyMessage[7] = 'Needless to say, the Efreet won’t be too eager to part with it. Try not to get killed until you have delivered the stone to me.'
			setPlayerStorageValue(cid,9542,5)
			
		elseif talk_state == 5 and msgcontains(msg, 'yes') then
		if getPlayerItemCount(cid,2346) >= 1 then
     npcHandler:say('So you actually have made it? You have really managed to steal a Tear of Dustwit? ...')
			story = 8
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[8] = 'Amazing how you humans are just impossible to get rid of. Incidentally, you have this character trait in common with many insects and with other vermin. ...'
			storyMessage[9] = 'Nevermind. I hate to say it, but you have done us a favour, human. That gemstone will serve us well. ...'
			storyMessage[10] = 'Taa’Feal wants you to talk with Falor concerning some new mission. ...'
			storyMessage[11] = 'Looks like you have managed to extend your life expectancy – for just a bit longer.'
			setPlayerStorageValue(cid,9542,7)
			doPlayerRemoveItem(cid,2346,1)
		else

			selfSay('Stop the lying, fool. It won\'t trick me.')
			talk_state = 0
			end
			
elseif getPlayerStorageValue(cid,9542) == -1 and msgcontains(msg,'mission') then
    selfSay('Apparently, Taa\'Feal has some mission for you. Don\'t ask me why he entrust a scum like you a mission.')
elseif getPlayerStorageValue(cid,9542) == 7 and msgcontains(msg,'mission') then
    selfSay('Taa\'Feal told me Falor wanted your help on some other mission.')
elseif getPlayerStorageValue(cid,9542) == 11 and msgcontains(msg,'mission') then
    selfSay('You have apparently fulfilled Falor\'s task, so there is no further missions for you.')
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
