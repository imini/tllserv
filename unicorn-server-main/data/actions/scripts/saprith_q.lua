function onUse(cid, item, frompos, item2, topos)
if item.uid == 7861 then
    queststatus = getPlayerStorageValue(cid,9455)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a report book.")
      doPlayerAddItem(cid,6124,1)
      setPlayerStorageValue(cid,9455,1)
    else
      doPlayerSendTextMessage(cid,22,"The drawer is empty.")
    end
  end
return 1
end
