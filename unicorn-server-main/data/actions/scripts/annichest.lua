-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 2303 then
   		queststatus = getPlayerStorageValue(cid,9653)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a demon armor.")
   			doPlayerAddItem(cid,2494,1)
   			setPlayerStorageValue(cid,9653,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 2304 then
   		queststatus = getPlayerStorageValue(cid,9653)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a magic sword.")
   			doPlayerAddItem(cid,2400,1)
   			setPlayerStorageValue(cid,9653,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 2305 then
   		queststatus = getPlayerStorageValue(cid,9653)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a stonecutter axe.")
   			doPlayerAddItem(cid,2431,1)
   			setPlayerStorageValue(cid,9653,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 2306 then
   		queststatus = getPlayerStorageValue(cid,9653)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a present box.")
   			box = doPlayerAddItem(cid,1990,1)
   			doAddContainerItem(box,2326,1)
   			setPlayerStorageValue(cid,9653,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end
   	return 1
end
