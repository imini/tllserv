function onUse(cid, item, frompos, item2, topos)

if item.uid == 9000 and item.itemid == 1225 then
doTransformItem(item.uid,item.itemid+1)
doMovePlayer(cid,2)
else
return 0
end
return 1
end

function onWalkOut(cid, item, frompos)

doorpos = {x=488, y=603, z=7, stackpos=1}

if item.uid == 9001 and item.itemid == 724 then
doTransformItem(doorpos.uid,doorpos.itemid+1)

else
return 0
end
return 1
end