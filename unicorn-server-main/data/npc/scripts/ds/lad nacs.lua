local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local QUEST = 1
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
story = 0

elseif story == 7 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 8 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 9 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 10

elseif story == 10 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 11 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 12

elseif story == 12 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 13 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 14

elseif story == 14 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 15

elseif story == 15 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 16 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 17 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 18

elseif story == 18 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 19 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 20

elseif story == 20 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 21 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 22 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 23 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 24 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 25 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 26 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 27

elseif story == 27 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 28

elseif story == 28 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 29 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 30

elseif story == 30 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 31

elseif story == 31 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 32 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 33

elseif story == 33 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 34

elseif story == 34 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 35

elseif story == 35 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 36 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 0

elseif story == 36 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 37

elseif story == 37 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 38

elseif story == 38 then
selfSay(storyMessage[story])
talk_start = os.clock()
talk_story = os.clock()
story = 39

elseif story == 39 then
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
if(npcHandler.focus ~= cid) then
return false
end

--Values
value0 = getPlayerStorageValue(cid,9680)
value1 = getPlayerStorageValue(cid,9681)
value2 = getPlayerStorageValue(cid,9682)
value3 = getPlayerStorageValue(cid,9683)
value4 = getPlayerStorageValue(cid,9684)
value5 = getPlayerStorageValue(cid,9685)
value6 = getPlayerStorageValue(cid,9686)
value7 = getPlayerStorageValue(cid,9687)
value8 = getPlayerStorageValue(cid,9688)
value9 = getPlayerStorageValue(cid,9689)
value10 = getPlayerStorageValue(cid,9401)
value11 = getPlayerStorageValue(cid,9402)
value12 = getPlayerStorageValue(cid,9403)
value13 = getPlayerStorageValue(cid,9404)
value14 = getPlayerStorageValue(cid,9405)
value15 = getPlayerStorageValue(cid,9406)
value16 = getPlayerStorageValue(cid,9407)
value17 = getPlayerStorageValue(cid,9408)
value18 = getPlayerStorageValue(cid,9409)
value19 = getPlayerStorageValue(cid,9410)
value20 = getPlayerStorageValue(cid,9411)
value21 = getPlayerStorageValue(cid,9421)
value22 = getPlayerStorageValue(cid,9422)
value23 = getPlayerStorageValue(cid,9423)
value24 = getPlayerStorageValue(cid,9424)
value25 = getPlayerStorageValue(cid,9425)
value26 = getPlayerStorageValue(cid,9426)
value27 = getPlayerStorageValue(cid,9427)
value28 = getPlayerStorageValue(cid,9428)
value29 = getPlayerStorageValue(cid,9429)
value30 = getPlayerStorageValue(cid,9430)
value40 = getPlayerStorageValue(cid,9440)
value41 = getPlayerStorageValue(cid,9441)
value42 = getPlayerStorageValue(cid,9442)
value43 = getPlayerStorageValue(cid,9443)
value44 = getPlayerStorageValue(cid,9444)
value45 = getPlayerStorageValue(cid,9445)
value46 = getPlayerStorageValue(cid,9446)
value47 = getPlayerStorageValue(cid,9447)
value48 = getPlayerStorageValue(cid,9448)
value49 = getPlayerStorageValue(cid,9449)
value50 = getPlayerStorageValue(cid,9450)

hackvalue1 = getPlayerStorageValue(cid,9693)
hackvalue2 = getPlayerStorageValue(cid,9694)
tommyvalue = getPlayerStorageValue(cid,9692)
alexvalue = getPlayerStorageValue(cid,9691)
workshopvalue = getPlayerStorageValue(cid,9679)
mailvalue1 = getPlayerStorageValue(cid,9414)
mailvalue2 = getPlayerStorageValue(cid,9415)
mailvalue3 = getPlayerStorageValue(cid,9695)
mailvalue4 = getPlayerStorageValue(cid,9696)
mailvalue5 = getPlayerStorageValue(cid,9697)
mailvalue6 = getPlayerStorageValue(cid,9698)
mailvalue7 = getPlayerStorageValue(cid,9699)
mailvalue8 = getPlayerStorageValue(cid,9400)
dinevalue1 = getPlayerStorageValue(cid,9412)
dinevalue2 = getPlayerStorageValue(cid,9413)
broochvalue = getPlayerStorageValue(cid,9416)
fluidvalue1 = getPlayerStorageValue(cid,9417)
fluidvalue2 = getPlayerStorageValue(cid,9418)
fluidvalue3 = getPlayerStorageValue(cid,9419)
firevalue = getPlayerStorageValue(cid,9431)
reclusevalue1 = getPlayerStorageValue(cid,9432)
outfitvalue = getPlayerStorageValue(cid,9433)
outfitvalue2 = getPlayerStorageValue(cid,9434)
jacobvalue = getPlayerStorageValue(cid,9435)
witchvalue = getPlayerStorageValue(cid,9436)
nettlevalue = getPlayerStorageValue(cid,9437)
amazonvalue = getPlayerStorageValue(cid,9438)
lavavalue1 = getPlayerStorageValue(cid,9439)
lavavalue2 = getPlayerStorageValue(cid,9451)
sapvalue1 = getPlayerStorageValue(cid,9452)
sapvalue2 = getPlayerStorageValue(cid,9453)
sapvalue3 = getPlayerStorageValue(cid,9454)
sapvalue4 = getPlayerStorageValue(cid,9455)
bombvalue = getPlayerStorageValue(cid,9456)
sethanvalue1 = getPlayerStorageValue(cid,9457)
sethanvalue2 = getPlayerStorageValue(cid,9458)
beardoorvalue = getPlayerStorageValue(cid,9459)
bearinrunevalue = getPlayerStorageValue(cid,9460)
bearvalue = getPlayerStorageValue(cid,9461)
slimevalue1 = getPlayerStorageValue(cid,9462)
slimevalue2 = getPlayerStorageValue(cid,9463)
capzvalue = getPlayerStorageValue(cid,9464)
capvalue = getPlayerStorageValue(cid,9465)
gemvaluescript = getPlayerStorageValue(cid,9466)
--Variables
sex = getPlayerSex(cid)
voc = getPlayerVocation(cid)
msg = string.lower(msg)

