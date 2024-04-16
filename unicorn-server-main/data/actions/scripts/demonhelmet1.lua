--Demon Helmet quest by me
function onUse(cid, item, frompos, item2, topos)
if item.uid == 7001 then
 queststatus = getPlayerStorageValue(cid,7001)
 if queststatus == -1 then
 doPlayerSendTextMessage(cid,22,"You have found a Demon Helmet.")
 doPlayerAddItem(cid,2493,1)
 setPlayerStorageValue(cid,7001,1)
 else
 doPlayerSendTextMessage(cid,22,"It is empty.")
 end
elseif item.uid == 7002 then
 queststatus = getPlayerStorageValue(cid,7002)
 if queststatus == -1 then
 doPlayerSendTextMessage(cid,22,"You have found Steel Boots.")
 doPlayerAddItem(cid,2645,1)
 setPlayerStorageValue(cid,7002,1)
 else
 doPlayerSendTextMessage(cid,22,"It is empty.")
 end
 elseif item.uid == 7003 then
 queststatus = getPlayerStorageValue(cid,7003)
 if queststatus == -1 then
 doPlayerSendTextMessage(cid,22,"You have found a Demon Shield.")
 doPlayerAddItem(cid,2520,1)
 setPlayerStorageValue(cid,7003,1)
 else
 doPlayerSendTextMessage(cid,22,"It is empty.")
 end
end
return 1
end