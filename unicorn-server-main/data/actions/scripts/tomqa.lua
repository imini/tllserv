function onUse(cid, item, frompos, item2, topos)
  stor = getPlayerStorageValue(cid,3043)
  queststatus = getPlayerStorageValue(cid,3047)

  if item.uid == 7324 and stor == 1 and queststatus == -1 then
  doPlayerSendTextMessage(cid,22,"You have found a blue gem.")
  doPlayerAddItem(cid,2158,1)
  setPlayerStorageValue(cid,3047,1)
  elseif queststatus == 1 then
  doPlayerSendTextMessage(cid,22,"It's empty.")
  else
  doPlayerSendTextMessage(cid,22,"It's empty.")
    end
  return 1
end

