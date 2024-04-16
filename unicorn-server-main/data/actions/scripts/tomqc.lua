function onUse(cid, item, frompos, item2, topos)
  stor = getPlayerStorageValue(cid,3045)
  queststatus = getPlayerStorageValue(cid,3049)

  if item.uid == 7326 and stor == 1 and queststatus == -1 then
  doPlayerSendTextMessage(cid,22,"You have found 100 platinum coins.")
  doPlayerAddItem(cid,2152,100)
  setPlayerStorageValue(cid,3049,1)
  elseif queststatus == 1 then
  doPlayerSendTextMessage(cid,22,"It's empty.")
  else
  doPlayerSendTextMessage(cid,22,"It's empty.")
    end
  return 1
end

