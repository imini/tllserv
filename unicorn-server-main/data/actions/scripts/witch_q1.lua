function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7225 then
    queststatus = getPlayerStorageValue(cid,2719)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a blood herb.")
      doPlayerAddItem(cid,2798,1)
      setPlayerStorageValue(cid,2719,1)
    else
      doPlayerSendTextMessage(cid,22,"The body is empty.")
    end
  end
  return 1
end

