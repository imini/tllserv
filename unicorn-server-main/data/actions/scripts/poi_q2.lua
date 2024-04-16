function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7481 then
    queststatus = getPlayerStorageValue(cid,4032)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found frozen starlight.")
      doPlayerAddItem(cid,2361,1)
      setPlayerStorageValue(cid,4032,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

