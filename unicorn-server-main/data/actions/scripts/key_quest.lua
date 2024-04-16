function onUse(cid, item, frompos, item2, topos)
if item.uid == 7847 then
    queststatus = getPlayerStorageValue(cid,9671)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a key ring.")
      doPlayerAddItem(cid,5801,1)
      setPlayerStorageValue(cid,9671,1)
    else
      doPlayerSendTextMessage(cid,22,"You have already taken a key ring.")
    end
  end
return 1
end
