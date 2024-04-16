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

	if (os.clock() - talk_story) > 9 and story > 0 then
    
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
	

	value0 = getPlayerStorageValue(cid,9750)
	value1 = getPlayerStorageValue(cid,9751)
	value2 = getPlayerStorageValue(cid,9752)
	msg = string.lower(msg)
	if msgcontains(msg,'mission') and value0 == -1 or 
  msgcontains(msg,'quest') and value0 == -1 then
  selfSay('Ah! Finally, someone who can help me. I urgently need help from an experienced adventurer. Is this person you?')
  talk_state = 1
  
  elseif talk_state == 1 and msgcontains(msg,'no') then
  selfSay('Oh. okay then.')
  talk_state = 0
  
  elseif talk_state == 1 and msgcontains(msg,'yes') then
  selfSay('Great! Now, listen to this: I have heard that an extremely rare plant is blooming in the Trigona Marsh in the north-west. ...')
  story = 1
  talk_start = os.clock()
  talk_story = os.clock()
  storyMessage[1] = 'It\'s said that its seeds can give an irresistible delicious flavour to food. As you might have figured out by now, I want that plant\'s seeds. ...'
  storyMessage[2] = 'So, then I ask you. Will you help me obtain them?' 
  talk_state = 2
  
  elseif talk_state == 2 and msgcontains(msg,'no') then
  selfSay('Oh. okay then.')
  talk_state = 0
  
  elseif talk_state == 2 and msgcontains(msg,'yes') then
  selfSay('Good. Take this botanist\'s container I borrowed from a friend. Come back when you have filled it to the rim with the seeds.')
  setPlayerStorageValue(cid,9750,1)
  setPlayerStorageValue(cid,9751,1)
  doPlayerAddItem(cid,4865,1)
  talk_state = 0
  
  elseif msgcontains(msg,'mission') and value1 == 1 or 
  msgcontains(msg,'seeds') and value1 == 1 or 
  msgcontains(msg,'quest') and value1 == 1 then
  selfSay('Ah! Finally! Have you retrieved the seeds from the rare plant?')
  talk_state = 3
  
  elseif talk_state == 3 and msgcontains(msg,'no') then
  selfSay('You disappoint me. Come back when you have.')
  talk_state = 0
  
  elseif talk_state == 3 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,4866) >= 1 then
  selfSay('Ah! It\'s finally mine! Here, take this to show my appreciation.')
  doPlayerRemoveItem(cid,4866,1)
  doPlayerAddItem(cid,2468,1)
  setPlayerStorageValue(cid,9751,-1)
  setPlayerStorageValue(cid,9752,1)
  talk_state = 0
  else
  selfSay('You don\'t have the seeds.')
  talk_state = 0
  end
  
  elseif msgcontains(msg,'mission') and value2 == 1 or 
  msgcontains(msg,'seeds') and value2 == 1 or 
  msgcontains(msg,'quest') and value2 == 1 then
  selfSay('You have helped me tremendously already.')
  talk_state = 0
  end
  return true
  end
  
function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "snakes") then --you can copy this npc and edit the msg as you want and add the storage of the task. 
	player:setStorageValue(202032,1) -- GrimReaper TaskNpcStorage. from tasks in creaturescripts.
	npcHandler:say("I really hate snakes , i am afraid of them , I added a task for you in the task window.", cid)
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())