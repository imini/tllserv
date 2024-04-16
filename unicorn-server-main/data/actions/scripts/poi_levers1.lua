function onUse(cid, item, frompos, item2, topos)

  if item.itemid == 1945 then
  doTransformItem(item.uid,item.itemid+1)
  doCreatureSay(cid,"You have found the first lever. Go find the others.",16)
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)

  else
  doCreatureSay(cid,"Sorry, not possible.",16)
    end
  return 1
end

