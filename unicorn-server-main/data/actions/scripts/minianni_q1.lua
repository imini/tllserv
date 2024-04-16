function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7909 then
    queststatus = getPlayerStorageValue(cid,9659)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have a ring of healing.")
      doPlayerAddItem(cid,2214,1)
      setPlayerStorageValue(cid,9659,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end

  elseif item.uid == 7908 then
    queststatus = getPlayerStorageValue(cid,9660)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have a fire sword.")
      doPlayerAddItem(cid,2392,1)
      setPlayerStorageValue(cid,9660,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
return 1
end
