function onUse(cid, item, frompos, item2, topos)

ladder1 = {x=195,y=26,z=9,stackpos=0}
ladder11 = {x=195,y=26,z=9,stackpos=253}
ladder2 = {x=196,y=26,z=9,stackpos=0}
ladder22 = {x=196,y=26,z=9,stackpos=253}
gethuman1 = getThingfromPos(ladder11)
gethuman2 = getThingfromPos(ladder22)
getladder1 = getThingfromPos(ladder1)
getladder2 = getThingfromPos(ladder2)

if item.itemid == 1945 and gethuman2.itemid > 0 and gethuman1.itemid > 0 then
doTransformItem(getladder1.uid,408)
doTransformItem(getladder2.uid,408)
doMoveCreature(gethuman1.uid,2)
doMoveCreature(gethuman2.uid,2)
doTransformItem(item.uid,1946)

elseif item.itemid == 1945 and gethuman1.itemid > 0 then
doTransformItem(getladder1.uid,408)
doTransformItem(getladder2.uid,408)
doMoveCreature(gethuman1.uid,2)
doTransformItem(item.uid,1946)

elseif item.itemid == 1945 and gethuman2.itemid > 0 then
doTransformItem(getladder1.uid,408)
doTransformItem(getladder2.uid,408)
doMoveCreature(gethuman2.uid,2)
doTransformItem(item.uid,1946)

elseif item.itemid == 1946 then
doTransformItem(item.uid,1945)
doTransformItem(getladder1.uid,407)
doTransformItem(getladder2.uid,407)


else
doTransformItem(getladder1.uid,408)
doTransformItem(getladder2.uid,408)
doTransformItem(item.uid,1946)
end
return 1
end

