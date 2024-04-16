function onUse(cid, item, frompos, item2, topos)

  campfire = {x=663, y=408, z=13, stackpos=1}
getcampfire = getThingfromPos(campfire)
  if item.itemid == 1945 then
  doSendMagicEffect(campfire,15)
  doTransformItem(getcampfire.uid,1423)
  doTransformItem(item.uid,1946)
  elseif item.itemid == 1946 then
  doSendMagicEffect(campfire,15)
  doTransformItem(getcampfire.uid,1421)
  doTransformItem(item.uid,1945)
  else
  doCreatureSay(cid,"You hear a slight rumble, but the lever is too rusty to move.",16)
    end
  return 1
end

