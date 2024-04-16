function onUse(cid, item, frompos, item2, topos)
  magpos1 = {x=567,y=286,z=14}
  magpos2 = {x=568,y=286,z=14}
  magpos3 = {x=569,y=286,z=14}
  magpos4 = {x=570,y=286,z=14}
  magpos5 = {x=571,y=286,z=14}
  rand = math.random(100,250)
  
  magpos6 = {x=569,y=285,z=14}
  magpos7 = {x=570,y=285,z=14}
  magpos8 = {x=571,y=285,z=14}
  
  magpos9 = {x=569,y=287,z=14}
  magpos10 = {x=570,y=287,z=14}
  magpos11 = {x=571,y=287,z=14}
  
  magpos12 = {x=571,y=288,z=14}
  magpos13 = {x=570,y=288,z=14}
  
  magpos14 = {x=571,y=289,z=14}
  
  magpos15 = {x=566,y=292,z=14}
  
  hurtpos = {x=567,y=286,z=15}
  
  basin1pos = {x=564,y=292,z=15,stackpos=1}
  basin2pos = {x=565,y=292,z=15,stackpos=1}
  basin3pos = {x=566,y=292,z=15,stackpos=1}
  getbasin1 = getThingfromPos(basin1pos)
  getbasin2 = getThingfromPos(basin2pos)
  getbasin3 = getThingfromPos(basin3pos)
  
  lever1 = {x=570,y=285,z=15,stackpos=1}
  lever2 = {x=570,y=287,z=15,stackpos=1}
  lever3 = {x=570,y=286,z=15,stackpos=1}
  lever4 = {x=570,y=284,z=15,stackpos=1}
  lever5 = {x=570,y=288,z=15,stackpos=1}
  
  getlever1 = getThingfromPos(lever1)
  getlever2 = getThingfromPos(lever2)
  getlever3 = getThingfromPos(lever3)
  getlever4 = getThingfromPos(lever4)
  getlever5 = getThingfromPos(lever5)
    
  if item.itemid == 1945 and item.uid == 7345 then
  doTransformItem(item.uid,item.itemid+1)
  doSendMagicEffect(magpos1,11)
  doSendMagicEffect(magpos2,11)
  doSendMagicEffect(magpos9,11)
  doSendMagicEffect(magpos10,11)
  doSendMagicEffect(magpos12,11)
  
  elseif item.itemid == 1945 and item.uid == 7346 and getlever1.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doSendMagicEffect(magpos1,11)
  doSendMagicEffect(magpos2,11)
  doSendMagicEffect(magpos3,11)
  doSendMagicEffect(magpos10,11)
  doSendMagicEffect(magpos11,11)
  
  elseif item.itemid == 1945 and item.uid == 7347 and getlever2.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doSendMagicEffect(magpos1,11)
  doSendMagicEffect(magpos2,11)
  doSendMagicEffect(magpos6,11)
  doSendMagicEffect(magpos7,11)
  doSendMagicEffect(magpos8,11)
  
  elseif item.itemid == 1945 and item.uid == 7348 and getlever3.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doSendMagicEffect(magpos1,11)
  doSendMagicEffect(magpos2,11)
  doSendMagicEffect(magpos9,11)
  doSendMagicEffect(magpos13,11)
  doSendMagicEffect(magpos14,11)
  
  elseif item.itemid == 1945 and item.uid == 7349 and getlever4.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doSendMagicEffect(magpos15,10)
  doTransformItem(getbasin1.uid,1484)
  doTransformItem(getbasin2.uid,1484)
  doTransformItem(getbasin3.uid,1484)
  
  elseif item.itemid == 1946 then
  doTransformItem(getlever1.uid,1945)
  doTransformItem(getlever2.uid,1945)
  doTransformItem(getlever3.uid,1945)
  doTransformItem(getlever4.uid,1945)
  doTransformItem(getlever5.uid,1945)
  doTeleportThing(cid,hurtpos,0)
  doSendMagicEffect(hurtpos,10)
  doSendMagicEffect(hurtpos,11)
  doSendMagicEffect(hurtpos,15)
  doSendMagicEffect(hurtpos,4)
  doCreatureAddHealth(cid,-rand)
  doSendAnimatedText(hurtpos,rand,180)
  doTransformItem(getbasin1.uid,1485)
  doTransformItem(getbasin2.uid,1485)
  doTransformItem(getbasin3.uid,1485)

  else
  doTeleportThing(cid,hurtpos,0)
  doTransformItem(getlever1.uid,1945)
  doTransformItem(getlever2.uid,1945)
  doTransformItem(getlever3.uid,1945)
  doTransformItem(getlever4.uid,1945)
  doTransformItem(getlever5.uid,1945)
  doSendMagicEffect(hurtpos,10)
  doSendMagicEffect(hurtpos,11)
  doSendMagicEffect(hurtpos,15)
  doSendMagicEffect(hurtpos,4)
  doCreatureAddHealth(cid,-rand)
  doSendAnimatedText(hurtpos,rand,180)
  doTransformItem(getbasin1.uid,1485)
  doTransformItem(getbasin2.uid,1485)
  doTransformItem(getbasin3.uid,1485)
    end
  return 1
end

