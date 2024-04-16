function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7790 then
    queststatus = getPlayerStorageValue(cid,9749)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a mug.")
      doPlayerAddItem(cid,3942,1)
      setPlayerStorageValue(cid,9749,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

