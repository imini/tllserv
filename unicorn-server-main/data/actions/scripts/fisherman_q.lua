function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7299 then
    queststatus = getPlayerStorageValue(cid,5056)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a giant ruby and a few savings.")
      doPlayerAddItem(cid,2156,1)
      doPlayerAddItem(cid,2152,6)
      setPlayerStorageValue(cid,5056,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

