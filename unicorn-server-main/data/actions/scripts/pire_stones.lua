function onUse(cid, item, frompos, item2, topos)

stonepos1 = {x=703, y=465, z=8, stackpos=1}
stonepos2 = {x=716, y=466, z=8, stackpos=1}
stonepos3 = {x=706, y=476, z=8, stackpos=1}
stonepos4 = {x=719, y=478, z=8, stackpos=1}
getstone1 = getThingfromPos(stonepos1)
getstone2 = getThingfromPos(stonepos2)
getstone3 = getThingfromPos(stonepos3)
getstone4 = getThingfromPos(stonepos4)
if item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doRemoveItem(getstone1.uid,1)
doRemoveItem(getstone2.uid,1)
doRemoveItem(getstone3.uid,1)
doRemoveItem(getstone4.uid,1)
elseif item.itemid == 1945 then
doCreateItem(390,1,stonepos1)
doCreateItem(387,1,stonepos2)
doCreateItem(391,1,stonepos3)
doCreateItem(390,1,stonepos4)
doTransformItem(item.uid,item.itemid+1)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

