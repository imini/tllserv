function onUse(cid, item, frompos, item2, topos)
  if item.uid == 9012 then
    queststatus = getPlayerStorageValue(cid,3810)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a map.")
      doPlayerAddItem(cid,1956,1)
      setPlayerStorageValue(cid,3810,1)
    else
      doPlayerSendTextMessage(cid,22,"The bookshelf is empty.")
    end
  end
  return 1
end

