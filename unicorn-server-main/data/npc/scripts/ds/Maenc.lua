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
function callbackOnThink(cid)
	if (os.clock() - talk_story) > 8 and story > 0 then
    
        if story == 1 then
    
            selfSay(storyMessage[story])
            talk_start = os.clock()
            talk_story = os.clock()
	story = 0
	
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
	
	
msg = string.lower(msg)

if msgcontains(msg,'sword of fury') then
selfSay('The first, the second, the third, all three to hide, all three hidden. A humble, to be, and remember, for without, one fail.')

elseif msgcontains(msg,'first') then
selfSay('The chamber of gas, with the mark marked, by human flesh, and then let the poison flow.')

elseif msgcontains(msg,'second') then
selfSay('The teeth of the Skull must be strode together, at the same clock.')

elseif msgcontains(msg,'third') then
selfSay('The Undead one guards the third, and only chosen, shalt and can go there.')

elseif msgcontains(msg,'chosen') then
selfSay('The prophecy can only let the chosen walk, when the gods are satisfied.')

elseif msgcontains(msg,'undead') then
selfSay('The Undead bound to guard, trapped within inhuman bounds.')

elseif msgcontains(msg,'skull') then
selfSay('The bears bear a secret.')

elseif msgcontains(msg,'bear') then
selfSay('The bears bear a secret.')

elseif msgcontains(msg,'humble') then
selfSay('And then must you pay to be humble, for the humble pays what makes one humble. ...')
story = 1
talk_start = os.clock()
talk_story = os.clock()
storyMessage[1] = 'And too, the crack will lead you down. For down, and not up, is where humble goes.'

elseif msgcontains(msg,'gas chamber') then
selfSay('Of poison shall it open, but not solely.')

elseif msgcontains(msg,'prophecy') then
selfSay('Prophecy written, can and shalt not lie.')

elseif msgcontains(msg,'god') then
selfSay('Every god demands a payment.')

elseif msgcontains(msg,'payment') then
selfSay('Payment in flesh, but blood shalt open the gateway.')

elseif msgcontains(msg,'gateway') then
selfSay('Four to show where, one to travel there. When, the gate opener decides.')

elseif msgcontains(msg,'gate opener') then
selfSay('First the first, secondly the second, the third and the gate opener be disturbed. ...')
story = 2
talk_start = os.clock()
talk_story = os.clock()
storyMessage[2] = 'And the hallway of the Fury is to be opened.'

elseif msgcontains(msg,'kothanc') then
selfSay('God of the minotaurs.')

elseif msgcontains(msg,'vavaul') then
selfSay('God of the wolves.')

elseif msgcontains(msg,'Unduror') then
selfSay('God of the trolls.')

elseif msgcontains(msg,'fauturor') then
selfSay('God of the spiders.')

elseif msgcontains(msg,'orimor') then
selfSay('God of the deers.')

elseif msgcontains(msg,'melkoro') then
selfSay('God of the orcss.')

end
return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
