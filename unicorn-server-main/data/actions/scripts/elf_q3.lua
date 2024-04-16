function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7125 then
    queststatus = getPlayerStorageValue(cid,2130)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found an ancient scroll.")
      doPlayerAddItem(cid,6119,1)
      setPlayerStorageValue(cid,2130,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

