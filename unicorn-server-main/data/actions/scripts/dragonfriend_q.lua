function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7009 then
    queststatus = getPlayerStorageValue(cid,2002)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found some valuables.")
      doPlayerAddItem(cid,2145,3)
      doPlayerAddItem(cid,2144,1)
      doPlayerAddItem(cid,2151,4)
      setPlayerStorageValue(cid,2002,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