--Code
--Mission1


if value0 == -1 and msgcontains(msg,'mission') then
selfSay('Oh... I didn\'t think you were gonna ask! Well, I need help with my devastating plans, but I don\'t know if I can trust you, really. Perhaps you could prove yourself trustworthy. What do you say?')
talk_state = 1

elseif talk_state == 1 and msgcontains(msg,'no') then
selfSay('I saw it on you when you entered.')
talk_state = 0

elseif talk_state == 1 and msgcontains(msg,'yes') then
selfSay('Alright. If you could just execute a very simple mission I would be glad to accept your help. I need some new leather for my boots, they are getting torn. Bring me three pieces of minotaur leather.')
talk_state = 0
setPlayerStorageValue(cid,9680,1)
setPlayerStorageValue(cid,9681,1)

elseif value1 == 1 and msgcontains(msg,'mission') or
value1 == 1 and msgcontains(msg,'leather') then
selfSay('Have you brought me the three pieces of minotaur leather?')
talk_state = 2

elseif talk_state == 2 and msgcontains(msg,'no') then
selfSay('Come back when you have those leathers then.')
talk_state = 0

elseif talk_state == 2 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5878) >= 3 then
doPlayerRemoveItem(cid,5878,3)
setPlayerStorageValue(cid,9681,-1)
setPlayerStorageValue(cid,9682,1)
npcHandler:say('Excellent. Not only did you provide me with something I needed, but you also proved that you are reliable. We can discuss missions when you feel like it.')
talk_state = 0
else
selfSay('You haven\'t.')
talk_state = 0
end

--Mission2

elseif value2 == 1 and msgcontains(msg,'mission') then
selfSay('Does this mean you wish to help me in my unpleasant plans?')
talk_state = 3

elseif talk_state == 3 and msgcontains(msg,'no') then
selfSay('I will be waiting, then.')
talk_state = 0

elseif talk_state == 3 and msgcontains(msg,'yes') then
selfSay('Good. Let me explain what this is all about. Long time ago, I fled the stressful and messy life in Casteldine. I despised all its citizens and the king too. ...')
story = 1
talk_start = os.clock()
talk_story = os.clock()
storyMessage[1] = 'I decided to live in solitude and do whatever suited me best at the moment. I tried to work as a blacksmith and a sculptor, but well... I was not very successful. ...'
storyMessage[2] = 'My days became more and more boring - eventually I began digging my own grave... literally. However, it was then I realised that I shouldn\'t blame myself for this. ...'
storyMessage[3] = 'It was the citizens of Casteldine that had turned me into the miserable creature I had become. I swore over my own coffin that I would seek revenge. And so I started. ...'
storyMessage[4] = 'I quickly closed the room where my coffin was. I had something to live for again. Quickly I established a workshop where I developed ideas to assist my revenge plans. ...'
storyMessage[5] = 'Eventually, I started executing my plans, but I was too clumsy and was often caught in the middle of the hanky-panky. I quickly realised I needed someone to help me. ...'
storyMessage[6] = 'And then you turned up. Do you wish to help me sabotage the live of everyone?'
talk_state = 4

elseif talk_state == 4 and msgcontains(msg,'no') then
selfSay('AAAAARGH! YOU ARE JUST LIKE THE OTHERS!')
talk_state = 0

elseif talk_state == 4 and msgcontains(msg,'yes') then
selfSay('Terrific! Your first mission will be an easy one... you will steal something from the fool Alexander. Sneak into his bedroom and look for something valuable... and take it. ...')
story = 7
talk_start = os.clock()
talk_story = os.clock()
storyMessage[7] = 'And by the way, you may enter my workshop anytime. Good luck!'
setPlayerStorageValue(cid,9682,-1)
setPlayerStorageValue(cid,9683,1)
setPlayerStorageValue(cid,9679,1)
talk_state = 0

elseif value3 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 5

elseif talk_state == 5 and msgcontains(msg,'no') then
selfSay('You must steal something valuable from Alexander then.')
talk_state = 0

elseif talk_state == 5 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,6508) >= 1 then
selfSay('Impressive. I bet he saved that for christmas. Now we\'ve made life a little more unpleasant for him. Good!')
setPlayerStorageValue(cid,9683,-1)
setPlayerStorageValue(cid,9684,1)
doPlayerRemoveItem(cid,6508,1)
talk_state = 0
else
selfSay('Lies.')
talk_state = 0
end

