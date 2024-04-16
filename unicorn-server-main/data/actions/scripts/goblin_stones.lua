function onUse(cid, item, frompos, item2, topos)

stone1 = {x=953,y=750,z=15,stackpos=1}
stone2 = {x=954,y=750,z=15,stackpos=1}
getstone1 = getThingfromPos(stone1)
getstone2 = getThingfromPos(stone2)

if item.itemid == 1945 and getstone1.itemid == 1353 then
doRemoveItem(item.uid,1)
doSendMagicEffect(topos,13)
doRemoveItem(getstone1.uid,1)
doRemoveItem(getstone2.uid,1)
doCreatureSay(cid,"You hear rumbling from far away.",16)
else
return 0
end
return 1
end
