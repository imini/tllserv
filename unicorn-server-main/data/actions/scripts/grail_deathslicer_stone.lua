function onUse(cid, item, frompos, item2, topos)

pos1 = {x=195,y=57,z=15}
pos11 = {x=195,y=57,z=15,stackpos=1}
getpos1 = getThingfromPos(pos11)

pos2 = {x=207,y=57,z=15}
pos22 = {x=207,y=57,z=15,stackpos=1}
getpos2 = getThingfromPos(pos22)

pos3 = {x=207,y=69,z=15}
pos33 = {x=207,y=69,z=15,stackpos=1}
getpos3 = getThingfromPos(pos33)

pos4 = {x=195,y=69,z=15}
pos44 = {x=195,y=69,z=15,stackpos=1}
getpos4 = getThingfromPos(pos44)

if item.itemid == 1945 and item.uid == 7828 then
doCreateItem(1285,1,pos1)
doTransformItem(item.uid,1946)

elseif item.itemid == 1946 and item.uid == 7828 then
doRemoveItem(getpos1.uid,1)
doTransformItem(item.uid,1945)


elseif item.itemid == 1945 and item.uid == 7829 then
doCreateItem(1285,1,pos2)
doTransformItem(item.uid,1946)

elseif item.itemid == 1946 and item.uid == 7829 then
doRemoveItem(getpos2.uid,1)
doTransformItem(item.uid,1945)


elseif item.itemid == 1945 and item.uid == 7830 then
doCreateItem(1285,1,pos3)
doTransformItem(item.uid,1946)

elseif item.itemid == 1946 and item.uid == 7830 then
doRemoveItem(getpos3.uid,1)
doTransformItem(item.uid,1945)


elseif item.itemid == 1945 and item.uid == 7831 then
doCreateItem(1285,1,pos4)
doTransformItem(item.uid,1946)

elseif item.itemid == 1946 and item.uid == 7831 then
doRemoveItem(getpos4.uid,1)
doTransformItem(item.uid,1945)
else
return 0
end
return 1
end