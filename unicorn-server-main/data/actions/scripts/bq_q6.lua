function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7358 then
    queststatus = getPlayerStorageValue(cid,4010)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a tower shield.")
      doPlayerAddItem(cid,2528,1)
      setPlayerStorageValue(cid,4010,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

