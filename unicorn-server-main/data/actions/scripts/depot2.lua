function checkDepot(cid, item, pos)
depotcount = doGetDepotCount(cid, 1)
              if depotcount == 1 then
				doPlayerSendTextMessage(cid, 20, "Your depot contains 1 item.")
			else
				doPlayerSendTextMessage(cid, 20, "Your depot contains "..depotcount.." items.")
		
		
		end
	
	return 1
end
function onWalkIn(cid, item, topos)
checkDepot(cid, item, topos)
if item.itemid == 446 then
doTransformItem(item.uid, 447)
end
if item.itemid == 416 then
doTransformItem(item.uid, 417)
	end
if item.itemid == 426 then
doTransformItem(item.uid, 425)
end
if item.itemid == 3216 then
doTransformItem(item.uid, 3217)
end
return 1
end
function onWalkOut(cid2, item, frompos)
	if item.itemid == 447 then
		doTransformItem(item.uid, 446)
	end
	if item.itemid == 417 then
		doTransformItem(item.uid, 416)
	end
	if item.itemid == 425 then
		doTransformItem(item.uid, 426)
	end
if item.itemid == 3217 then
doTransformItem(item.uid, 3216)
end
	return 1
end

