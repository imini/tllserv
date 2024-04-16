function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7029 then
    queststatus = getPlayerStorageValue(cid,2018)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found an ancient shield.")
      doPlayerAddItem(cid,2532,1)
      setPlayerStorageValue(cid,2018,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