--Mission3

elseif value4 == 1 and msgcontains(msg,'mission') then
selfSay('Your next mission will be quite funny, actually. We\'re gonna give Tommy a little surprise. Take this mug and collect ants from some anthill. You should find some around here. ...')
story = 8
talk_start = os.clock()
talk_story = os.clock()
storyMessage[8] = 'Then bring those ants to Tommy\'s shop and plant them somewhere at his desk. In a day or two, he\'ll find his furniture destroyed by these wood eating ants... hahaha!'
setPlayerStorageValue(cid,9684,-1)
setPlayerStorageValue(cid,9685,1)
doPlayerAddItem(cid,3941,1)
talk_state = 0

elseif value5 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 6

elseif talk_state == 6 and msgcontains(msg,'no') then
selfSay('Get the ants from an anthill and plant them inside Tomm\'s shop then.')
talk_state = 0

elseif talk_state == 6 and msgcontains(msg,'yes') then
if tommyvalue == 1 then
selfSay('We\'re such an evil team! Now, that will certainly ruin his economy... badly!')
setPlayerStorageValue(cid,9685,-1)
setPlayerStorageValue(cid,9686,1)
talk_state = 0
else
selfSay('If that was true I would have known.')
talk_state = 0
end

--Mission4

elseif value6 == 1 and msgcontains(msg,'mission') then
selfSay('We have so far made life miserable for Alexander and Tommy... I think we should expand our activity even more. It\'s time to kick up som real fuss. Hehehe. ...')
story = 9
talk_start = os.clock()
talk_story = os.clock()
storyMessage[9] = 'Obtain a crowbar and go to Captain Hack Sparry\'s stupid ship. There you will need to find his telescopes and smash them with the crowbar! He has two, I remember. ...'
storyMessage[10] = 'This way, he won\'t dare sailing since he can\'t see any pirate ships approaching. As a result to this, NO citizens will be able to travel with him!'
talk_state = 0
setPlayerStorageValue(cid,9686,-1)
setPlayerStorageValue(cid,9687,1)

elseif value7 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 7

elseif talk_state == 7 and msgcontains(msg,'no') then
selfSay('Obtain a crowbar and smash Captain Hack Sparry\'s two telescopes then.')
talk_state = 0

elseif talk_state == 7 and msgcontains(msg,'yes') then
if hackvalue1 == 1 and hackvalue2 == 1 then
selfSay('Splendid work. Now an entire city will be unable to travel on the seas for a while.')
setPlayerStorageValue(cid,9687,-1)
setPlayerStorageValue(cid,9688,1)
talk_state = 0
else
selfSay('You are lying to me...')
talk_state = 0
end

--Mission5

elseif value8 == 1 and msgcontains(msg,'mission') then
selfSay('Good, I see the right spirit in you, ' .. getPlayerName(cid) .. '. My next idea is as genious as it is easy. Take this potion, it will be very useful now. ...')
story = 11
talk_start = os.clock()
talk_story = os.clock()
storyMessage[11] = 'There are five mail boxes in Casteldine. This little potion I gave you is a corroding acid. If you pour it into each and every mailbox we\'ll ruin the post. ...'
storyMessage[12] = 'As you understand this will have serious consequences for the citizens of Casteldine. Good luck, once again. I know I can trust you.'
setPlayerStorageValue(cid,9688,-1)
setPlayerStorageValue(cid,9689,1)
doPlayerAddItem(cid,7253,1)
talk_state = 0

elseif value9 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 8

elseif talk_state == 8 and msgcontains(msg,'no') then
selfSay('Pour the acid in all the five mailboxes in Casteldine, then.')
talk_state = 0

--Mission6

elseif talk_state == 8 and msgcontains(msg,'yes') then
if mailvalue1 == 1 and mailvalue2 == 1 and mailvalue3 == 1 and mailvalue4 == 1 and mailvalue5 == 1 then
selfSay('Hahaha! That was good, but I know we can do better. I can see you still have some of the acid left... do you know the post office north of the Ravenclaw Swamp?')
talk_state = 9
else
selfSay('No, you are not done yet.')
talk_state = 0
end

elseif talk_state == 9 and msgcontains(msg,'no') then
selfSay('Well, as I said it\'s north of the Ravenclaw Swamp. Anyway, travel there and pour the acid in those mail boxes too. That way, our little trick will affect even more people!')
setPlayerStorageValue(cid,9689,-1)
setPlayerStorageValue(cid,9690,1)
talk_state = 0

elseif talk_state == 9 and msgcontains(msg,'yes') then
selfSay('Travel there and pour the acid in those mail boxes too. That way, our little trick will affect even more people!')
setPlayerStorageValue(cid,9689,-1)
setPlayerStorageValue(cid,9401,1)
talk_state = 0

elseif value10 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 10

elseif talk_state == 8 and msgcontains(msg,'no') then
selfSay('Pour the acid in the post office\'s mail boxes then.')
talk_state = 0

elseif talk_state == 10 and msgcontains(msg,'yes') then
if mailvalue6 == 1 and mailvalue7 == 1 and mailvalue8 == 1 then
selfSay('I feel so... evil! That is a good feeling. I hope you feel it too. I\'ll save the remainder of the acid, by the way.')
setPlayerStorageValue(cid,9401,-1)
setPlayerStorageValue(cid,9402,1)
doPlayerRemoveItem(cid,7253,1)
talk_state = 0
else
selfSay('No, you are not done yet.')
talk_state = 0
end

