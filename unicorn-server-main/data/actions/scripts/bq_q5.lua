function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7357 then
    queststatus = getPlayerStorageValue(cid,4011)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a stone skin amulet.")
      doPlayerAddItem(cid,2197,1)
      setPlayerStorageValue(cid,4011,1)
      setPlayerStorageValue(cid,3080,-1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

