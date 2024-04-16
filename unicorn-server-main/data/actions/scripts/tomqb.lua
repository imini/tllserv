function onUse(cid, item, frompos, item2, topos)
  stor = getPlayerStorageValue(cid,3044)
  queststatus = getPlayerStorageValue(cid,3048)

  if item.uid == 7325 and stor == 1 and queststatus == -1 then
  doPlayerSendTextMessage(cid,22,"You have found 32 talons.")
  doPlayerAddItem(cid,2151,32)
  setPlayerStorageValue(cid,3048,1)
  elseif item.uid == 7325 and stor == 1 and queststatus == 1 then
  doPlayerSendTextMessage(cid,22,"It's empty.")
  else
  doPlayerSendTextMessage(cid,22,"It's empty.")
    end
  return 1
end

