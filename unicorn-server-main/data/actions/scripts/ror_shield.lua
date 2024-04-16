function onUse(cid, item, frompos, item2, topos)

stor = getPlayerStorageValue(cid,3021)

  if item.uid == 7083 then
    queststatus = getPlayerStorageValue(cid,3022)
    if queststatus == -1 and stor == 1 then
      doPlayerSendTextMessage(cid,22,"You have found a medusa shield.")
      doPlayerAddItem(cid,2536,1)
      setPlayerStorageValue(cid,3022,1)

  elseif item.uid == 7083 and queststatus == -1 and stor == -1 then
doPlayerSendTextMessage(cid,22,"You have not sacrificed yet.")

    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

