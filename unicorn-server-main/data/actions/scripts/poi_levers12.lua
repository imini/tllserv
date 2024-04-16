function onUse(cid, item, frompos, item2, topos)

  earlier = {x=109, y=252, z=15, stackpos=1}
  getearlier = getThingfromPos(earlier)

  if item.itemid == 1945 and getearlier.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doCreatureSay(cid,"You have flipped the twelth lever. Now go find the others.",16)
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)

  else
  doCreatureSay(cid,"The twelth lever won't budge... yet.",16)
    end
  return 1
end

