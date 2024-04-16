function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7777 then
    queststatus = getPlayerStorageValue(cid,9928)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a moonstone.")
      doPlayerAddItem(cid,6546,1)
      setPlayerStorageValue(cid,9928,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

