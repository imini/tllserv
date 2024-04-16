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
	if (os.clock() - talk_story) > 9 and story > 0 then
    
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
	
	
	value0 = getPlayerStorageValue(cid,9880)
	valuehax = getPlayerStorageValue(cid,9799)
	value1 = getPlayerStorageValue(cid,9881)
	value2 = getPlayerStorageValue(cid,9882)
	value3 = getPlayerStorageValue(cid,9883)
	value4 = getPlayerStorageValue(cid,9884)
	value5 = getPlayerStorageValue(cid,9885)
	value6 = getPlayerStorageValue(cid,9886)
	value7 = getPlayerStorageValue(cid,9887)
	value8 = getPlayerStorageValue(cid,9888)
	value9 = getPlayerStorageValue(cid,9889)
	value10 = getPlayerStorageValue(cid,9890)
	value11 = getPlayerStorageValue(cid,9891)
	value12 = getPlayerStorageValue(cid,9892)
	
	value13 = getPlayerStorageValue(cid,9711)
	value14 = getPlayerStorageValue(cid,9712)
	value15 = getPlayerStorageValue(cid,9713)
  value16 = getPlayerStorageValue(cid,9714)
  value17 = getPlayerStorageValue(cid,9715)
  value18 = getPlayerStorageValue(cid,9716)
  value19 = getPlayerStorageValue(cid,9717)
	
	value20 = getPlayerStorageValue(cid,9723)
	value21 = getPlayerStorageValue(cid,9724)
	value22 = getPlayerStorageValue(cid,9725)
	value23 = getPlayerStorageValue(cid,9726)
	value24 = getPlayerStorageValue(cid,9727)
	
	travelvalue1 = getPlayerStorageValue(cid,9893)
	travelvalue2 = getPlayerStorageValue(cid,9894)
	travelvalue3 = getPlayerStorageValue(cid,9895)
	travelvalue4 = getPlayerStorageValue(cid,9896)
	parcelvalue = getPlayerStorageValue(cid,9897)
	magicanvalue = getPlayerStorageValue(cid,9898)
	jeffvalue = getPlayerStorageValue(cid,9899)
	roostervalue1 = getPlayerStorageValue(cid,9706)
	techvalue = getPlayerStorageValue(cid,9707)
	kingvalue = getPlayerStorageValue(cid,9708)
	dogvalue = getPlayerStorageValue(cid,9709)
	roostervalue2 = getPlayerStorageValue(cid,9710)
	agornvalue = getPlayerStorageValue(cid,9718)
	stephanievalue = getPlayerStorageValue(cid,9719)
	samahatvalue = getPlayerStorageValue(cid,9720)
	josephvalue = getPlayerStorageValue(cid,9721)
	fredvalue = getPlayerStorageValue(cid,9704)
	santavalue = getPlayerStorageValue(cid,9722)
	malakazvalue = getPlayerStorageValue(cid,9728)
	mintovalue = getPlayerStorageValue(cid,9729)
	doorvalue = getPlayerStorageValue(cid,9730)
	msg = string.lower(msg)
	
	--mission1
	
	if msgcontains(msg,'mission') and value0 == -1 then
	selfSay('You are not a member of our guild yet! We have high standards for our members. To rise in our guild is a difficult but rewarding task. Are you interested in joining?')
	talk_state = 1
	
	elseif talk_state == 1 and msgcontains(msg,'no') then
	selfSay('Very well, but you may want to return and do so later.')
	talk_state = 0
	
	elseif talk_state == 1 and msgcontains(msg,'yes') then
	selfSay('Hm, I might consider your proposal, but first you will have to prove your worth by doing some tasks for us. Are you willing to do that?')
	talk_state = 2
	
	elseif talk_state == 2 and msgcontains(msg,'no') then
	selfSay('Well then, I\'m afraid you can\'t join then.')
	talk_state = 0
	
	elseif talk_state == 2 and msgcontains(msg,'yes') then
	selfSay('Excellent! Your first task will be quite simple. But you should better write my instructions down anyways. You can read and write?')
	talk_state = 3
	
	elseif talk_state == 3 and msgcontains(msg,'no') then
	selfSay('That\'s a problem you\'ll have to take care of before joining our guild, then.')
	talk_state = 0
	
	elseif talk_state == 3 and msgcontains(msg,'yes') then
	selfSay('So listen, you will check certain vessels\' log book for problems. First travel to Captain Hack Sparry\'s ship in Casteldine and read his log. Understood?')
	talk_state = 4
	
	elseif talk_state == 4 and msgcontains(msg,'no') then
	selfSay('Your low intelligence will be a problem further ahead, I\'m afraid.')
	talk_state = 0
	
	elseif talk_state == 4 and msgcontains(msg,'yes') then
	selfSay('Excellent! Once you have done that you will travel to Petros in Tha\'Reen and read his log. Understood?')
	talk_state = 5
	
	elseif talk_state == 5 and msgcontains(msg,'no') then
	selfSay('Your low intelligence will be a problem further ahead, I\'m afraid.')
	talk_state = 0
	
	elseif talk_state == 5 and msgcontains(msg,'yes') then
	selfSay('Fine, fine! Next, travel to Captain Seafish on the isle of Agatone and read his log. Understood?')
	talk_state = 6
	
	elseif talk_state == 6 and msgcontains(msg,'no') then
	selfSay('Your low intelligence will be a problem further ahead, I\'m afraid.')
	talk_state = 0
	
	elseif talk_state == 6 and msgcontains(msg,'yes') then
	selfSay('Good! Finally find Lendan close to Celeres and read his log, then walk back here and report. You got that now?')
	talk_state = 7
	
	elseif talk_state == 7 and msgcontains(msg,'no') then
	selfSay('Your low intelligence will be a problem further ahead, I\'m afraid.')
	talk_state = 0
	
	elseif talk_state == 7 and msgcontains(msg,'yes') then
	selfSay('Ok, remember: the Lithaton mail service puts trust in you! Don\'t fail and report back soon. Just tell me about your MISSION.')
	setPlayerStorageValue(cid,9880,1)
	setPlayerStorageValue(cid,9799,1)
	talk_state = 0
	
	
  --mission2
  
  elseif msgcontains(msg,'mission') and valuehax == 1 and travelvalue4 == 1 then
	selfSay('So you have finally made it! I did not think that you would have it in you ... However: are you ready for another assignment?')
	talk_state = 8
	
	elseif msgcontains(msg,'mission') and valuehax == 1 and travelvalue4 ~= 1 then
	selfSay('You are either trying to decieve me, or you haven\'t understood your assignment properly. You have not completed the last mission yet.')
	talk_state = 0
	
	elseif talk_state == 8 and msgcontains(msg,'no') then
	selfSay('Fine, take a break, we can continue soon.')
	talk_state = 0
	
	elseif talk_state == 8 and msgcontains(msg,'yes') then
	selfSay('I am glad to hear that. One of our mailboxes was reported to be jammed. It is located on the so called \'mountain\' on the isle Hagal.. or was it Gardar? Well, get a crowbar, find the mailbox and fix it. Report about your mission when you have done so.')
	setPlayerStorageValue(cid,9799,-1)
	setPlayerStorageValue(cid,9881,1)
	talk_state = 0
	
	--mission3
	
	elseif msgcontains(msg,'mission') and value1 == 1 then
	selfSay('Did you fix the broken mailbox on Gardar? Or Hagal?')
	talk_state = 9
	
	elseif talk_state == 9 and msgcontains(msg,'no') then
	selfSay('Return to me when you have done so then.')
	talk_state = 0
	
	elseif talk_state == 9 and msgcontains(msg,'yes') then
	if value2 == 1 then
	selfSay('Excellent, you got it fixed! This will teach this mailbox a lesson indeed! Are you interested in another assignment?')
	talk_state = 10
	else
	selfSay('I have reasons to believe you are lying to me. Return when you actually have fulfilled the assignment given to you.')
	talk_state = 0
	end
	
	elseif talk_state == 10 and msgcontains(msg,'no') then
	selfSay('Return to me when you feel ready.')
	talk_state = 0
	
	elseif talk_state == 10 and msgcontains(msg,'yes') then
	selfSay('For your noble deeds I grant you the title Assistant Postofficer. After every second mission ask me for an ADVANCEMENT. Your next task will be a bit more challenging. Do you feel ready for it?')
	setPlayerStorageValue(cid,9881,-1)
	setPlayerStorageValue(cid,9882,1)
	setPlayerStorageValue(cid,9897,1)
	talk_state = 11
	
	elseif talk_state == 11 and msgcontains(msg,'no') then
	selfSay('Return to me when you feel ready.')
	talk_state = 0
	
	elseif talk_state == 11 and msgcontains(msg,'yes') then
	selfSay('I need you to deliver a bill for one magican hat to the stage magician David Brassacres. He\'s hiding from his creditors somewhere in Adanac. It\'s likely you will have to trick him somehow to reveal his identity, since he might have switched name. Report back when you delivered this bill.')
	setPlayerStorageValue(cid,9881,-1)
	setPlayerStorageValue(cid,9882,1)
	doPlayerAddItem(cid,2329,1)
	talk_state = 0
	
	--mission4
	
	elseif msgcontains(msg,'mission') and value2 == 1 and magicanvalue == -1 then
	selfSay('You haven\'t yet given David Brassacres from Adanac the bill. Look around for him.')
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value2 == 1 and magicanvalue == 1 then
	selfSay('You truly got him? Quite impressive. You are a very promising candidate! I think I have another mission for you. Are you interested?')
	talk_state = 12
	
	elseif talk_state == 12 and msgcontains(msg,'yes') then
	selfSay('Ok, listen: we have some serious trouble with aggressive dogs lately. We have accumulated some bones as a sort of pacifier but we need more. Collect 20 bones like the one on the table behind me.')
	setPlayerStorageValue(cid,9882,-1)
	setPlayerStorageValue(cid,9883,1)
	talk_state = 0
	
	elseif talk_state == 12 and msgcontains(msg,'no') then
	selfSay('Return to me when you feel ready.')
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value3 == 1 then
	if getPlayerItemCount(cid,2230) >= 20 then
	selfSay('You have collected 20 bones. Excellent! Now let\'s talk about further missions if you are interested. Also, you have advanced in rank to Postman. Take this hat as reward.')
	setPlayerStorageValue(cid,9883,-1)
	setPlayerStorageValue(cid,9884,1)
	doPlayerAddItem(cid,2665,1)
	doPlayerRemoveItem(cid,2230,20)
	talk_state = 0
	else	
	selfSay('I told you to collect 20 bones like the one on the table behind me.')
	talk_state = 0
	end
	
	--mission5
	
	elseif msgcontains(msg,'mission') and value4 == 1 then
	selfSay('You have made it! We have enough bones for the fund! You remind me of myself when I was young! Interested in another mission?')
	talk_state = 13
	
	elseif talk_state == 13 and msgcontains(msg,'no') then
	selfSay('Return to me when you feel ready.')
	talk_state = 0
	
	elseif talk_state == 13 and msgcontains(msg,'yes') then
	selfSay('Since I am convinced I can trust you, this time you must deliver a valuable present to Jeff in the Fields of Wilderness. Do NOT open it!!! You will find the present behind the door on the next floor. By the way, make sure you have 500 oz. cap first.')
	setPlayerStorageValue(cid,9884,-1)
	setPlayerStorageValue(cid,9885,1)
	talk_state = 0
	
	elseif msgcontains(msg,'mission') and value5 == 1 then
	if jeffvalue == 1 then
	selfSay('Splendid, I knew we could trust you. I would like to ask for your help in another matter. Are you interested?')
	setPlayerStorageValue(cid,9885,-1)
	setPlayerStorageValue(cid,9886,1)
	talk_state = 14
	else	
	selfSay('You must go to Jeff in the Fields of Wilderness and leave the present. You can take it from the box on the next floor. But remember, do not open it. By the way, make sure you have 500 oz. cap first.')
	talk_state = 0
	end
	
	--mission6
	
	elseif talk_state == 14 and msgcontains(msg,'no') then
	selfSay('Return to me when you feel ready.')
	talk_state = 0
	
	elseif talk_state == 14 and msgcontains(msg,'yes') then
	selfSay('Ok. We need a new set of uniforms, and only the best will do for us. Please travel to Celeres and negotiate with Rooster a contract for new uniforms.')
	setPlayerStorageValue(cid,9886,-1)
	setPlayerStorageValue(cid,9887,1)
	talk_state = 0
	
	elseif value7 == 1 and msgcontains(msg,'mission') then
	selfSay('I told you to travel to Rooster in Celeres and negotiate a new contract for uniforms for us.')
	talk_state = 0
	
	elseif roostervalue1 == 1 and msgcontains(msg,'dress pattern') then
	selfSay('Oh yes, where did we get that from ...? Let\'s see, first ask the great technomancer in the Rocky Mountains\' lava express central for the technical details. Return here afterwards.') 
  setPlayerStorageValue(cid,9706,-1)
	setPlayerStorageValue(cid,9888,1)
	
	elseif value8 == 1 and msgcontains(msg,'mission') then
	selfSay('Go to the technomancer in the Rocky Mountains\' lava express central and ask for the technical details on the dress pattern.')
	talk_state = 0
	
	elseif techvalue == 1 and msgcontains(msg,'dress pattern') then
	selfSay('The mail with Saprith\'s instructions just arrived. I remember we asked King Arturo of Casteldine for the perfect colours. Go there, ask him about the UNIFORMS and report back here.') 
  setPlayerStorageValue(cid,9707,-1)
  setPlayerStorageValue(cid,9888,-1)
	setPlayerStorageValue(cid,9889,1)
	
	elseif value9 == 1 and msgcontains(msg,'mission') then
	selfSay('Ask King Arturo for the uniforms.')
	talk_state = 0
	
	elseif kingvalue == 1 and msgcontains(msg,'dress pattern') then
	selfSay('The king has sent me the samples we needed. The next part is tricky. We need the uniforms to emanate some odor that dogs hate. The dog with the best \'taste\' in that field is Ragnir, the dog of Jeff. Do you understand so far?')
	talk_state = 15
	
	elseif kingvalue == 1 and msgcontains(msg,'mission') then
	selfSay('Ask Jeff\'s dog Ragnir which taste he dislikes most: moldy cheese, a piece of fur or a banana skin. Tell him to SNIFF, then the object. After, show him the object and ask \'Do you like that?\'.')
	talk_state = 0
	
	elseif talk_state == 15 and msgcontains(msg,'no') then
	selfSay('Then return to me when you actually do understand then.')
	talk_state = 0
	
	elseif talk_state == 15 and msgcontains(msg,'yes') then
	selfSay('Good. Go there and find out what taste he dislikes most: moldy cheese, a piece of fur or a banana skin. Tell him to SNIFF, then the object. After, show him the object and ask \'Do you like that?\'.')
	setPlayerStorageValue(cid,9708,-1)
	setPlayerStorageValue(cid,9890,-1)
	setPlayerStorageValue(cid,9891,1)
	talk_state = 0
	
	elseif dogvalue == 1 and msgcontains(msg,'dress pattern') then
	selfSay('Fine, fine. I think that should do it. Tell Rooster that we order those uniforms. The completed dress pattern will soon arrive in Celeres. Report to me when you have talked to him.')
	setPlayerStorageValue(cid,9709,-1)
	setPlayerStorageValue(cid,9892,1)
	talk_state = 0
	
	elseif roostervalue2 == 1 and msgcontains(msg,'dress pattern') then
	selfSay('Excellent! Another job well done! You will now advance in rank to grand postman. You may use the two teleports on the next floor. Now, would you accept another mission?')
	setPlayerStorageValue(cid,9710,-1)
	setPlayerStorageValue(cid,9711,1)
	setPlayerStorageValue(cid,9730,1)
	talk_state = 17
	
	--mission7
	
	elseif value13 == 1 and msgcontains(msg,'mission') then
	selfSay('Would you accept another mission?')
	talk_state = 17	
	
	elseif talk_state == 17 and msgcontains(msg,'no') then
	selfSay('Talk to me again when you feel ready.')
	talk_state = 0	
	
	elseif talk_state == 17 and msgcontains(msg,'yes') then
	selfSay('Good, so listen. Rooster informed me that he needs the measurements of our post officers. Go and bring me the measurements of Agorn, Stephanie, Samahat and Joseph.')
	setPlayerStorageValue(cid,9711,-1)
	setPlayerStorageValue(cid,9712,1)
	talk_state = 0	
	
	elseif value14 == 1 then
	if agornvalue == 1 and stephanievalue == 1 and samahatvalue == 1 and josephvalue == 1 and msgcontains(msg,'mission') then
	selfSay('Once more you have impressed me! Are you willing to do another job?')
	setPlayerStorageValue(cid,9718,-1)
	setPlayerStorageValue(cid,9712,-1)
	setPlayerStorageValue(cid,9719,-1)
	setPlayerStorageValue(cid,9720,-1)
	setPlayerStorageValue(cid,9721,-1)
	setPlayerStorageValue(cid,9713,1)
	talk_state = 18	
	else
	selfSay('Go get the measurements of Agorn, Samahat, Stephanie and Joseph.')	
	talk_state = 0	
	end
	
	elseif talk_state == 18 and msgcontains(msg,'no') then
	selfSay('Talk to me again when you feel ready.')
	talk_state = 0	
	
	--mission8
	
	elseif talk_state == 18 and msgcontains(msg,'yes') then
	selfSay('Okey, but your next assignment might be dangerous. Our Courier Fred has been missing for a while. I must assume he is dead. Can you follow me so far?')
	talk_state = 19
	
	elseif talk_state == 19 and msgcontains(msg,'no') then
	selfSay('Talk to me again when you feel like you can understand simple orders.')
	talk_state = 0	
	
	elseif talk_state == 19 and msgcontains(msg,'yes') then
	selfSay('Find out about his whereabouts and retrieve him or at least his posthorn. He was looking for a new underground passage that is rumoured to be found underneath the goblin-infested cavities east of Casteldine.')
	setPlayerStorageValue(cid,9713,-1)
	setPlayerStorageValue(cid,9714,1)
	talk_state = 0		
	
	elseif value16 == 1 and msgcontains(msg,'mission') then
	selfSay('Go seek our Courier Fred in the goblin cavities east of Casteldine.')
	talk_state = 0
	
	elseif fredvalue == 1 and msgcontains(msg,'mission') then
	selfSay('So Fred is dead? This is grave news indeed. Did you recover his posthorn?')
	talk_state = 20
	
	elseif talk_state == 20 and msgcontains(msg,'no') then
	selfSay('Then we cannot know it\'s his body, can we?')
	talk_state = 0	
	
	elseif talk_state == 20 and msgcontains(msg,'yes') then
	if getPlayerItemCount(cid,2332) >= 1 then
	doPlayerRemoveItem(cid,2332,1)
	setPlayerStorageValue(cid,9704,-1)
	setPlayerStorageValue(cid,9715,1)
	selfSay('Thank you. We will honour this. Your next mission will be a very special one. Good thing you are a special person as well. Are you ready?')
	talk_state = 21
	else
	selfSay('Sorry, but you don\'t have it.')
	talk_state = 0
	end
	
	elseif talk_state == 21 and msgcontains(msg,'no') then
	selfSay('Good thing, because before we must talk about your advancement.')
	talk_state = 22	
	
	elseif talk_state == 21 and msgcontains(msg,'yes') then
	selfSay('Your eagerness is a virtue, young one, but first lets talk about advancement.')
	talk_state = 22	
	
	elseif value17 == 1 and msgcontains(msg,'advancement') then
	selfSay('You are worthy indeed. Do you want to advance in our guild?')
	talk_state = 23	
	
	elseif talk_state == 23 and msgcontains(msg,'no') then
	selfSay('Return to me when you feel like advancing then.')
	talk_state = 0	
	
	elseif talk_state == 23 and msgcontains(msg,'yes') then
	selfSay('From now on you are a grand postman for special operations. You are an honoured member of our guild and earned the privilege of your own post horn. Here, take it.')
	setPlayerStorageValue(cid,9715,-1)
	setPlayerStorageValue(cid,9716,1)
	doPlayerAddItem(cid,2364,1)
	talk_state = 0
	
	elseif value18 == 1 and msgcontains(msg,'mission') then
	selfSay('So are you ready for yet another mission?')
	talk_state = 24	
	
	--mission9
	
	elseif talk_state == 24 and msgcontains(msg,'no') then
	selfSay('Fine, then return to me when you are.')
	talk_state = 0	
	
	elseif talk_state == 24 and msgcontains(msg,'yes') then
	selfSay('So listen well. Behind the lower left door on the next floor you will find a bag. The letters in the bag are for none other than Santa Claus! Deliver them to his house on the isle of one of the ice islands, USE the bag on his mailbox and report back here.')
	setPlayerStorageValue(cid,9716,-1)
	setPlayerStorageValue(cid,9717,1)
	talk_state = 0	
	
	elseif value19 == 1 and msgcontains(msg,'mission') then
	if santavalue == 1 then
	selfSay('You did it? I hope you did not catch a flu in the cold! However, there\'s another mission for you. Are you interested?')
	setPlayerStorageValue(cid,9717,-1)
	setPlayerStorageValue(cid,9723,1)
	talk_state = 25
	else
	selfSay('You must take the red bag from the next floor, then travel to Santa Claus\' home on one of the ice islands and then use the bag on his mailbox. Afterwards, return here.')
	talk_state = 0
	end	
		
	--mission10
	
	elseif talk_state == 25 and msgcontains(msg,'no') then
	selfSay('Then ask me for a mission later.')
	talk_state = 0	
	
	elseif value20 == 1 and msgcontains(msg,'mission') then
	selfSay('Do you want to continue with another mission?')
	talk_state = 25		
	
	elseif talk_state == 25 and msgcontains(msg,'yes') then
	selfSay('Excellent. Here is a letter for you to deliver. Well, to be honest, no one else volunteered. It\'s a letter from the mother of Malakaz, some mage from the north-west regions of Dustwit. Deliver that letter to him, but note that you will not be welcome there.')
	setPlayerStorageValue(cid,9723,-1)
	setPlayerStorageValue(cid,9724,1)
	doPlayerAddItem(cid,2333,1)
	talk_state = 0
	
	elseif value21 == 1 and msgcontains(msg,'mission') then
	selfSay('Go to the north-east regions of Dustwit and deliver this letter to Malakaz.')
	talk_state = 0		
	
	elseif malakazvalue == 1 and msgcontains(msg,'mission') or
	malakazvalue == 1 and msgcontains(msg,'letter') then
	selfSay('My deepest apologizes, I don\'t know what I was thinking about. Of course, this letter is not to Malakaz, but actually Minto\'Dracir, who lives in the southern Ravenclaw Swamp. Go there, and give him the letter and then return here.')
	setPlayerStorageValue(cid,9728,-1)
	setPlayerStorageValue(cid,9725,1)
	talk_state = 0	
	
	elseif value22 == 1 and msgcontains(msg,'mission') then
	selfSay('Go to the Ravenclaw Swamp and give Minto\'Dracir the letter from his mother.')
	talk_state = 0	
	
	elseif mintovalue == 1 and msgcontains(msg,'mission') then
	selfSay('You have delivered that letter? You are a true postofficer. All over the land bards shall praise your name. There are no missions for you left right now. Only thing left for you is the last advancement.')
	setPlayerStorageValue(cid,9729,-1)
	setPlayerStorageValue(cid,9726,1)
	talk_state = 0
	
	elseif msgcontains(msg,'advancement') and value23 == 1 then	
	selfSay('You are worthy indeed. Do you want to advance in our guild?')
	talk_state = 28
	
	elseif talk_state == 28 and msgcontains(msg,'no') then
	selfSay('Then ask me for it later.')
	talk_state = 0
		
	elseif talk_state == 28 and msgcontains(msg,'yes') then
	selfSay('I grant you the title of archpostman. You are a legend in our guild. As privilege of your newly aquired status you are allowed to make use of certain mailboxes in dangerous areas. Just look out for them and you\'ll see.')
	setPlayerStorageValue(cid,9727,1)
	setPlayerStorageValue(cid,9726,-1)
	talk_state = 0	
	
	elseif value24 == 1 and msgcontains(msg,'mission') then
	selfSay('You have completed all the missions already. You are an archpostman.')
	end
	return true
	end
	
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
