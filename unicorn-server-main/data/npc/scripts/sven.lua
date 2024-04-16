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
	talk_state = 3
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
	value1 = getPlayerStorageValue(cid,4370)
  value2 = getPlayerStorageValue(cid,3075)
  msg = string.lower(msg)
			if msgcontains(msg, 'apples') and value1 == -1 and value2 == 1 then
			   selfSay('Do you have 10 apples for me?')
			talk_state = 1

      elseif talk_state == 1 and msgcontains(msg, 'no') then
				selfSay('Okey. But get me some... please.')
				talk_state = 0
				
				elseif msgcontains(msg, 'apples') and value1 == 1 and value2 == 1 then
				selfSay('I believe I have already given you the note that I asked you to bring to my brother Jacob.')
				talk_state = 0
				
				elseif msgcontains(msg, 'apples') and value1 == -1 and value2 == -1 then
				selfSay('I kinda changed my name. I am used to be without food, and I should keep it that way.')
				talk_state = 0
					
			elseif talk_state == 1 and msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,2674)  >= 10 then
			doPlayerTakeItem(cid,2674,10)
				selfSay('<Yum> Thank you! That was so tasty. Now let’s see, have you come to rescue me?')
				talk_state = 2
			else
				selfSay('Oh no! You don\'t have them.')
			end
			
			elseif talk_state == 2 and
			msgcontains(msg, 'yes') then
			selfSay("That’s very nice of you, but these cells are unopenable. I saw how the knights threw the key away. There’s no chance for me to get out. I have thought about it, and I’m prepared to face death here – there’s no other solution. ...")
			story = 1
			talk_start = os.clock()
			talk_story = os.clock()
			storyMessage[1] = 'But in spite of this, I couldn’t think of leaving Jacob unwitting. I need you to bring him this note. Can you do that for me?'

      elseif talk_state == 2 and msgcontains(msg, 'no') then
				selfSay('Ah. Okey.')
				talk_state = 0

			elseif talk_state == 3 and msgcontains(msg, 'yes') then
			doPlayerAddItem(cid,4857,1)
			setPlayerStorageValue(cid,4370,1)
				selfSay('Thank you, ' .. getPlayerName(cid) .. '! You are very kind.')
				talk_state = 0
				
				elseif talk_state == 3 and msgcontains(msg, 'no') then
				selfSay('That\'s a shame. Truly a shame.')
				talk_state = 0
				
			end
return true
		end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())