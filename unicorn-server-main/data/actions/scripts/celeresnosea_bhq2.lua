function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7035 then
    queststatus = getPlayerStorageValue(cid,2024)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a quagmire rod.")
      doPlayerAddItem(cid,2181,1)
      setPlayerStorageValue(cid,2024,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

