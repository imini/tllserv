function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7351 then
    queststatus = getPlayerStorageValue(cid,4003)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a rare blood herb.")
      doPlayerAddItem(cid,2798,1)
      setPlayerStorageValue(cid,4003,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

