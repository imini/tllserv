local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local storyMessage = {
		[1] = 'In spite of this, I believe it would be better to waste some random fool like you than having my own men killed. ...',
		[2] = 'As you might have figured our already, the mission I will send you on involves djinns, as it is they we\'re fighting. ...',
		[3] = 'However, I believe you are strong enough to fight them back while you are fulfilling the mission for us. Just don\'t die to early. ...',
		[4] = 'But before I introduce you to the mission itself, I must ask for your confirmation. Are you sure you are willing to proceed?',
		-- First story ends here. Add 4 to storyEndingIds		
		
		[5] = 'Needless to say, this book is heavily guarded and I believe they will let noone come near it. But we need that book! ...',
		[6] = 'This would be the first step in our plan to seize their fortress. So, to cut a long story short, I need you to obtain the book. ...',
		[7] = 'You must travel deeper in our base until you reach the excavation areas, which eventually will lead you to a secret entrance to their fortress. ...',
		[8] = 'Enter the fortress that way, locate the book and bring it back to me as soon as possible. Is everything clear to you?',
		-- Second story ends here. Add 8 to storyEndingIds

		[9] = 'Ah, it\'s all there. All essential information we can use to our advantage. This is great news. Really! ...',
		[10] = 'The first step in our plan has been executed properly, thanks to you, and now it\'s time to move on. ...',
		[11] = 'The next step will be almost as dangerous as the last one, so I must ask again, are you willing to go on?',
		-- Third story ends here. Add 11 to storyEndingIds		

		[12] = 'This disturbing element goes under the name of Yamashita. I believe he can be a problem later in our plan, so we must act now. ...',
		[13] = 'I want you to go look for him in the Barren Cliffs and then kill him. But be aware, he is a ninja... and a good one too. So I warn you ...',
		[14] = 'You will have to be very cautious not fall prey for his fighting techniques. But if you succeed with that, return here and report to me.',
		-- Fourth story ends here. Add 14 to storyEndingIds
		
		[15] = 'You see, he is very attached to this pillow and he would not let anyone take it from him. You certainly exceed my expectiations. ...',
		[16] = 'Anyway, do you wish to continue to help us?',
		-- Fifth story ends here. Add 16 to storyEndingIds
		
		[17] = 'It is widely known that the blue djinns are fighting the green ones at the same time as they are trying to handle us. This is good. ...',
		[18] = 'If we play our cards properly, we can use this to our benefit. All we need is a negotiator with convincing skills. ...',
		[19] = 'We have nothing against the green djinns, you see, and they have no reason to kill us either. Therefore, we want to make a pact. ...',
		[20] = 'This is where you enter the picture. You will go to the green djinns fortress in the north-west and negotiate a pact. ...',
		[21] = 'I\'m certain they will approve to this pact, as they also want the blue djinns defeated and extinguished. I suppose you start to see the big picture. ...',
		[22] = 'Hopefully, when we have them with us, we can launch an attack simultaneously, which literally will be devastating for our common foes. ...',
		[23] = 'So, have you now understood every part of the last step in our plan?' ,
		-- Sixth story ends here. Add 23 to storyEndingIds
		
		[24] = 'Now that we have executed the entire plan, we are ready to launch the attack anytime. Your work is over, but you will not go unawarded. ...',
		[25] = 'Of course, I am extremely grateful to all your hard work. To reward you, I have gathered a few things which I believe you will like. Do you want to have it?'
		-- Last story ends here. Add 25 to storyEndingIds
	}
local storyEndingIds = {4, 8, 11, 14, 16, 23, 25}
local story = 0
local talk_story = 0

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 					npcHandler:onThink() end

