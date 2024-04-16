
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
function onThink() npcHandler:onThink()
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
end
-- OTServ event handling functions end
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
	storagevalue1 = getPlayerStorageValue(cid,6001)
                addon = getPlayerStorageValue(cid,10002)

  if msgcontains(msg, 'one') then
      selfSay('Blablabla.')
      talk_state = 1
      
  elseif talk_state > 0 and msgcontains(msg, 'two') then
      selfSay('Slafa ffs.')
      talk_state = 0
      
  else
  selfSay('Nudå?')

end
end



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
