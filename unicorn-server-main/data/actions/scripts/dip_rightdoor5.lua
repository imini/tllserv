function onUse(cid, item, frompos, item2, topos)
  
  if item.itemid == 1235 then
  doTransformItem(item.uid,1236)
   setPlayerStorageValue(cid,6176,1)
  elseif item.itemid == 1236 then
  doTransformItem(item.uid,1235)
    end
  return 1
end

