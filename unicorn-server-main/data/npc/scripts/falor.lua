
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
	if (os.clock() - talk_story) > 7 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2

        elseif story == 2 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 0

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
            story = 0

        elseif story == 8 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 9

        elseif story == 9 then 
        
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
            story = 10

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
-- OTServ event handling functions end
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end


	value1 = getPlayerStorageValue(cid,4317)
	value2 = getPlayerStorageValue(cid,4320)
	value4 = getPlayerStorageValue(cid,4318)
  value5 = getPlayerStorageValue(cid,9606)
  value6 = getPlayerStorageValue(cid,9607)
  value7 = getPlayerStorageValue(cid,4321)
  msg = string.lower(msg)
	if msgcontains(msg, 'mission') and getPlayerStorageValue(cid,9541) == 7 then
		selfSay('I guess this is the first time I entrust a human with a mission. And such an important mission, too. But well, we live in hard times, and I am a bit short of adequate staff. ...')
		story = 1
		talk_start = os.clock()
		talk_story = os.clock()
		storyMessage[1] = 'Besides, Taa’Feal told me you have distinguished yourself well in previous missions, so I think you might be the right person for the job. ...'
		storyMessage[2] = 'But think carefully, human, for this mission will bring you close to certain death. Are you prepared to embark on this mission?'
		talk_state = 2


    elseif talk_state == 2 and msgcontains(msg,'no') then
    selfSay('Humans has always been a cowardic race.')
    talk_state = 0
    
		elseif talk_state == 2 and msgcontains(msg, 'yes') then
    selfSay('Well, listen. We are trying to acquire the ultimate weapon to defeat Umar: the Lamp. ...')
		story = 3
		talk_start = os.clock()
		talk_story = os.clock()
		storyMessage[3] = 'At the moment it is still in the possession of that good old friend of mine, the orc, who kindly released me from it. ...'
		storyMessage[4] = 'However, for some reason he is not as friendly as he used to be. You better watch out, human, because I don’t think you will get the lamp without trouble. ...'
		storyMessage[5] = 'Well... to cut a long story short, your mission is to sneak into their Casteldine base and to steal it. ...'
		storyMessage[6] = 'Once you have found the lamp you must enter the Efreets fortress again. Sneak into Umars personal chambers and exchance his sleeping lamp with the other one you acquired from the orc. ...'
		storyMessage[7] = 'If you succeed, the war could be over one night later!'
		setPlayerStorageValue(cid,9541,8)
    
    elseif getPlayerStorageValue(cid,9541) == 8 and msgcontains(msg,'mission') then
    selfSay(msg,'So, have you fulfilled the mission and switched the lamp with Umar\'s sleeping lamp?')
    talk_state = 5
    
    elseif talk_state == 5 and msgcontains(msg,'no') then
    selfSay('Come back to me when you have completed the task allotted to you.')
    talk_state = 0
    
		elseif talk_state == 5 and msgcontains(msg, 'yes') then
		if getPlayerStorageValue(cid,9541) == 10 then
    selfSay('Well well, human. So you really have made it – you have smuggled the modified lamp into Umars bedroom! ...')
			story = 8
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[8] = 'I never thought I would say this to a human, but I must confess I am impressed. ...'
			storyMessage[9] = 'Perhaps I have underestimated you and your kind after all. ...'
			storyMessage[10] = 'I guess I will take this as a lesson to keep in mind when I meet you on the battlefield. ...'
			storyMessage[11] = 'But that’s in the future. For now, I will confine myself to give you the permission to trade with my people whenever you want to.'
			setPlayerStorageValue(cid,4321,1)
			setPlayerStorageValue(cid,9541,11)
			talk_state = 0
      else
      selfSay('I believe you haven\'t.')
      talk_state = 0
      end

elseif getPlayerStorageValue(cid,9541) == -1 and msgcontains(msg,'mission') then
    selfSay('Taa\'Feal wants to speak to you.')
elseif getPlayerStorageValue(cid,9541) == 4 and msgcontains(msg,'mission') then
    selfSay('Alusir wants to talk with you, I suppose.')
elseif getPlayerStorageValue(cid,9541) == 11 and msgcontains(msg,'mission') then
    selfSay('You have fulfilled all our missions, human. You are now allowed to trade wares with my people.')


end
return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
