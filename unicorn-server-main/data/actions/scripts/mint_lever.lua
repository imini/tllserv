function onUse(cid, item, frompos, item2, topos)

bridge1 = {x=693, y=159, z=12}
bridge2 = {x=693, y=158, z=12}

if item.uid == 7180 and item.itemid == 1945 then
doSendMagicEffect(bridge1,3)
doSendMagicEffect(bridge2,3)
doCreateItem(5768,1,bridge1)
doCreateItem(5769,1,bridge2)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 7180 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doSendMagicEffect(bridge1,3)
doSendMagicEffect(bridge2,3)
doCreateItem(506,1,bridge2)
doCreateItem(507,1,bridge1)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

