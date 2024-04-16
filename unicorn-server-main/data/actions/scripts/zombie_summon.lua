function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,9669)
gvalue1 = getGlobalStorageValue(10505)
gvalue2 = getGlobalStorageValue(10506)
gvalue3 = getGlobalStorageValue(10507)
gvalue4 = getGlobalStorageValue(10508)
gvalue5 = getGlobalStorageValue(10509)
summonpos1 = {x=778,y=804,z=12}
summonpos2 = {x=780,y=804,z=12}
summonpos3 = {x=782,y=804,z=12}
summonpos4 = {x=784,y=805,z=12}
summonpos5 = {x=784,y=807,z=12}
summonpos6 = {x=784,y=809,z=12}
summonpos7 = {x=784,y=811,z=12}
summonpos8 = {x=784,y=813,z=12}
summonpos9 = {x=780,y=815,z=12}
summonpos10 = {x=782,y=815,z=12}
summonpos11 = {x=784,y=815,z=12}

if value == -1 and gvalue1 == -1 and item.itemid == 1945 and
gvalue2 == -1 and
gvalue3 == -1 and
gvalue4 == -1 and
gvalue5 == -1 then
doSummonCreature("Zombie",summonpos1)
doSummonCreature("Zombie",summonpos2)
doSummonCreature("Zombie",summonpos3)
setGlobalStorageValue(10505,1)
doTransformItem(item.uid,1946)

elseif value == -1 and gvalue1 == 1 and item.itemid == 1945 and
gvalue2 == -1 and
gvalue3 == -1 and
gvalue4 == -1 and
gvalue5 == -1 then
doSummonCreature("Zombie",summonpos9)
doSummonCreature("Zombie",summonpos10)
doSummonCreature("Zombie",summonpos11)
setGlobalStorageValue(10506,1)
doTransformItem(item.uid,1946)

elseif value == -1 and gvalue1 == 1 and item.itemid == 1945 and
gvalue2 == 1 and
gvalue3 == -1 and
gvalue4 == -1 and
gvalue5 == -1 then
doSummonCreature("Zombie",summonpos4)
doSummonCreature("Zombie",summonpos5)
doSummonCreature("Zombie",summonpos6)
doSummonCreature("Zombie",summonpos7)
doSummonCreature("Zombie",summonpos8)
setGlobalStorageValue(10507,1)
doTransformItem(item.uid,1946)

elseif value == -1 and gvalue1 == 1 and item.itemid == 1945 and
gvalue2 == 1 and
gvalue3 == 1 and
gvalue4 == -1 and
gvalue5 == -1 then
doSummonCreature("Zombie",summonpos9)
doSummonCreature("Zombie",summonpos10)
doSummonCreature("Zombie",summonpos11)
doSummonCreature("Zombie",summonpos1)
doSummonCreature("Zombie",summonpos2)
doSummonCreature("Zombie",summonpos3)
setGlobalStorageValue(10508,1)
doTransformItem(item.uid,1946)

elseif value == -1 and gvalue1 == 1 and item.itemid == 1945 and
gvalue2 == 1 and
gvalue3 == 1 and
gvalue4 == 1 and
gvalue5 == -1 then
doSummonCreature("Zombie",summonpos9)
doSummonCreature("Zombie",summonpos10)
doSummonCreature("Zombie",summonpos11)
doSummonCreature("Zombie",summonpos1)
doSummonCreature("Zombie",summonpos2)
doSummonCreature("Zombie",summonpos3)
doSummonCreature("Zombie",summonpos4)
doSummonCreature("Zombie",summonpos5)
doSummonCreature("Zombie",summonpos6)
doSummonCreature("Zombie",summonpos7)
doSummonCreature("Zombie",summonpos8)
setGlobalStorageValue(10509,1)
doTransformItem(item.uid,1946)
setPlayerStorageValue(cid,9669,1)

elseif value == 1 then
return 0

elseif item.itemid == 1946 then
return 0
else
return 0
end
return 1
end


