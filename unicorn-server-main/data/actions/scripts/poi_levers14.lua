function onUse(cid, item, frompos, item2, topos)

  earlier = {x=85, y=260, z=13, stackpos=1}
  getearlier = getThingfromPos(earlier)

  if item.itemid == 1945 and getearlier.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doCreatureSay(cid,"You have flipped the fourteenth lever. Now go find the last one.",16)
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)

  else
  doCreatureSay(cid,"The fourteenth lever won't budge... yet.",16)
    end
  return 1
end

