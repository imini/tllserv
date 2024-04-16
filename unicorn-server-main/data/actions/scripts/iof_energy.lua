function onStepIn(cid, item, topos)

creature = {x=410, y=576, z=9}

player = getPlayerPosition(cid)

if item.uid == 7054 and item.itemid == 426 then
doSendMagicEffect(creature,11)
setPlayerStorageValue(cid,2049,1)
doCreatureSay(cid,"Your soul is enchanted by energy.",16)
doTransformItem(item.uid,item.itemid-1)
else
return 0
end
return 1
end

function onStepOut(cid, item, frompos)

if item.uid == 7054 and item.itemid == 425 then
doTransformItem(item.uid,item.itemid+1)
else
return 0
end
return 1
end