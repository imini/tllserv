function onUse(cid, item, frompos, item2, topos)
  stor = getPlayerStorageValue(cid,3046)
  queststatus = getPlayerStorageValue(cid,3050)

  if item.uid == 7327 and stor == 1 and queststatus == -1 then
  doPlayerSendTextMessage(cid,22,"You have found a platinum amulet.")
  doPlayerAddItem(cid,2171,1)
  setPlayerStorageValue(cid,3050,1)
  elseif queststatus == 1 then
  doPlayerSendTextMessage(cid,22,"It's empty.")
  else
  doPlayerSendTextMessage(cid,22,"It's empty.")
    end
  return 1
end

