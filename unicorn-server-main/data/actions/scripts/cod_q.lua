function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7224 then
    queststatus = getPlayerStorageValue(cid,3934)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a fire axe.")
      doPlayerAddItem(cid,2432,1)
      setPlayerStorageValue(cid,3934,1)
    else
      doPlayerSendTextMessage(cid,22,"The rottening body is empty.")
    end
  end
  return 1
end

