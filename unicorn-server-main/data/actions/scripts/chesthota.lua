
function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5010 then
   		queststatus = getPlayerStorageValue(cid,5011)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found an Amazon Shield.")
   			doPlayerAddItem(cid,2537,1)
   			setPlayerStorageValue(cid,5011,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5011 then
   		queststatus = getPlayerStorageValue(cid,5011)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Helmet of the Ancients.")
   			doPlayerAddItem(cid,2343,1)
   			setPlayerStorageValue(cid,5011,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end
   	return 1
end
