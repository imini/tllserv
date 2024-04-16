function onUse(cid, item, frompos, item2, topos)

  oilpos = {x=79, y=285, z=11, stackpos=1}
  tilepos = {x=77, y=290, z=11}
  getoil = getThingfromPos(oilpos)
  
  if item.itemid == 1945 and getoil.itemid == 2025 and getoil.type == 11 then
  doTransformItem(item.uid,item.itemid+1)
  doCreateItem(5770,1,tilepos)
  
  elseif item.itemid == 1946 then
  doCreateItem(493,1,tilepos)
doTransformItem(item.uid,item.itemid-1)
  else
  doCreatureSay(cid,"The lever is too rusty to budge.",16)
    end
  return 1
end

