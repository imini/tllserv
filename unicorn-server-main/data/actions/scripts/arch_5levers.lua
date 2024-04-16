function onUse(cid, item, frompos, item2, topos)
  lever1 = {x=206, y=191, z=11, stackpos=2}
  lever2 = {x=207, y=191, z=11, stackpos=2}
  lever3 = {x=208, y=191, z=11, stackpos=2}
  lever4 = {x=209, y=191, z=11, stackpos=2}
  getlever1 = getThingfromPos(lever1)
   getlever2 = getThingfromPos(lever2)
    getlever3 = getThingfromPos(lever3)
     getlever4 = getThingfromPos(lever4)
     
  fount1 = {x=206, y=197, z=11, stackpos=1}  
  fount2 = {x=207, y=197, z=11, stackpos=1} 
  fount3 = {x=206, y=198, z=11, stackpos=1} 
  fount4 = {x=207, y=198, z=11, stackpos=1} 
  getfount1 = getThingfromPos(fount1)
   getfount2 = getThingfromPos(fount2)
    getfount3 = getThingfromPos(fount3)
     getfount4 = getThingfromPos(fount4)  
  leverposs = {x=topos.x, y=topos.y, z=topos.z}
  leverpos = {x=topos.x, y=topos.y, z=topos.z, stackpos=2}
  getlever = getThingfromPos(leverpos)
  
  if item.itemid == 1945 and getlever1.itemid == 1945 and getlever2.itemid == 1945 and getlever3.itemid == 1946 and getlever4.itemid == 1945 then
  doRemoveItem(getlever.uid,1)
  doRemoveItem(getfount1.uid,1)
  doRemoveItem(getfount2.uid,1)
  doRemoveItem(getfount3.uid,1)
  doRemoveItem(getfount4.uid,1)
  doSendMagicEffect(leverposs,13)
  doTransformItem(item.uid,item.itemid+1)
 doTransformItem(getlever1.uid,1945)
  doTransformItem(getlever2.uid,1945)
   doTransformItem(getlever3.uid,1945)
 doTransformItem(getlever4.uid,1945)
 
 elseif item.itemid == 1946 then
 doTransformItem(item.uid,1945)
  else
  doCreatureSay(cid,"It is stuck.",16)
    end
  return 1
end