--Mission7

elseif value11 == 1 and msgcontains(msg,'mission') then
selfSay('It\'s time for another theft. And not any theft... you\'re actually going to steal something from Castle Dine. One of the king\'s servants owns a very interesting brooch. ...')
story = 12
talk_start = os.clock()
talk_story = os.clock()
storyMessage[12] = 'I don\'t know where this brooch is, but it\'s up to you to find it. Bring it to me as soon as you can, but be careful and don\'t get caught.'
talk_state = 0
setPlayerStorageValue(cid,9402,-1)
setPlayerStorageValue(cid,9403,1)

elseif value12 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 11

elseif talk_state == 11 and msgcontains(msg,'no') then
selfSay('Then go to Castle Dine and find that brooch... and steal it!')
talk_state = 0

elseif talk_state == 11 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,4873) >= 1 then
selfSay('Wow, you have it! I like you more and more, ' .. getPlayerName(cid) .. '. I\'ll take that one, if you don\'t mind.')
setPlayerStorageValue(cid,9403,-1)
setPlayerStorageValue(cid,9404,1)
doPlayerRemoveItem(cid,4873,1)
talk_state = 0
else
selfSay('You have not brought the brooch.')
talk_state = 0
end

--Mission8

elseif value13 == 1 and msgcontains(msg,'mission') then
selfSay('Before we continue with our destructive activity, I must ask you to do something for me. I have heard about some strange... academy. In Celeres. But I couldn\'t find it. ...')
story = 13
talk_start = os.clock()
talk_story = os.clock()
storyMessage[13] = 'Apparently, no local citizens knew its location either. I ask you to find it, I need to know its location for future thoughtlessness... hehehe. Well, I need proof too, of course. ...'
storyMessage[14] = 'Not that I don\'t trust you, but anyway. I heard that the extremely rare chill nettle grows close to the Celerian Academy. Cut me an example from it with an ordinary kitchen knife. ...'
storyMessage[15] = 'For your information, I believe the academy is directly beneath Celeres. Anyway when you find it, return here to me. And don\'t forget to bring the sample.'
setPlayerStorageValue(cid,9404,-1)
setPlayerStorageValue(cid,9405,1)
talk_state = 0

elseif value14 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 12

elseif talk_state == 12 and msgcontains(msg,'no') then
selfSay('Go cut a sample from that chill nettle that is rumoured to grow close to the Celerian Academy then.')
talk_state = 0

elseif talk_state == 12 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,5953) >= 1 then
selfSay('Good. I suppose I can use this information in future plans. Meanwhile you were gone, I had this terrific idea, though. So when you\'re ready, ask me for another mission.')
setPlayerStorageValue(cid,9405,-1)
setPlayerStorageValue(cid,9406,1)
doPlayerRemoveItem(cid,5953,1)
talk_state = 0
else
selfSay('No, you don\'t have it.')
talk_state = 0
end

--Mission9

elseif value15 == 1 and msgcontains(msg,'mission') then
selfSay('So, the entire idea builds upon the fact that King Arturo should live in Celeres, but moved to Casteldine just because he had a castle built for him there. This, I believe, caused envy. ...')
story = 16
talk_start = os.clock()
talk_story = os.clock()
storyMessage[16] = 'We can use this to our advantage. Do you remember the brooch we stole before?'
talk_state = 13

elseif talk_state == 13 and msgcontains(msg,'no') then
selfSay('The one from Castle Dine... well, we\'re going to use that one again. First, you\'re going to commit some crime in Celeres, then "drop" the royal brooch at the crime scene. ...')
story = 17
talk_start = os.clock()
talk_story = os.clock()
storyMessage[17] = 'This will immediately help the sheriff believe that it was someone from the royal family or servants that commited the crime. Together with the envy they bear they\'ll want revenge. ...'
storyMessage[18] = 'I don\'t know how far this can get, but if we\'re lucky they\'ll eventually end up in war! Hahaha! Well, do you understand the first part?'
talk_state = 14

elseif talk_state == 13 and msgcontains(msg,'yes') then
selfSay('Good that you have memory. We\'re going to use that one again. First, you\'re going to commit some crime in Celeres, then "drop" the royal brooch at the crime scene. ...')
story = 17
talk_start = os.clock()
talk_story = os.clock()
storyMessage[17] = 'This will immediately help the sheriff believe that it was someone from the royal family or servants that commited the crime. Together with the envy they bear they\'ll want revenge. ...'
storyMessage[18] = 'I don\'t know how far this can get, but if we\'re lucky they\'ll eventually end up in war! Hahaha! Well, do you understand the first part?'
talk_state = 14

elseif talk_state == 14 and msgcontains(msg,'no') then
selfSay('That must be a joke. You who have proven yourself so loyal... until now, of course. Bah!')
talk_state = 0

elseif talk_state == 14 and msgcontains(msg,'yes') then
selfSay('Alright, then you will need this little disguise kit. It contains the outfit of an amazon. If you wear it while commiting the crime the sheriff will believe Casteldine hired some daredevil amazon to do the job. Are you with me?')
talk_state = 15

