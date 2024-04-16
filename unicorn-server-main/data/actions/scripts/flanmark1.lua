function onUse(cid, item, frompos, item2, topos)

fountain1 = {x=370,y=398,z=12,stackpos=1}
fountain2 = {x=371,y=398,z=12,stackpos=1}
fountain3 = {x=370,y=399,z=12,stackpos=1}
fountain4 = {x=371,y=399,z=12,stackpos=1}
fountain5 = {x=375,y=398,z=12,stackpos=1}
fountain6 = {x=375,y=399,z=12,stackpos=1}
fountain7 = {x=376,y=398,z=12,stackpos=1}
fountain8 = {x=376,y=399,z=12,stackpos=1}
playerpos = {x=373,y=397,z=12,stackpos=253}
getplayer = getThingfromPos(playerpos)
getfountain1 = getThingfromPos(fountain1)
getfountain2 = getThingfromPos(fountain2)
getfountain3 = getThingfromPos(fountain3)
getfountain4 = getThingfromPos(fountain4)
getfountain5 = getThingfromPos(fountain5)
getfountain6 = getThingfromPos(fountain6)
getfountain7 = getThingfromPos(fountain7)
getfountain8 = getThingfromPos(fountain8)
playerpos1 = getPlayerPosition(cid)

if getGlobalStorageValue(10931) ~= 1 and getplayer.itemid > 0 then
doTransformItem(getfountain1.uid,3733)
doTransformItem(getfountain2.uid,3734)
doTransformItem(getfountain3.uid,3735)
doTransformItem(getfountain4.uid,3736)
doTransformItem(getfountain5.uid,3733)
doTransformItem(getfountain6.uid,3735)
doTransformItem(getfountain7.uid,3734)
doTransformItem(getfountain8.uid,3736)
doSendMagicEffect(playerpos1,14)
setGlobalStorageValue(10931,1)
doCreatureSay(cid,"CREEEAK",16)

else
return 1
end
return 1
end