function callbackOnThink()

	if (os.clock() - talk_story) > 10 and story > 0 then
		selfSay(storyMessage[story])
		talk_start = os.clock()
		talk_story = os.clock()
		
		if(isInArray(storyEndingIds, story) == TRUE) then
			story = 0
		else
			story = story+1
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


	local value0 = getPlayerStorageValue(cid,9630)
	local value1 = getPlayerStorageValue(cid,9631)
	local value2 = getPlayerStorageValue(cid,9632)
	local value3 = getPlayerStorageValue(cid,9633)
	local value4 = getPlayerStorageValue(cid,9634)
	local value5 = getPlayerStorageValue(cid,9635)
	local value6 = getPlayerStorageValue(cid,9636)
	local value7 = getPlayerStorageValue(cid,9637)
	local value8 = getPlayerStorageValue(cid,9638)
	msg = string.lower(msg)
	if value0 == -1 and msgcontains(msg,'mission') then
		selfSay('Obviously, it would be a foolish move on the brink to folly to rely a mission to someone who is not part of our ninja society. ...')
		story = 1
		talk_start = os.clock()
		talk_story = os.clock()
		talk_state = 1

	elseif talk_state == 1 and msgcontains(msg,'no') then
		selfSay('Okay. Then go upstairs and get yourself killed or something. You are not useful to me anymore.')
		talk_state = 0

	elseif talk_state == 1 and msgcontains(msg,'yes') then
		selfSay('As you wish. Now, the djinns happens to own a certain holy book in which many secrets essential for their own destruction is written. ...')
		story = 5
		talk_start = os.clock()
		talk_story = os.clock()
		talk_state = 2

	elseif talk_state == 2 and msgcontains(msg,'no') then
		selfSay('How stupid of you...')
		talk_state = 0

	elseif talk_state == 2 and msgcontains(msg,'yes') then
		selfSay('Very good. I will wait for your return. Make sure it will be soon, though.')
		setPlayerStorageValue(cid,9630,1)
		setPlayerStorageValue(cid,9631,1)
		talk_state = 0

	elseif value1 == 1 and msgcontains(msg,'mission') then
		selfSay('Have you already retrieved the holy book from the djinns fortress?')
		talk_state = 3

	elseif talk_state == 3 and msgcontains(msg,'no') then
		selfSay('Hurry up and do so. We need to continue our plan, but we must have the book first.')
		talk_state = 0

	elseif talk_state == 3 and msgcontains(msg,'yes') then
		if getPlayerItemCount(cid,6533) >= 1 then
			selfSay('Truly amazing work of you. You did that fine. Now, let me take a look at the holy book, if you will. ...')
			story = 9
			doPlayerRemoveItem(cid,6533,1)
			setPlayerStorageValue(cid,9631,-1)
			setPlayerStorageValue(cid,9632,1)
			talk_start = os.clock()
			talk_story = os.clock()
			talk_state = 4
		else
			selfSay('You haven\'t got the holy book, fool.')
			talk_state = 0
		end

	elseif talk_state == 4 and msgcontains(msg,'no') then
		selfSay('Fine, ask me for mission when you are ready though.')
		talk_state = 0

	elseif value2 == 1 and msgcontains(msg,'mission') then
		selfSay('The next step will be almost as dangerous as the last one, so I must ask again, are you willing to go on?')
		talk_state = 4

	elseif talk_state == 4 and msgcontains(msg,'yes') then
		selfSay('Good. You have the right spirit. The next part of our plan will be to eliminate a very disturbing element. ...')
		story = 12
		talk_start = os.clock()
		talk_story = os.clock()
		setPlayerStorageValue(cid,9632,-1)
		setPlayerStorageValue(cid,9633,1)
		talk_state = 0

	elseif value3 == 1 and msgcontains(msg,'mission') or
			value3 == 1 and msgcontains(msg,'proof') then
		selfSay('Have you eliminated Yamashita and brought me proof?')
		talk_state = 25

	elseif talk_state == 25 and msgcontains(msg,'no') then
		selfSay('Well, what are you then doing here? Hurry up and execute the plan.')
		talk_state = 0

	elseif talk_state == 25 and msgcontains(msg,'yes') then
		if getPlayerItemCount(cid,6105) >= 1 then
			doPlayerRemoveItem(cid,6105,1)
			setPlayerStorageValue(cid,9633,-1)
			setPlayerStorageValue(cid,9634,1)
			selfSay('This is his favourite pillow, yes? Very smart of you, that is indeed a very good proof that you have killed him. Good work. ...')
			story = 15
			talk_start = os.clock()
			talk_story = os.clock()
			talk_state = 5
		else
			selfSay('You need to bring me proof of this.')
			talk_state = 0
		end

	elseif talk_state == 5 and msgcontains(msg,'no') then
		selfSay('You are very annoying. Ask me for mission later then.')
		talk_state = 0

	elseif value4 == 1 and msgcontains(msg,'mission') then
		selfSay('Do you want to proceed with yet another mission?')
		talk_state = 5

	elseif talk_state == 5 and msgcontains(msg,'yes') then
		selfSay('Great. Then it\'s time to execute the last step in our plan before we can launch the attack upon the blue djinns and marid. ...')
		story = 17
		talk_start = os.clock()
		talk_story = os.clock() 
		talk_state = 6

	elseif talk_state == 6 and msgcontains(msg,'no') then
		selfSay('Oh, what is wrong with your intelligence?')
		talk_state = 0

	elseif talk_state == 6 and msgcontains(msg,'yes') then
		selfSay('Good. Then return to me as soon as you have negotiated with the green djinns.')
		setPlayerStorageValue(cid,9634,-1)
		setPlayerStorageValue(cid,9635,1)
		talk_state = 0 

	elseif value5 == 1 and msgcontains(msg,'mission') then
		selfSay('Travel to the green djinns\' fortress and negotiate with them.')
		talk_state = 0

	elseif value6 == 1 and msgcontains(msg,'mission') or value6 == 1 and msgcontains(msg,'negotiate') then
		selfSay('Very good, I have been informed of your success. Apparently, the djinns were more than happy to form this pact, as I suspected. ...')
		story = 24
		talk_start = os.clock()
		talk_story = os.clock()
		talk_state = 7

	elseif talk_state == 7 and msgcontains(msg,'no') then
		selfSay('Fine, but when you want it, you can just ask me for the reward.')
		setPlayerStorageValue(cid,9636,-1)
		setPlayerStorageValue(cid,9637,1)
		talk_state = 0

	elseif value7 == 1 and msgcontains(msg,'reward') then
		selfSay('Do you want your reward now?')
		talk_state = 7

	elseif talk_state == 7 and msgcontains(msg,'yes') then
		selfSay('Very well. Here you go.')
		bp = doPlayerAddItem(cid,3939,1)
		doAddContainerItem(bp,5801,1)
		doAddContainerItem(bp,2152,30)
		doAddContainerItem(bp,5904,1)
		doAddContainerItem(bp,2143,6)
		doAddContainerItem(bp,2144,3)
		doAddContainerItem(bp,2487,1)
		setPlayerStorageValue(cid,9637,-1)
		setPlayerStorageValue(cid,9638,1)
		talk_state = 0

	elseif value8 == 1 and msgcontains(msg,'mission') then
		selfSay('You have helped us in many matters, and it\'s just a matter of time until we defeat the blue djinns.')
		talk_state = 0
	end
	
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())