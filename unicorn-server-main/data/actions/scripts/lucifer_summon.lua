function onUse(cid, item, frompos, item2, topos)
  checkpos = {x=821, y=848, z=8, stackpos=1}
  lucifer = {x=821, y=852, z=8, stackpos=253}
  newpos = {x=806, y=858, z=8}
  getcheck = getThingfromPos(checkpos)
  getlucifer = getThingfromPos(lucifer)
  
  if item.uid == 7331 and getcheck.itemid == 3650 then
  doTransformItem(getcheck.uid,3949)
  doTeleportThing(0,getlucifer.uid,newpos,0)
  doSendMagicEffect(newpos,17)
  doCreatureSay(cid,"You have awoken Lucifer himself. Run for your life!",16)
  
 else
 doCreatureSay(cid,"Lucifer is either dead, which is quite unlikely, or not in the coffin.",16)
    end
  return 1
end

