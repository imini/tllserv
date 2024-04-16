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
	value1 = getPlayerStorageValue(cid,9508)
	value2 = getPlayerStorageValue(cid,9509)

  value20 = getPlayerStorageValue(cid,4329)
  value21 = getPlayerStorageValue(cid,4330)
  msg = string.lower(msg)
  if msgcontains(msg,'flask') and value1 == 1 or
  msgcontains(msg,'bottle') and value1 == 1 or
  msgcontains(msg,'potion') and value1 == 1 then
  selfSay('Have you brought me a potion from dear old David.... hrm, fisherman?')
  talk_state = 53
  
  elseif talk_state == 53 and msgcontains(msg,'no') then
  selfSay('Oh, very well.')
  talk_state = 0
  
  elseif talk_state == 53 and msgcontains(msg,'yes') then
  if getPlayerItemCount(cid,6106) >= 1 then
  doPlayerRemoveItem(cid,6106,1)
  doPlayerAddItem(cid,6108,1)
  setPlayerStorageValue(cid,9508,-1)
  setPlayerStorageValue(cid,9509,1)
  selfSay('Ah, thank you! This potion will certainly serve me well. I want you to bring this little cook book I had in my book case to him. He\'ll like it.')
  talk_state = 0
  else
  selfSay('No, that\'s not true. You have not go it.')
  talk_state = 0
  end
  
  elseif msgcontains(msg,'mission') and value2 == 1 or
  msgcontains(msg,'bottle') and value2 == 1 or
  msgcontains(msg,'cook') and value2 == 1 or
  msgcontains(msg,'book') and value2 == 1 or
  msgcontains(msg,'potion') and value2 == 1 then
  selfSay('Go to Da... fisherman, I mean, and give him the cook book, please.')
  
  elseif value20 == 1 and msgcontains(msg,'cottage') then
selfSay('Ah yes, I remember my grandfather talking about that name. This house used to be an inn a long time ago. My family bought it from some of these flower guys.')
talk_state = 21

elseif talk_state == 21 and msgcontains(msg,'flower guy') then
selfSay('Oh, I mean druids of course. They sold the cottage to my family after some of them died in an accident or something like that.')
talk_state = 22

elseif talk_state == 22 and msgcontains(msg,'accident') then
selfSay('As far as I can remember the story, a pet escaped its stable behind the inn. It got somehow involved with powerful magic at a ritual at some nearby tower and was transformed in some way.')
talk_state = 23

elseif talk_state == 23 and msgcontains(msg,'stable') then
selfSay('My grandpa told me, in the old days there were some behind this cottage. Nothing big though, just small ones, for chicken or rabbits. However... now when you say it, I think I remember how I found a document a few years ago. I believed it was connected to the stories I had been told.')
talk_state = 24

elseif talk_state == 24 and msgcontains(msg,'document') then
selfSay('I can’t really say I understood its contents, but perhaps it makes sense to you. I remember it as it was yesterday now.')
talk_state = 25

elseif talk_state == 25 and msgcontains(msg,'content') then
selfSay('It read somewhat as following: “The pathetic animal ran past me, dressed in an orange suite. I thought it was a very strange thing for a bunny to wear, but the colour suited me – it’s my favourite. I followed him, as far as I could, the little bastard was a quick runner. ...')
story = 1
talk_start = os.clock()
talk_story = os.clock()
storyMessage[1] = 'Soon he ran into this little cave inside a mountain. It was actually a quite astonishing view, the stalagmites and stalagtites was enormous. ...'
storyMessage[2] = 'But the little bunny had disappeared, but I scarcely noticed... for on the great stone wall was a message carved: the opposite is none! ...'
storyMessage[3] = 'I can’t really say it made any sense to me, but I will remember it for the rest of my life – who knows when it actually comes in handy to know that.” ...'
storyMessage[4] = 'And that is how the document ended. Peculiar, isn’t it? Well well, I suppose I have taken enough of your time with my story telling, but since you look so interested in these historical facts, I should advice you to talk to Marhan – that’s a man who knows his history.'
talk_state = 0
setPlayerStorageValue(cid,4330,1)
setPlayerStorageValue(cid,4329,-1)

elseif value21 == 1 and msgcontains(msg,'cottage') then
selfSay('Talk to Marhan. I have told you all I knew.')
talk_state = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())