elseif talk_state == 15 and msgcontains(msg,'no') then
selfSay('That must be a joke. You who have proven yourself so loyal... until now, of course. Bah!')
talk_state = 0

elseif talk_state == 15 and msgcontains(msg,'yes') then
selfSay('Excellent. Take it. Also, take this rune. Use it on the ground OUTSIDE the depot of Celeres, the citizens will have a surprise. But don\'t forget to wear the amazon outfit. If you lose the kit, you can buy a new one from me.')
talk_state = 0
setPlayerStorageValue(cid,9406,-1)
setPlayerStorageValue(cid,9407,1)
doPlayerAddItem(cid,5086,1)
doPlayerAddItem(cid,2284,1)

elseif value16 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 16

elseif talk_state == 16 and msgcontains(msg,'no') then
selfSay('Go use the rune on the ground outside the Celerian depot then. And don\'t forget to wear the amazon outfit.')
talk_state = 0

elseif talk_state == 16 and msgcontains(msg,'yes') then
if amazonvalue == 1 then
doPlayerAddItem(cid,4873,1)
setPlayerStorageValue(cid,9407,-1)
setPlayerStorageValue(cid,9408,1)
npcHandler:say('Ah, you really did it. Now, we must continue quickly with the next part. Here, take this royal brooch again. Go stand on one of the benches outside the depot and then slip it down behind them. Quickly!')
talk_state = 0
else
talk_state = 0
selfSay('Lies, lies.')
end

elseif value16 == 1 and msgcontains(msg,'kit') then
selfSay('Do you want to buy a new disguise kit from me, for 300 gold coins?')
talk_state = 17

elseif talk_state == 17 and msgcontains(msg,'no') then
selfSay('I assume you still have yours then.')
talk_state = 0

elseif talk_state == 17 and msgcontains(msg,'yes') then
if getPlayerItemCount(cid,2148) >= 300 or
getPlayerItemCount(cid,2152) >= 3 or
getPlayerItemCount(cid,2160) >= 1 then
doPlayerAddItem(cid,5086,1)
doPlayerRemoveMoney(cid,300)
npcHandler:say('Here, take a new one.')
talk_state = 0
else
talk_state = 0
selfSay('Lies, lies.')
end

--Mission10

elseif value17 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 18

elseif talk_state == 18 and msgcontains(msg,'no') then
selfSay('Go plant the royal brooch under the bench outside the Celerian depot. Fast! Before the sheriff gets there.')
talk_state = 0

elseif talk_state == 18 and msgcontains(msg,'yes') then
if broochvalue == 1 then
selfSay('Terrific work. That will certainly put Casteldine into an embarassing situation.')
setPlayerStorageValue(cid,9408,-1)
setPlayerStorageValue(cid,9409,1)
talk_state = 0
else
talk_state = 0
selfSay('No, that\'s not true. I would\'ve known then.')
end

--Mission11

elseif value18 == 1 and msgcontains(msg,'mission') then
selfSay('I thought that we could move onto another city, just to break the habit some. This will cause the government confusion as their suspects are moving around the entire world. ...')
story = 19
talk_start = os.clock()
talk_story = os.clock()
storyMessage[19] = 'I thought about executing this plan in Casteldine, but then I realised it would be too risky seeing that Zertic is quite an aggressive fellow. Therefore, we\'ll do it with Norton instead. ...'
storyMessage[20] = 'Obtain some vials of wine and go to Nortons magic shop in Adanac. There you exchange his mana fluids for fluids of wine. This will be very embarassing for him later. Good luck.'
setPlayerStorageValue(cid,9409,-1)
setPlayerStorageValue(cid,9410,1)
talk_state = 0

elseif value19 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 19

elseif talk_state == 19 and msgcontains(msg,'no') then
selfSay('Exchange Nortons mana fluids for wine, then.')
talk_state = 0

elseif talk_state == 19 and msgcontains(msg,'yes') then
if fluidvalue1 == 1 and fluidvalue2 == 1 and fluidvalue3 == 1 then
selfSay('Hehe, another sinister plan perfectly executed. I bet he\'ll think it\'s some rival of his.')
setPlayerStorageValue(cid,9410,-1)
setPlayerStorageValue(cid,9411,1)
else
selfSay('I don\'t believe you.')
talk_state = 0
end

--Mission12

elseif value20 == 1 and msgcontains(msg,'mission') then
selfSay('Your next mission will involve fire, so I hope you\'re not afraid of it. Are you?')
talk_state = 20

elseif talk_state == 20 and msgcontains(msg,'no') then
selfSay('Good. I want you to buy a fire bug from Freddy the Farmer in the Vast Lands and then travel to the flying carpet near Celeres. Then simply set the wooden hut on fire. ...')
talk_state = 0
story = 21
setPlayerStorageValue(cid,9411,-1)
setPlayerStorageValue(cid,9421,1)
talk_start = os.clock()
talk_story = os.clock()
storyMessage[21] = 'Hopefully, we\'ll scare the owner Lendan so much that he won\'t continue his business. I will be waiting.'

elseif value21 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 21

elseif talk_state == 20 and msgcontains(msg,'yes') then
selfSay('Well, then we can\'t continue.')
talk_state = 0

