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
	if (os.clock() - talk_story) > 2 and story > 0 then
    
        if story == 1 then
    
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
  value2 = getPlayerStorageValue(cid,9912)
  value3 = getPlayerStorageValue(cid,9914)
  msg = string.lower(msg)
  
  local outfitz = getCreatureOutfit(cid)
  if outfitz["lookType"] == 35 and msgcontains(msg,'demon') then
  selfSay('OH MY GOD! A DEMON! DON\'T HURT ME, PLEASE! YOU MAY ENTER MY TREASURE CHAMBER. YES? BUT DON\'T HURT ME? YES?')
  talk_state = 1
  
  elseif talk_state == 1 and msgcontains(msg,'yes') then
  selfSay('SPARE ME. YOU MAY ENTER IT! PLEASE!')
  setPlayerStorageValue(cid,9914,1)
  talk_state = 0
  
  elseif talk_state == 1 and msgcontains(msg,'no') then
  selfSay('OKEY! BUT STILL, DON\'T HURT ME.')
  talk_state = 0
  
  elseif msgcontains(msg,'demon') and (getCreatureOutfit(cid)) ~= 35 then
  selfSay('Admittedtly, I am a little afraid of them.')
end
return true
 end
  
    



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
