function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=573,y=512,z=3}
summonpos2 = {x=568,y=512,z=3}
summonpos3 = {x=575,y=515,z=3}
summonpos4 = {x=566,y=514,z=3}
summonpos5 = {x=570,y=516,z=3}

if item.itemid == 1945 then
broadcastMessage("The infamous Horned Fox has returned to his minotaur clan near Celeres.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Minotaur Mage",summonpos1)
doSummonCreature("Minotaur Archer",summonpos2)
doSummonCreature("The Horned Fox",summonpos3)
doSummonCreature("Minotaur Guard",summonpos4)
doSummonCreature("Minotaur Mage",summonpos5)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
