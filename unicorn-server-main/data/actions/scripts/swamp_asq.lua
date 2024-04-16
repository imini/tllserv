function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7211 then
    queststatus = getPlayerStorageValue(cid,2702)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a vampire shield.")
      doPlayerAddItem(cid,2534,1)
      setPlayerStorageValue(cid,2702,1)
    else
      doPlayerSendTextMessage(cid,22,"The rotten tree is empty.")
    end
  end
  return 1
end

