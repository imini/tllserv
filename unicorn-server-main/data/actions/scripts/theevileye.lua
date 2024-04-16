function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=933,y=597,z=15}
summonpos2 = {x=937,y=598,z=15}
summonpos3 = {x=952,y=583,z=15}
summonpos4 = {x=954,y=570,z=15}
summonpos5 = {x=966,y=569,z=15}

if item.itemid == 1945 then
broadcastMessage("The Evil Eye has returned to the world in the beholders presence in the depths of Ravenclaw Swamp.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Elder Beholder",summonpos1)
doSummonCreature("Beholder",summonpos2)
doSummonCreature("Elder Beholder",summonpos3)
doSummonCreature("Elder Beholder",summonpos4)
doSummonCreature("The Evil Eye",summonpos5)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
