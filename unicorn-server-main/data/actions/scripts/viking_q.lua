function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7167 then
    queststatus = getPlayerStorageValue(cid,2178)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a viking helmet.")
      doPlayerAddItem(cid,2473,1)
      setPlayerStorageValue(cid,2178,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

