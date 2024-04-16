local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local storyMessage = {}
local story = 0
local talk_story = 0
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 		npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 					npcHandler:onThink() end
function callbackOnThink()
	if (os.clock() - talk_story) > 12 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 2
	
      elseif story == 2 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 3
	
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
	value1 = getPlayerStorageValue(cid,9918)
	msg = string.lower(msg)
	
	if value1 == 1 and msgcontains(msg, 'cowl') then
	selfSay('Are you talking about this cowl which I am supposed to have in my possession?')
	talk_state = 1
	
	elseif value1 == -1 and msgcontains(msg, 'cowl') then
	selfSay('Huh? You are babbling...')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg, 'no') then
	selfSay('Phew. I was a little worried for a second or two.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg, 'yes') then
	selfSay('I remember that cowl. I will tell you how I obtained it. It\'s a quite interesting story, actually. ...')
	story = 1
				talk_start = os.clock()
				talk_story = os.clock()
			storyMessage[1] = 'Well, I met this elf guy by the name of Penim, just outside Celeres. He literally bumped into me when he saw me and threw me this strange cowl which you mentioned. ...'
			storyMessage[2] = 'He mumbled something about that he didn\'t need dark artifacts like this where he was going. And before I had the chance to even speak, he walked away. ...'
			storyMessage[3] = 'Obviously, I was quite stunned. As I had no other option, I kept the cowl. ...'
			storyMessage[4] = 'However, a time later, I began to wonder what the elf had meant with a dark artifact... I mean, I have heard about them and apparently they are no good for anyone. ...'
			storyMessage[5] = 'So, when I was at the horn of the dilemma, this hooded guy confronted me at the inn. He gave me a high price for the cowl, and seeing as I wasn\'t sure whether I wanted it or not, I sold it instantly. ...'
			storyMessage[6] = 'Good thing that, I suppose. I am glad I never put it on though, god knows what could have happened to me. ...'
			storyMessage[7] = 'By the way, you should talk to Stefan about this. He is into the subject of dark magic and stuff.'
			setPlayerStorageValue(cid,9919,1)
			talk_state = 0

  end
  return true
  end
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
