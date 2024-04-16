function onUse(cid, item, frompos, item2, topos)

  doorpos1 = {x=739, y=626, z=11, stackpos=2}
  createpos = {x=739, y=626, z=11}
  getdoor = getThingfromPos(doorpos1)
  
  if item.itemid == 1945 then
  doRemoveItem(getdoor.uid,1)
  doCreateItem(5102,1,createpos)
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1946 then
  doRemoveItem(getdoor.uid,1)
  	doorie = doCreateItem(5101,1,createpos)
  	doSetItemActionId(doorie,1224)
  	 doTransformItem(item.uid,item.itemid-1)
  
        
	else
	  doTransformItem(item.uid,item.itemid-1)
	end
	return 1

	end