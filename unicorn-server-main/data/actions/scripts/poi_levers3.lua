function onUse(cid, item, frompos, item2, topos)

  earlier = {x=92, y=285, z=13, stackpos=1}
  getearlier = getThingfromPos(earlier)

  if item.itemid == 1945 and getearlier.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doCreatureSay(cid,"You have flipped the third lever. Now go find the others.",16)
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)

  else
  doCreatureSay(cid,"The third lever won't budge... yet.",16)
    end
  return 1
end

