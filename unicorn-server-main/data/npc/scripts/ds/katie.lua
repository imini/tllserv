-- Change Gold NPC.
-- Made by Ispiro 100% discluding the getCount by Jiddo(i just made 1 little change.).

local focus = 0
local talk_start = 0
local talk_state = 0
local difference = 1
local typeToChange = ""
local newType = ""
local downGrading = 0
local multiplier = 1
local haveEnough = 0

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)	
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end



function onCreatureDisappear(cid)			 npcHandler:onCreatureDisappear(cid)
	if focus == cid then
		selfSay('Good bye then.')
		focus = 0
		talk_state = 0
		multiplier = 0	
		count = 0
		difference = 0
		newType = ""	
		typeToChange = ""	
		focus = 0
		talk_start = 0	
	end
end



function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
			if talk_state >= 2 and talk_state <= 6 then
				count = getCountChangeGold(msg)
					if talk_state == 2 then
						if count ~= 0 then
						typeToChange = "gold"
						newType = "platinum"
						difference = 100
						multiplier = 1
						end
					elseif talk_state == 3 then	
						if (msgcontains(msg, 'gold')) then
							talk_state = 5
							selfSay('How many platinum coins would you like to get?')
						elseif (msgcontains(msg, 'crystal')) then	
							talk_state = 6	
							selfSay('How many crystal coins would you like to get?')							
						else
							talk_state = 0
							multiplier = 0	
							count = 0
							difference = 0
							newType = ""	
							typeToChange = ""	
							selfSay('Well, can I help you with something else?')
						end		
						
					elseif talk_state == 4 then	
						if count ~= 0 then
						typeToChange = "crystal"
						newType = "platinum"	
						multiplier = 100	
						difference = 1	
						end		
					elseif talk_state == 5 then	
						if count ~= 0 then
						typeToChange = "platinum"
						newType = "gold"	
						multiplier = 100	
						difference = 1	
						selfSay('So you would like me to change '.. count*difference ..' of your '.. typeToChange ..' coins into '.. count*multiplier ..' gold coins?')
						talk_state = 7
						end		
					elseif talk_state == 6 then	
						if count ~= 0 then
						typeToChange = "platinum"
						newType = "crystal"	
						multiplier = 1	
						difference = 100	
						selfSay('So you would like me to change '.. count*difference ..' of your '.. typeToChange ..' coins into '.. count*multiplier ..' '.. newType ..' coins?')
						talk_state = 7
						end								
					end
					if ((talk_state ~= 0) and (talk_state ~= 3) and (talk_state < 5) and (count ~= 0)) then
						selfSay('So you would like me to change '.. count*difference ..' of your '.. typeToChange ..' coins into '.. count*multiplier ..' '.. newType ..' coins?')	
						talk_state = 7	
					end					
			elseif talk_state >= 7 then
				if (msgcontains(msg, 'yes')) then
					haveEnough = changeGold(cid, count, typeToChange, newType, difference, multiplier)
					if haveEnough ~= 0 then
						selfSay('Here you are.')
					else
						selfSay('You don\'t have enough '.. typeToChange ..' coins.')				
					end
				else
					selfSay('Well, can I help you with something else?')
				end	
				talk_state = 0
				multiplier = 0	
				count = 0
				difference = 0
				newType = ""	
				typeToChange = ""	
			end			


			if (msgcontains(msg, 'offer')) then
				selfSay('We can change money for you. ')
				
	
			elseif (msgcontains(msg, 'change gold')) then -- 1
				selfSay('How many platinum coins would you like to get?')
				talk_state = 2
				talk_start = os.clock()
			elseif (msgcontains(msg, 'change platinum')) then -- 2
				selfSay('Would you like to change your platinum coins into gold or crystal?')
				talk_state = 3
				talk_start = os.clock()
			elseif (msgcontains(msg, 'change crystal')) then
				selfSay('How many crystal coins would you like to change to platinum?')
				talk_state = 4	
				talk_start = os.clock()
			end
		end





function onThink() npcHandler:onThink()
 	if (os.clock() - talk_start) > 25 then
  		if focus > 0 then
  			selfSay('Next Please...')
			focus = 0
			talk_state = 0
			multiplier = 0	
			count = 0
			difference = 0
			newType = ""	
			typeToChange = ""	
			focus = 0
			talk_start = 0	
  		end
  	end
 	if focus ~= 0 then
 		if getDistanceToCreature(focus) > 5 then
 			selfSay('Good bye then.')
			focus = 0
			talk_state = 0
			multiplier = 0	
			count = 0
			difference = 0
			newType = ""	
			typeToChange = ""	
			focus = 0
			talk_start = 0
 		end
 	end
end

function changeGold(cid, count, typeToChange, newType, difference, multiplier)
-- Made by Ispiro
	local countToChange = 0
	local goldType = 0	
	local newGoldType = 0
	local gpstogive = count*multiplier
	local repeatgivegp = 0
	
	if typeToChange == "platinum" then		
		goldType = 2152
	elseif typeToChange == "gold" then
		goldType = 2148
	elseif typeToChange == "crystal" then
		goldType = 2160
	else
		return 0	
	end
	
	countToChange = getPlayerItemCount(cid, goldType)
	
	if countToChange ~= 0 then
		if newType == "platinum" then
			newGoldType = 2152
		elseif newType == "gold" then
			newGoldType = 2148
		elseif newType == "crystal" then
			newGoldType = 2160
		else
			return 0
		end	
		
		if countToChange >= count*difference then
			if doPlayerRemoveItem(cid, goldType, count*difference) == 1 then
				while gpstogive >= 100 do
					repeatgivegp = 1
					gpstogive = gpstogive - 100
					doPlayerAddItem(cid, newGoldType, 100)
				end
				if repeatgivegp == 1 then
					return countToCharge
				end
				doPlayerAddItem(cid, newGoldType, gpstogive)		
				
			else
				return 0
			end
			--
			return countToCharge
		end
	end	
	return 0
end

function getCountChangeGold(msg)
-- made by Jiddo?
	local ret = 0
	local b, e = string.find(msg, "%d+")
	if b ~= nil and e ~= nil then
		ret = tonumber(string.sub(msg, b, e))
	end	
	return ret
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
