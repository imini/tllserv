 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 focus = 0
 focus2 = 0
 talk_start = 0
 target = 0
 following = false
 attacking = false
 talk_state = 0
gname = 0
local msg = ''
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end

function callbackOnThink()
if (os.clock() - talk_story) > 5 and story > 0 then
    
  if story == 1 then   
  npcHandler:say(storyMessage[story])
  talk_start = os.clock()
  talk_story = os.clock()
	story = 2
	
	elseif story == 2 then   
  npcHandler:say(storyMessage[story])
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
 	cname = getPlayerName(cid)

		if msgcontains(msg, 'wedding') or msgcontains(msg, 'marriage') then
 		selfSay('Who would you like to wed?')
 		talk_state = 22
 		talk_start = os.clock()

 		    local msg = ''

            elseif talk_state == 22 and (msg ~= 'stop') then
		gname = msg
		selfSay('So do you want take ' .. gname .. '! as your wife?')
		talk_state = 1
		focus = gname

	elseif focus == gname and talk_state == 1 then
		elseif msgcontains(msg, 'yes') or msgcontains(msg, 'yeah') then
		selfSay('Lets begin this ceremony. Dearly beloved we come here today the witness the marage of  ' .. cname .. '! and ' .. gname .. '! ... ')
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'Into this holy union ' .. cname .. ' and ' .. msg .. ' Now come to be joined.'
			storyMessage[2] = 'Do you, ' .. getPlayerName(cid) .. ' wish to marry ' .. gname .. ' in holy matromony till deletion do you part?'



 	elseif focus == cid and talk_state == 3 then
		elseif msgcontains(msg, 'yes') or msgcontains(msg, 'yeah') then
		selfSay('And do you, ' .. gname .. ' wish to marry ' .. getPlayerName(cid) .. ' in holy matromony til deletion do you part?')
		talk_state = 4

		doPlayerAddItem(cid,2121,1)
		doSetItemSpecialDescription(uid,'A token of your love for ' .. gname .. '!')
		doPlayerAddItem(gname,2121,1)
		doSetItemSpecialDescription(uid,'A token of your love for ' .. cname .. '!')
		focus = gname

	elseif focus == gname and talk_state == 4 then
		elseif msgcontains(msg, 'yes') or msgcontains(msg, 'yeah') then
		selfSay('I proudly declare you husband and wife. Here are your rings and you may kiss the bride.')

		doPlayerAddItem(cid,2121,1)
		doSetItemSpecialDescription(uid,'A token of your love for ' .. gname .. '!')
		doPlayerAddItem(gname,2121,1)
		doSetItemSpecialDescription(uid,'A token of your love for ' .. cname .. '!')
		talk_state = 0
		focus = 0
end
end
end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
