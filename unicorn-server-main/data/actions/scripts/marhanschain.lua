function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7782 then
    queststatus = getPlayerStorageValue(cid,9701)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found Marhan's woolf tooth chain.")
      doPlayerAddItem(cid,5940,1)
      setPlayerStorageValue(cid,9701,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

