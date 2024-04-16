function onUse(cid, item, frompos, item2, topos)

  wallpos = {x=473, y=52, z=5, stackpos=1}
  wallpos2 = {x=473, y=52, z=5}
  getwall = getThingfromPos(wallpos)
  
  if item.itemid == 1945 then
  doRemoveItem(getwall.uid,1)
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1946 then
  doCreateItem(3364,1,wallpos2)
  doTransformItem(item.uid,item.itemid-1)
        
	else
	  doPlayerSay(cid,"You are not beautiful!",16)
	end
	return 1

	end