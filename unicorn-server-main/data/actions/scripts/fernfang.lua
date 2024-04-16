function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=629,y=801,z=8}
summonpos2 = {x=635,y=799,z=8}
summonpos3 = {x=627,y=798,z=8}
summonpos4 = {x=637,y=803,z=8}

summonpos5 = {x=633,y=803,z=9}
summonpos6 = {x=629,y=803,z=9}
summonpos7 = {x=631,y=810,z=9}

if item.itemid == 1945 then
broadcastMessage("Fernfang has been summoned by dark monks in The Raven Castle.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("War Wolf",summonpos1)
doSummonCreature("War Wolf",summonpos2)
doSummonCreature("War Wolf",summonpos3)
doSummonCreature("War Wolf",summonpos4)
doSummonCreature("War Wolf",summonpos5)
doSummonCreature("War Wolf",summonpos6)
doSummonCreature("Fernfang",summonpos7)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
