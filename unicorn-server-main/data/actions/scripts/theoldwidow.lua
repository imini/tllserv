function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=831,y=870,z=7}
summonpos2 = {x=823,y=862,z=7}
summonpos3 = {x=875,y=882,z=7}
summonpos4 = {x=842,y=864,z=7}
summonpos5 = {x=839,y=867,z=7}

summonpos6 = {x=831,y=851,z=7}
summonpos7 = {x=835,y=843,z=7}
summonpos8 = {x=814,y=846,z=7}
summonpos9 = {x=865,y=863,z=7}

summonpos10 = {x=871,y=845,z=7}
summonpos11 = {x=877,y=848,z=7}
summonpos12 = {x=865,y=847,z=7}

summonpos13 = {x=886,y=852,z=7}
summonpos14 = {x=887,y=860,z=7}

summonpos15 = {x=844,y=884,z=7}
summonpos16 = {x=855,y=879,z=7}
summonpos17 = {x=884,y=891,z=7}

summonpos18 = {x=879,y=874,z=7}
summonpos19 = {x=856,y=843,z=7}
summonpos20 = {x=844,y=847,z=7}
summonpos21 = {x=888,y=873,z=7}

if item.itemid == 1945 then
broadcastMessage("Giant spiders have gathered on the graveyard of Lucifer for their mating season. Beware!", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Giant Spider",summonpos1)
doSummonCreature("Giant Spider",summonpos2)
doSummonCreature("Giant Spider",summonpos3)
doSummonCreature("Giant Spider",summonpos4)
doSummonCreature("Giant Spider",summonpos5)
doSummonCreature("Giant Spider",summonpos6)
doSummonCreature("Giant Spider",summonpos7)
doSummonCreature("Giant Spider",summonpos8)
doSummonCreature("Giant Spider",summonpos9)
doSummonCreature("Old Widow",summonpos10)
doSummonCreature("Giant Spider",summonpos11)
doSummonCreature("Giant Spider",summonpos12)
doSummonCreature("Giant Spider",summonpos13)
doSummonCreature("Giant Spider",summonpos14)
doSummonCreature("Giant Spider",summonpos15)
doSummonCreature("Giant Spider",summonpos16)
doSummonCreature("Giant Spider",summonpos17)
doSummonCreature("Giant Spider",summonpos18)
doSummonCreature("Giant Spider",summonpos19)
doSummonCreature("Giant Spider",summonpos20)
doSummonCreature("Giant Spider",summonpos21)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
