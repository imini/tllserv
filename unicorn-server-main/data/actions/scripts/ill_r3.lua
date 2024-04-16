function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7307 then
    queststatus = getPlayerStorageValue(cid,3033)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a stone skin amulet.")
      doPlayerAddItem(cid,2197,5)
      setPlayerStorageValue(cid,3033,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

