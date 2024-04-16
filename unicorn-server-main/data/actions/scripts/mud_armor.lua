function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7148 then
    queststatus = getPlayerStorageValue(cid,2162)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a dirty doublet in the mud.")
      doPlayerAddItem(cid,2485,1)
      setPlayerStorageValue(cid,2162,1)
    else
      doPlayerSendTextMessage(cid,22,"There is nothing in the mud.")
    end
  end
  return 1
end

