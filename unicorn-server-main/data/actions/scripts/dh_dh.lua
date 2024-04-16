function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7089 then
    queststatus = getPlayerStorageValue(cid,2102)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a demon helmet.")
      doPlayerAddItem(cid,2493,1)
      setPlayerStorageValue(cid,2102,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

