function onUse(cid, item, frompos, item2, topos)
  altarpos = {x=806, y=860, z=7, stackpos=1}
  altarpos1 = {x=806, y=860, z=7}
  createbars = {x=806, y=860, z=7}
  lever = {x=778, y=899, z=10, stackpos=2}
  getlever = getThingfromPos(lever)
  getaltar = getThingfromPos(altarpos)
  magpos1 = {x=777, y=898, z=10}
  magpos2 = {x=778, y=898, z=10}
  magpos3 = {x=779, y=898, z=10}
  magpos4 = {x=777, y=899, z=10}
  magpos5 = {x=778, y=899, z=10}
  magpos6 = {x=779, y=899, z=10} 
  magpos7 = {x=776, y=900, z=10}
  magpos8 = {x=777, y=900, z=10}
  magpos9 = {x=778, y=900, z=10}
  magpos10 = {x=779, y=900, z=10}
  magpos11 = {x=780, y=900, z=10} 
  magpos12 = {x=776, y=901, z=10}
  magpos13 = {x=777, y=901, z=10}
  magpos14 = {x=778, y=901, z=10}
  magpos15 = {x=779, y=901, z=10}
  magpos16 = {x=780, y=901, z=10} 
  magpos17 = {x=776, y=902, z=10}
  magpos18 = {x=777, y=902, z=10}
  magpos19 = {x=778, y=902, z=10}
  magpos20 = {x=779, y=902, z=10}
  magpos21 = {x=780, y=902, z=10}
  magpos22 = {x=777, y=903, z=10}
  magpos23 = {x=778, y=903, z=10}
  magpos24 = {x=779, y=903, z=10}
  
  stor1 = getPlayerStorageValue(cid,3060)
  stor2 = getPlayerStorageValue(cid,3061)
  stor3 = getPlayerStorageValue(cid,3062)
  stor4 = getPlayerStorageValue(cid,3063)
  stor5 = getPlayerStorageValue(cid,3064)
  stor6 = getPlayerStorageValue(cid,3065)
  stor7 = getPlayerStorageValue(cid,3066)
  
  if item.itemid == 1945 and stor1 == -1 then
  doMoveCreature(cid,2)
  doSendMagicEffect(magpos1,5)
  doSendMagicEffect(magpos2,5)
  doSendMagicEffect(magpos3,5)
  doSendMagicEffect(magpos4,5)
  doSendMagicEffect(magpos5,5)
  doSendMagicEffect(magpos6,5)
  doCreatureSay(cid,"The lever is rusty. You won't be able to move it, unless you pull harder!",16)
  setPlayerStorageValue(cid,3060,1)
  
  elseif item.itemid == 1945 and stor1 == 1 and stor2 == -1 then 
  doMoveCreature(cid,2)
  doSendMagicEffect(magpos1,5)
  doSendMagicEffect(magpos2,5)
  doSendMagicEffect(magpos3,5)
  doSendMagicEffect(magpos4,5)
  doSendMagicEffect(magpos5,5)
  doSendMagicEffect(magpos6,5)
  doCreatureSay(cid,"You hear a faint creaking sound.",16)
  setPlayerStorageValue(cid,3061,1)
  
  elseif item.itemid == 1945 and stor2 == 1 and stor3 == -1 then 
  doMoveCreature(cid,2)
  doSendMagicEffect(magpos1,5)
  doSendMagicEffect(magpos2,5)
  doSendMagicEffect(magpos3,5)
  doSendMagicEffect(magpos4,5)
  doSendMagicEffect(magpos5,5)
  doSendMagicEffect(magpos6,5)
  doCreatureSay(cid,"The lever moved one inch.",16)
  setPlayerStorageValue(cid,3062,1)
  
  elseif item.itemid == 1945 and stor3 == 1 and stor4 == -1 then 
  doMoveCreature(cid,2)
  doSendMagicEffect(magpos1,5)
  doSendMagicEffect(magpos2,5)
  doSendMagicEffect(magpos3,5)
  doSendMagicEffect(magpos4,5)
  doSendMagicEffect(magpos5,5)
  doSendMagicEffect(magpos6,5)
  doCreatureSay(cid,"You hear a slight rumbling from far away.",16)
  setPlayerStorageValue(cid,3063,1)
  
  elseif item.itemid == 1945 and stor4 == 1 and stor5 == -1 then 
  doMoveCreature(cid,2)
  doSendMagicEffect(magpos1,5)
  doSendMagicEffect(magpos2,5)
  doSendMagicEffect(magpos3,5)
  doSendMagicEffect(magpos4,5)
  doSendMagicEffect(magpos5,5)
  doSendMagicEffect(magpos6,5)
  doCreatureSay(cid,"The rumbling increases.",16)
  setPlayerStorageValue(cid,3064,1)
  
  elseif item.itemid == 1945 and stor5 == 1 and stor6 == -1 then 
  doMoveCreature(cid,2)
  doSendMagicEffect(magpos1,5)
  doSendMagicEffect(magpos2,5)
  doSendMagicEffect(magpos3,5)
  doSendMagicEffect(magpos4,5)
  doSendMagicEffect(magpos5,5)
  doSendMagicEffect(magpos6,5)
  doCreatureSay(cid,"A malicious laughter echoes between the cave walls.",16)
  setPlayerStorageValue(cid,3065,1)
  
  elseif item.itemid == 1945 and stor6 == 1 and stor7 == -1 then 
  doMoveCreature(cid,2)
  doSendMagicEffect(magpos1,5)
  doSendMagicEffect(magpos2,5)
  doSendMagicEffect(magpos3,5)
  doSendMagicEffect(magpos4,5)
  doSendMagicEffect(magpos5,5)
  doSendMagicEffect(magpos6,5)
  doCreatureSay(cid,"An unendurable pain begins to spread through your body and you feel almost drawn to the last pull.",16)
  setPlayerStorageValue(cid,3066,1)
  
  elseif item.itemid == 1945 and stor7 == 1 then 
  doSendMagicEffect(magpos1,5)
  doSendMagicEffect(magpos2,5)
  doSendMagicEffect(magpos3,5)
  doSendMagicEffect(magpos4,5)
  doSendMagicEffect(magpos5,5)
  doSendMagicEffect(magpos6,5)
  doSendMagicEffect(magpos7,5)
  doSendMagicEffect(magpos8,5)
  doSendMagicEffect(magpos9,5)
  doSendMagicEffect(magpos10,5)
  doSendMagicEffect(magpos11,5)
  doSendMagicEffect(magpos12,5)
  doSendMagicEffect(magpos13,5)
  doSendMagicEffect(magpos14,5)
  doSendMagicEffect(magpos15,5)
  doSendMagicEffect(magpos16,5)
  doSendMagicEffect(magpos17,5)
  doSendMagicEffect(magpos18,5)
  doSendMagicEffect(magpos19,5)
  doSendMagicEffect(magpos20,5)
  doSendMagicEffect(magpos21,5)
  doSendMagicEffect(magpos22,5)
  doSendMagicEffect(magpos23,5)
  doSendMagicEffect(magpos24,5)
  doCreatureSay(cid,"It seems like all hell breaks loose. Immense rumbling sounds can be heard from the surface. Something is happening!",16)
  doRemoveItem(getlever.uid,1)
  doRemoveItem(getaltar.uid,1)
  doCreateItem(430,1,createbars)
  doSendMagicEffect(createbars,5)
  doSendMagicEffect(altarpos1,5)
  setPlayerStorageValue(cid,3060,-1)
  setPlayerStorageValue(cid,3061,-1)
  setPlayerStorageValue(cid,3062,-1)
  setPlayerStorageValue(cid,3064,-1)
  setPlayerStorageValue(cid,3063,-1)
  setPlayerStorageValue(cid,3065,-1)
  setPlayerStorageValue(cid,3066,-1)
  
    end
  return 1
end

