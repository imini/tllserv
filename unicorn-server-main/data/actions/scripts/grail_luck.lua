function onUse(cid, item, frompos, item2, topos)

magpos = {x=203,y=81,z=13}
leverpos = {x=203,y=81,z=13,stackpos=1}
doorpos1 = {x=203,y=83,z=12,stackpos=1}
doorpos2 = {x=204,y=83,z=12,stackpos=1}
summonpos1 = {x=201,y=81,z=13}
summonpos2 = {x=203,y=79,z=13}
summonpos3 = {x=205,y=81,z=13}
summonpos4 = {x=203,y=83,z=13}
rand = math.random(1,13)
getlever = getThingfromPos(leverpos)
getdoor1 = getThingfromPos(doorpos1)
getdoor2 = getThingfromPos(doorpos2)
value = getPlayerStorageValue(cid,9555)

if rand == 11 and getlever.itemid == 1945 then
doTransformItem(getlever.uid,1946)
doSendMagicEffect(magpos,17)
doSetItemActionId(getdoor1.uid,9555)
doSetItemActionId(getdoor2.uid,9555)
doCreatureSay(cid,"You were lucky.",16)

elseif getlever.itemid == 1946 then
doCreatureSay(cid,"It is over.",16)
else
doCreatureSay(cid,"You failed.",16)
doSummonCreature("Demon Skeleton",summonpos1)
doSummonCreature("Ghost",summonpos2)
doSummonCreature("Demon Skeleton",summonpos3)
doSummonCreature("Ghost",summonpos4)
end
return 1
end