elseif talk_state == 21 and msgcontains(msg,'no') then
selfSay('Buy a fire bug from Freddy then and set Lendan\'s hut on fire.')
talk_state = 0

elseif talk_state == 21 and msgcontains(msg,'yes') then
if firevalue == 1 then
selfSay('Hahaha! I love this! Once again you have done terrific job, ' .. getPlayerName(cid) .. '.')
talk_state = 0
setPlayerStorageValue(cid,9421,-1)
setPlayerStorageValue(cid,9422,1)
else
talk_state = 0
selfSay('If that was true I would have known.')
end

--Mission13

elseif value22 == 1 and msgcontains(msg,'mission') then
selfSay('I remember that I was told about some recluse living on an island in the Fog Bay. I also heard he disliked Casteldine and the other cities, so I thought: why not contact him? ...')
story = 22
talk_start = os.clock()
talk_story = os.clock()
storyMessage[22] = 'So this is what you are going to do. Seek the island accessable somewhere from the Ravenclaw Swamp and speak with the recluse. Find out whether he\'d like to help us or not.'
talk_state = 0
setPlayerStorageValue(cid,9422,-1)
setPlayerStorageValue(cid,9423,1)

elseif value23 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 22

elseif talk_state == 22 and msgcontains(msg,'no') then
selfSay('Seek the old recluse living on the island accesable somewhere in the Ravenclaw Swamp.')
talk_state = 0

elseif talk_state == 22 and msgcontains(msg,'yes') then
if reclusevalue1 == 1 then
selfSay('Ah, so he was dead already? Well, then he won\'t be of any use to us. Pity.')
talk_state = 0
setPlayerStorageValue(cid,9423,-1)
setPlayerStorageValue(cid,9424,1)
else
selfSay('No, you have not.')
talk_state = 0
end

--Mission14

elseif value24 == 1 and msgcontains(msg,'mission') then
selfSay('Since the recluse was dead, I believe we should seek some other ally. This time, you\'ll have to travel to one of the ice islands and seek a man called Jacob. Speak with him about a pact. ...')
story = 23
talk_start = os.clock()
talk_story = os.clock()
storyMessage[23] = 'Hopefully, he\'ll want to join our business. But remember, it\'s a quite cold place, so I thought - why don\'t you have my old coat? Go down below the workshop and collect it. Then fulfil your mission and return to me afterwards.'
talk_state = 23
setPlayerStorageValue(cid,9424,-1)
setPlayerStorageValue(cid,9425,1)
setPlayerStorageValue(cid,9433,1)
setPlayerStorageValue(cid,9426,1)

elseif value26 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 23

elseif talk_state == 23 and msgcontains(msg,'no') then
selfSay('Speak with Jacob from the ice islands about a pact.')
talk_state = 0

--Mission15

elseif talk_state == 23 and msgcontains(msg,'yes') then
if jacobvalue == 1 then
selfSay('Pity he didn\'t want to join, but we have a problem... someone has informed the stupid sheriff from Celeres about our activity. They appear to know your identy! We must take countermeasures. ...')
story = 24
talk_start = os.clock()
talk_story = os.clock()
storyMessage[24] = 'I think we need to put some magical charm on this hideout. Perhaps something that makes other people miss it or something. I think we could ask the witch living here in the swamp about help. Find her and ask her for a protectionspell.'
setPlayerStorageValue(cid,9426,-1)
setPlayerStorageValue(cid,9427,1)
else
selfSay('I don\'t think you have done it yet.')
talk_state = 0
end

elseif value27 == 1 and msgcontains(msg,'mission') or 
value27 == 1 and msgcontains(msg,'mission') then
selfSay('Have you spoke to Luna and found out if she can help us with the protectionspell?')
talk_state = 24

elseif talk_state == 24 and msgcontains(msg,'no') then
selfSay('Then do so as soon as possible! We don\'t want the sheriff here!')
talk_state = 0

elseif talk_state == 24 and msgcontains(msg,'yes') then
if witchvalue == 1 then
selfSay('Good. So she\'ll do it as soon as she can? Terrific. Then we can proceed with the plans. I have come up with a new one!')
setPlayerStorageValue(cid,9427,-1)
setPlayerStorageValue(cid,9428,1)
else
selfSay('I don\'t think so...')
talk_state = 0
end

--Mission16

elseif value28 == 1 and msgcontains(msg,'mission') then
selfSay('So... until now, we\'re undefeated. But how long will this last? I believe our top priority enemy is the sheriff of Celeres. I am sure you agree, so I decided it\'s time to act. ...')
story = 25
talk_start = os.clock()
talk_story = os.clock()
storyMessage[25] = 'We can\'t kill him and get away unnoticed, so this is how we\'ve gotta do it. Do you know anything about diabolic lava, ' .. getPlayerName(cid) ..'?'
talk_state = 25

elseif talk_state == 25 and msgcontains(msg,'no') then
selfSay('It\'s some sort of cursed lava, which in stiffened condition is able to paralyze people. We must somehow obtain this lava, and then put some of it where the sheriff will walk. ...')
story = 26
talk_start = os.clock()
talk_story = os.clock()
setPlayerStorageValue(cid,9428,-1)
setPlayerStorageValue(cid,9429,1)
storyMessage[26] = 'I thought the steel doorknob to his office would be perfect... but obtaining it will be quite tricky. From what I\'ve heard the only place it actually exists is in Paschendale. ...'
storyMessage[27] = 'Some old necromantic guy built an entire maze just to prevent people from finding it. I want you to travel there and seek this necromancer, kill him and then steal some preserved lava. ...'
storyMessage[28] = 'The easiest way would be to fill an empty vial to the rim. Don\'t worry, this special lava is cold... as ice. You\'ll see. Good luck.'
talk_state = 0

