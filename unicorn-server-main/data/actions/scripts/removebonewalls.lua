function onUse(cid, item, frompos, item2, topos)

wall1 = {x=684,y=418,z=13,stackpos=1}
wall2 = {x=685,y=418,z=13,stackpos=1}
wall3 = {x=686,y=418,z=13,stackpos=1}
wall4 = {x=687,y=418,z=13,stackpos=1}
wall5 = {x=688,y=418,z=13,stackpos=1}
wall6 = {x=684,y=419,z=13,stackpos=1}
wall7 = {x=688,y=419,z=13,stackpos=1}
wall8 = {x=684,y=420,z=13,stackpos=1}
wall9 = {x=688,y=420,z=13,stackpos=1}
wall10 = {x=684,y=421,z=13,stackpos=1}
wall11 = {x=688,y=421,z=13,stackpos=1}
wall12 = {x=684,y=422,z=13,stackpos=1}
wall13 = {x=685,y=422,z=13,stackpos=1}
wall14 = {x=686,y=422,z=13,stackpos=1}
wall15 = {x=687,y=422,z=13,stackpos=1}
wall16 = {x=688,y=422,z=13,stackpos=1}
getwall1 = getThingfromPos(wall1)
getwall2 = getThingfromPos(wall2)
getwall3 = getThingfromPos(wall3)
getwall4 = getThingfromPos(wall4)
getwall5 = getThingfromPos(wall5)
getwall6 = getThingfromPos(wall6)
getwall7 = getThingfromPos(wall7)
getwall8 = getThingfromPos(wall8)
getwall9 = getThingfromPos(wall9)
getwall10 = getThingfromPos(wall10)
getwall11 = getThingfromPos(wall11)
getwall12 = getThingfromPos(wall12)
getwall13 = getThingfromPos(wall13)
getwall14 = getThingfromPos(wall14)
getwall15 = getThingfromPos(wall15)
getwall16 = getThingfromPos(wall16)

if item.itemid == 1945 then
doRemoveItem(getwall1.uid,1)
doRemoveItem(getwall2.uid,1)
doRemoveItem(getwall3.uid,1)
doRemoveItem(getwall4.uid,1)
doRemoveItem(getwall5.uid,1)
doRemoveItem(getwall6.uid,1)
doRemoveItem(getwall7.uid,1)
doRemoveItem(getwall8.uid,1)
doRemoveItem(getwall9.uid,1)
doRemoveItem(getwall10.uid,1)
doRemoveItem(getwall11.uid,1)
doRemoveItem(getwall12.uid,1)
doRemoveItem(getwall13.uid,1)
doRemoveItem(getwall14.uid,1)
doRemoveItem(getwall15.uid,1)
doRemoveItem(getwall16.uid,1)
doTransformItem(item.uid,1946)
else
doCreatureSay(cid,"It is stuck in this position.",16)
end
return 1
end
