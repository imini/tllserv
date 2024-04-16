function onUse(cid, item, frompos, item2, topos)
   	if item.itemid == 2785 then
		doPlayerFeed(cid,5)
		doCreateItem(2677,3,topos)
		doTransformItem(item.uid, 2786)
		doDecayItem(item.uid)
   	end
 end