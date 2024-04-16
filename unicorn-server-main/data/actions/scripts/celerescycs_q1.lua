function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7028 then
    queststatus = getPlayerStorageValue(cid,2017)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a guardian halberd.")
      doPlayerAddItem(cid,2427,1)
      setPlayerStorageValue(cid,2017,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

