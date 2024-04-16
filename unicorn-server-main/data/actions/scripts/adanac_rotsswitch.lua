function onUse(cid, item, frompos, item2, topos)
playerpos = getPlayerPosition(cid)
bridge1 = {x=454, y=581, z=10}
bridge2 = {x=455, y=581, z=10}
bridge3 = {x=456, y=581, z=10}

if item.uid == 7002 and item.itemid == 1945 then
doCreateItem(5770,1,bridge1)
doCreateItem(5770,1,bridge2)
doCreateItem(5770,1,bridge3)

doSendMagicEffect(bridge1,14)
doSendMagicEffect(bridge2,14)
doSendMagicEffect(bridge3,14)

doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 7002 and item.itemid == 1946 then

doCreateItem(508,1,bridge1)
doCreateItem(493,1,bridge2)
doCreateItem(509,1,bridge3)

doSendMagicEffect(bridge1,14)
doSendMagicEffect(bridge2,14)
doSendMagicEffect(bridge3,14)

  doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
end