elseif talk_state == 25 and msgcontains(msg,'yes') then
selfSay('Good, then you know that in its stiffened condition it can paralyze people. We must somehow obtain this lava, and then put some of it where the sheriff will walk. ...')
story = 25
talk_start = os.clock()
talk_story = os.clock()
setPlayerStorageValue(cid,9428,-1)
setPlayerStorageValue(cid,9429,1)
storyMessage[26] = 'I thought the steel doorknob to his office would be perfect... but obtaining it will be quite tricky. From what I\'ve heard the only place it actually exists is in Paschendale. ...'
storyMessage[27] = 'Some old necromantic guy built an entire maze just to prevent people from finding it. I want you to travel there and seek this necromancer, kill him and then steal some preserved lava. ...'
storyMessage[28] = 'The easiest way would be to fill an empty vial to the rim. Don\'t worry, this special lava is cold... as ice. You\'ll see. Good luck.'
talk_state = 0

elseif value29 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 26

elseif talk_state == 26 and msgcontains(msg,'no') then
selfSay('Then travel to Paschendale and seek the maze and its diabolic lava. Preserve some of it in an empty vial and pour it on the door knob to the Sheriffs office.')
talk_state = 0

elseif talk_state == 26 and msgcontains(msg,'yes') then
if lavavalue2 == 1 then
selfSay('Excellent work! Now that we have taken care of him, we can continue to destroy, destroy, DESTROY!!!')
setPlayerStorageValue(cid,9429,-1)
setPlayerStorageValue(cid,9430,1)
else
selfSay('No, then I would have known.')
talk_state = 0
end

--Mission17

elseif value30 == 1 and msgcontains(msg,'mission') then
selfSay('It just struck me that we have not paid much attention to Adanac, except that little incident with Norton. And well, to be honest, that didn\'t have very serious consequences. ...')
story = 29
talk_start = os.clock()
talk_story = os.clock()
storyMessage[29] = 'So our next target will be captain Harzon! Why? As a youngster he contributed to the survival of Casteldine during the orcish hordes\' attacks. We will punish him severely for this. ...'
storyMessage[30] = 'The first thing you will have to do is find the technomancer in the Rocky Mountains. Tell him to make you a bomb - he should know how to do it. Then travel to captain Harzons ship. ...'
storyMessage[31] = 'Here you will blow the south-east hull of the boat into pieces!! Have you got that?'
talk_state = 27

elseif talk_state == 27 and msgcontains(msg,'no') then
selfSay('I made it quite clear...')
talk_state = 0

elseif talk_state == 27 and msgcontains(msg,'yes') then
selfSay('Good. I will be waiting. Remember to detonate the bomb in the south-east corner of the downer floor.')
setPlayerStorageValue(cid,9430,-1)
setPlayerStorageValue(cid,9440,1)
talk_state = 0

elseif value40 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 28

elseif talk_state == 28 and msgcontains(msg,'no') then
selfSay('Then ask the technomancer from the Rocky Mountains for a bomb and detonate it in the downmost south-east corner of captain Harzons ship.')
talk_state = 0

elseif talk_state == 28 and msgcontains(msg,'yes') then
if bombvalue == 1 then
selfSay('Haha, hopefully the ship will sink! How hilarious!')
setPlayerStorageValue(cid,9440,-1)
setPlayerStorageValue(cid,9441,1)
talk_state = 0
else
selfSay('I would\'ve heard the explosion if you told the truth!')
talk_state = 0
end

--Mission18

elseif value41 == 1 and msgcontains(msg,'mission') then
selfSay('As you might notice your mission gets harder and harder. I hope you understand that this is only because I find you more and more reliable. Our work is flawless, so why not increase it. ...')
story = 32
talk_start = os.clock()
talk_story = os.clock()
storyMessage[32] = 'Anyway, your next mission will be dangerous. But first, can you imagine the sheer chaos a mother bear would create in the middle of Casteldine? Yes, sheer chaos, as I earlier mentioned! ...'
storyMessage[33] = 'I have some stupid sleeping bear down in the basement. It once tore the wall apart, but now I think it\'s in hibernation. So I thought that we could bring this bear into the middle of Casteldine. ...'
storyMessage[34] = 'You would obviously have a hard time transporting the bear to the city, so instead you could go to the elven town Ashbere north of Celeres and seek an elven guy called Se\'Than. ...'
storyMessage[35] = 'He will probably be able to help you... try asking him for a magical prison or something. When he have told you how to proceed, lead the bear to the Casteldine depot!'
setPlayerStorageValue(cid,9441,-1)
setPlayerStorageValue(cid,9442,1)
setPlayerStorageValue(cid,9459,1)
talk_state = 0

elseif value42 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 29

elseif talk_state == 29 and msgcontains(msg,'no') then
selfSay('Ask Se\'Than from Ashbere how to lead the sleeping mother bear from my basement to the Casteldine depot. I suggest you ask him for a magical prison.')
talk_state = 0

