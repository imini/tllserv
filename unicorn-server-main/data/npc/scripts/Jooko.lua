local talk_story = 0 --The time limit, set it to 0
local story = 0 --To add more lines, set it to 0
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink()

    end
-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end

------------------------------------
msg = string.lower(msg)

	if msgcontains(msg, 'weapon') then
			selfSay('Do you want to buy a \'mace of the fury\' for 250 gold?')
			talk_state = 1

		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,2152)  >= 1 or getPlayerItemCount(cid,2148)  >= 250 or getPlayerItemCount(cid,2160)  >= 1 then
			doPlayerBuyItem(cid,2570,1,250)
			   selfSay('And here it is, it suits you well!')
			talk_state = 0
			else
				selfSay('You don\'t have enough money.')
			talk_state = 0
end
				elseif msgcontains(msg, 'no') then
				selfSay('Oh really?')
				talk_state = 0
end

------------------------------------

		elseif msgcontains(msg, 'job') then
			selfSay('I am the royal jes... uhm ... the royal tax-collector. Do you want to pay your taxes?')
			talk_state = 2

		elseif talk_state == 2 then
			if msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,2152)  >= 1 or getPlayerItemCount(cid,2148)  >= 50 or getPlayerItemCount(cid,2160)  >= 1 then
			doPlayerBuyItem(cid,2148,1,51)
			   selfSay('Thank you very much. I will have a drink or two on your health!')
			talk_state = 0
			else
				selfSay('Come back when you have enough money.')
			talk_state = 0
end
		elseif talk_state == 2 then
		if msgcontains(msg, 'no') then
				selfSay('You don\'t want to? That\'s your loss.')
				talk_state = 0
			end
	end

------------------------------------

		elseif msgcontains(msg, 'magic') then
			selfSay('I actually know some spells! Do you want to learn how to \'lessen your load\' for 200 gold?')
			talk_state = 3

		elseif talk_state == 3 then
			if msgcontains(msg, 'yes') then
			if getPlayerItemCount(cid,2152)  >= 1 or getPlayerItemCount(cid,2148)  >= 200 or getPlayerItemCount(cid,2160)  >= 1 then
			doPlayerBuyItem(cid,2148,1,201)
			   selfSay('Here you are, I already lessened your load.')
			talk_state = 0
			else
				selfSay('Sorry I can\'t. You don\'t have enough money.')
			talk_state = 0
end
		elseif talk_state == 3 then
		if msgcontains(msg, 'no') then
				selfSay('Belive me, it\'s worth it.')
				talk_state = 0
			end
		end

------------------------------------

		elseif msgcontains(msg, 'jester') then
			selfSay('Do you want to join the fool\'s club?')
			talk_state = 4

		elseif talk_state == 4 then
			if msgcontains(msg, 'yes') then
			   selfSay('Sorry, you already are a member.')
			talk_state = 0


		elseif talk_state == 4 then
		if msgcontains(msg, 'no') then
				selfSay('Pity, you would\'ve been a very high-ranked member.')
				talk_state = 0
			end
		end


	end
return true
end



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())