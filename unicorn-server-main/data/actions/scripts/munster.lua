function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=300,y=394,z=8}
summonpos2 = {x=303,y=396,z=8}
summonpos3 = {x=298,y=397,z=8}
summonpos4 = {x=300,y=395,z=8}
summonpos5 = {x=301,y=395,z=8}
summonpos6 = {x=288,y=412,z=7}
summonpos7 = {x=299,y=416,z=7}
summonpos8 = {x=278,y=421,z=7}
summonpos9 = {x=291,y=435,z=7}
summonpos10 = {x=274,y=441,z=7}
summonpos11 = {x=272,y=449,z=7}
summonpos12 = {x=286,y=451,z=7}
summonpos13 = {x=301,y=448,z=7}
summonpos14 = {x=316,y=440,z=7}
summonpos15 = {x=307,y=432,z=7}
summonpos16 = {x=311,y=419,z=7}
summonpos17 = {x=322,y=426,z=7}
summonpos18 = {x=303,y=413,z=7}
summonpos19 = {x=324,y=440,z=7}
summonpos20 = {x=326,y=433,z=7}
summonpos21 = {x=331,y=431,z=7}
summonpos22 = {x=337,y=432,z=7}

if item.itemid == 1945 then
broadcastMessage("Munster has been sighted in the sewers below Flantan Village.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Cave Rat",summonpos1)
doSummonCreature("Rat",summonpos2)
doSummonCreature("Rat",summonpos3)
doSummonCreature("Munster",summonpos4)
doSummonCreature("Rat",summonpos6)
doSummonCreature("Rat",summonpos7)
doSummonCreature("Rat",summonpos8)
doSummonCreature("Rat",summonpos9)
doSummonCreature("Rat",summonpos10)
doSummonCreature("Rat",summonpos11)
doSummonCreature("Rat",summonpos12)
doSummonCreature("Rat",summonpos13)
doSummonCreature("Rat",summonpos14)
doSummonCreature("Rat",summonpos15)
doSummonCreature("Rat",summonpos16)
doSummonCreature("Rat",summonpos17)
doSummonCreature("Rat",summonpos18)
doSummonCreature("Rat",summonpos19)
doSummonCreature("Rat",summonpos20)
doSummonCreature("Rat",summonpos21)
doSummonCreature("Rat",summonpos22)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