elseif talk_state == 29 and msgcontains(msg,'yes') then
if bearvalue == 1 then
selfSay('I bet the bear will even kill some people! Terrific!')
setPlayerStorageValue(cid,9442,-1)
setPlayerStorageValue(cid,9443,1)
talk_state = 0
else
talk_state = 0
selfSay('No, that has not been done yet.')
end

--Mission19

elseif value43 == 1 and msgcontains(msg,'mission') then
selfSay('So, now I need a potion for some plan I am pondering about. The thing is that I need some sort of slime, that has to be highly poisonous. I remember vaguely that someone told me that it existed some fountain below Casteldine. Look there and fill a vial for me.')
setPlayerStorageValue(cid,9443,-1)
setPlayerStorageValue(cid,9444,1)
talk_state = 0

elseif value44 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 30

elseif talk_state == 30 and msgcontains(msg,'no') then
selfSay('Seek below Casteldine for a place where you can fill a vial with highly poisonous slime.')
talk_state = 0

elseif talk_state == 30 and msgcontains(msg,'yes') and slimevalue2 == -1 then
if slimevalue1 == 1 and slimevalue2 == -1 then
selfSay('Good job. Now go downstairs and pour it into the bucket with the brown solution.')
talk_state = 0
else
selfSay('No, that\'s not true.')
talk_state = 0
end

elseif talk_state == 30 and msgcontains(msg,'yes') and slimevalue2 == 1 then
if slimevalue2 == 1 then
selfSay('Good... I will need that later. Anyway, your next mission will bring you to the ice cold ice islands again...')
talk_state = 0
setPlayerStorageValue(cid,9444,-1)
setPlayerStorageValue(cid,9445,1)
else
selfSay('No, that\'s not true.')
talk_state = 0
end

elseif value45 == 1 and msgcontains(msg,'mission') then
selfSay('Frost dragons, dear ' .. getPlayerName(cid) .. ', are creatures wielding incredible power. If we could find out more about their habits, we could solve their secrets. ...')
story = 33
talk_start = os.clock()
talk_story = os.clock()
storyMessage[36] = 'I personally believe the best way of doing this is to study them in peace, but we do not have enough time to do so. Actually, your mission won\'t involve researching anyway. ...'
storyMessage[37] = 'Instead, you\'re going to retrieve a certain gemstone which I know was lost somewhere at the frost dragons territory below the ice islands. This gemstone wields strong powers. ...'
storyMessage[38] = 'The reason why I mentioned the frost dragons was that meanwhile you were going there, you could just watch how they tend to appear in battle and similar habits. ...'
storyMessage[39] = 'Well, since you\'re going to the frost dragons, you could borrow some cap that fits the outfit I gave you. There\'s one in the chest downstairs. Go get it, and then fulfill the mission.'
setPlayerStorageValue(cid,9445,-1)
setPlayerStorageValue(cid,9446,1)
setPlayerStorageValue(cid,9465,1)
talk_state = 0

elseif value46 == 1 and msgcontains(msg,'mission') then
selfSay('Have you fulfilled your current mission?')
talk_state = 32

elseif talk_state == 32 and msgcontains(msg,'no') then
selfSay('Go look for the valuable gemstone at the frost dragons territory under the ice islands.')
talk_state = 0

elseif talk_state == 32 and msgcontains(msg,'yes') then
if gemvaluescript == 1 and getPlayerItemCount(cid,2146) >= 1 then
selfSay('Ah, thank you! Very good, very good. Well, it looks like you have done an awesome job, ' .. getPlayerName(cid) .. '. For now, I give you time to rest. In some time, you\'ll see that I have come up with new plans though. Return soon, friend.')
talk_state = 0
setPlayerStorageValue(cid,9446,-1)
setPlayerStorageValue(cid,9447,1)
else
talk_state = 0
selfSay('No, you don\'t have the gemstone.')
end

elseif value47 == 1 and msgcontains(msg,'mission') then
selfSay('I don\'t have more plans at the moment. Enjoy the gemstone meanwhile, you can keep it. I am satisfied as long as noone else gets it.')
talk_state = 0

end
return true
end
	
function sayMessage(cid, message, keywords, parameters)     return npcHandler:defaultMessageHandler(cid, message, keywords, parameters) end

function greet(cid, message, keywords, parameters)
valuegreet = getPlayerStorageValue(cid,9683)
if valuegreet == -1 then
selfSay('What do you want me?')
npcHandler.focus = cid
npcHandler.talkStart = os.clock()
else
selfSay('Ah, troublemaker ' .. getPlayerName(cid) .. '. Welcome.')
npcHandler.focus = cid
npcHandler.talkStart = os.clock()
end 
return true
end

function farewell(cid, message, keywords, parameters)    
return 
npcHandler:onFarewell(cid, message, keywords, parameters)
end
-- Keyword handling functions end

keywordHandler:addKeyword({'hi'}, greet, nil)
keywordHandler:addKeyword({'hello'}, greet, nil)
keywordHandler:addKeyword({'hey'}, greet, nil)
keywordHandler:addKeyword({'bye'}, farewell, nil)
keywordHandler:addKeyword({'farewell'}, farewell, nil)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
