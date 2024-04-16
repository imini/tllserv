function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=171,y=479,z=10}
summonpos2 = {x=174,y=478,z=10}
summonpos3 = {x=173,y=482,z=10}
summonpos4 = {x=168,y=479,z=10}
summonpos5 = {x=165,y=480,z=10}

if item.itemid == 1945 then
broadcastMessage("The infamous ghoul has summoned his apprentice to assist him on Flantania Isle.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Minotaur",summonpos1)
doSummonCreature("Minotaur",summonpos2)
doSummonCreature("Apprentice Sheng",summonpos3)
doSummonCreature("Minotaur",summonpos4)
doSummonCreature("Minotaur",summonpos5)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
