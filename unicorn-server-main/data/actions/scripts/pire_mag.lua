function onUse(cid, item, frompos, item2, topos)

pos = {x=706, y=474, z=6}
if item.itemid == 1945 then
doSendMagicEffect(pos,17)
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doSendMagicEffect(pos,17)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

