-- By GriZzm0

function onUse(cid, item, frompos, item2, topos)
	if item.actionid == item2.actionid then
 if item2.itemid == 1209 or item2.itemid == 1212 or item2.itemid == 1231 or item2.itemid == 1234 or item2.itemid == 1249 or item2.itemid == 1252 then
 	doTransformItem(item2.uid,item2.itemid+2)
 elseif item2.itemid == 1210 or item2.itemid == 1213 or item2.itemid == 1232 or item2.itemid == 1235 or item2.itemid == 1250 or item2.itemid == 1253 then
 	doTransformItem(item2.uid,item2.itemid-1)
 elseif item2.itemid == 1211 or item2.itemid == 1233 or item2.itemid == 1251 then
 	doTransformItem(item2.uid,item2.itemid-2)
 end
	elseif item2.itemid >= 1209 and item2.itemid <= 1214 then
 doPlayerSendCancel(cid,"The key does not match.")
	elseif item2.itemid >= 1231 and item2.itemid <= 1236 then
 doPlayerSendCancel(cid,"The key does not match.")
	elseif item2.itemid >= 1249 and item2.itemid <= 1254 then
 doPlayerSendCancel(cid,"The key does not match.")
	else
 return 0
	end
return 1
end