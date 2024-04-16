function onUse(cid, item, frompos, item2, topos)

fallpos1 = {x=460, y=50, z=7}
fallpos2 = {x=459, y=50, z=7}
rfallpos1 = {x=460, y=50, z=7, stackpos=1}
rfallpos2 = {x=459, y=50, z=7, stackpos=1}
getfall1 = getThingfromPos(rfallpos1)
getfall2 = getThingfromPos(rfallpos2)
lever1 = {x=465, y=49, z=7, stackpos=1}
lever2 = {x=466, y=49, z=7, stackpos=1}
lever3 = {x=467, y=49, z=7, stackpos=1}
lever4 = {x=468, y=49, z=7, stackpos=1}
getlever1 = getThingfromPos(lever1)
getlever2 = getThingfromPos(lever2)
getlever3 = getThingfromPos(lever3)
getlever4 = getThingfromPos(lever4)
getrfallpos1 = getThingfromPos(rfallpos1)

stoniepos = {x=461, y=50, z=7, stackpos=1}
stonepos1 = {x=461, y=50, z=7}
getstonie = getThingfromPos(stoniepos)


  if item.itemid == 1945 and getlever1.itemid == 1945 and getlever2.itemid == 1946 and getlever3.itemid == 1946 and getlever4.itemid == 1945 then
    doTransformItem(getrfallpos1.uid,1306)
    doSendMagicEffect(fallpos1,2)
    doSendMagicEffect(fallpos2,2)
    doSendMagicEffect(stonepos1,2)
    doCreateItem(1305,1,fallpos2)
    doTransformItem(getstonie.uid,3651)
    doTransformItem(item.uid,item.itemid+1)
    
  elseif item.itemid == 1946 then
  doTransformItem(getlever1.uid,1945)
  doTransformItem(getlever2.uid,1945)
  doTransformItem(getlever3.uid,1945)
  doTransformItem(getlever4.uid,1945)
  doCreateItem(1353,1,stonepos1)
  doTransformItem(getrfallpos1.uid,3361)
  doRemoveItem(getfall2.uid,1)
  doTransformItem(item.uid,item.itemid-1)
        
	else
	  doPlayerSay(cid,"It seems like the lever is stuck by some sort of mechanism.",16)
	end
	return 1

	end