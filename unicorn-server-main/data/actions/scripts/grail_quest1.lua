function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7833 then
    queststatus = getPlayerStorageValue(cid,9556)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found an ornamented shield.")
      doPlayerAddItem(cid,2524,1)
      setPlayerStorageValue(cid,9556,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

