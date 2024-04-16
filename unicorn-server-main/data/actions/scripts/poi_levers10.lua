function onUse(cid, item, frompos, item2, topos)

  earlier = {x=129, y=270, z=14, stackpos=1}
  getearlier = getThingfromPos(earlier)

  if item.itemid == 1945 and getearlier.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doCreatureSay(cid,"You have flipped the tenth lever. Now go find the others.",16)
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)

  else
  doCreatureSay(cid,"The tenth lever won't budge... yet.",16)
    end
  return 1
end

