function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7223 then
    queststatus = getPlayerStorageValue(cid,2717)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found three small emeralds")
      doPlayerAddItem(cid,2149,3)
      setPlayerStorageValue(cid,2717,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

