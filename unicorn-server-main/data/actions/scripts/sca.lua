function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7117 then
    queststatus = getPlayerStorageValue(cid,2125)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a stonecutter axe.")
      doPlayerAddItem(cid,2431,1)
      setPlayerStorageValue(cid,2125,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

