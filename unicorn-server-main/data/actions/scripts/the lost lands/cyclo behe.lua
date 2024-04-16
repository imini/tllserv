function onUse(cid, item, frompos, item2, topos)

  doorpos1 = {x=712, y=574, z=14, stackpos=2}
  doorpos2 = {x=713, y=574, z=14, stackpos=3}
  getdoor1 = getThingfromPos(doorpos1)
  getdoor2 = getThingfromPos(doorpos2)
  
  rdoorpos1 = {x=711, y=575, z=14, stackpos=1}
  rdoorpos2 = {x=714, y=575, z=14, stackpos=2}
  rgetdoor1 = getThingfromPos(rdoorpos1)
  rgetdoor2 = getThingfromPos(rdoorpos2)
  
  rcdoorpos1 = {x=711, y=575, z=14}
  rcdoorpos2 = {x=714, y=575, z=14}
  cdoorpos1 = {x=712, y=574, z=14}
  cdoorpos2 = {x=713, y=574, z=14}
  
  if item.itemid == 1945 then
  doRemoveItem(getdoor1.uid,1)
  doRemoveItem(getdoor2.uid,1)
  doCreateItem(5074,1,rcdoorpos1)
  doCreateItem(5074,1,rcdoorpos2)
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1946 then
  doRemoveItem(rgetdoor1.uid,1)
  doRemoveItem(rgetdoor2.uid,1)
  doCreateItem(5074,1,cdoorpos1)
  doCreateItem(5074,1,cdoorpos2)
  doTransformItem(item.uid,item.itemid-1)
        
	else
	  doPlayerSay(cid,"It's stuck.",16)
	end
	return 1

	end