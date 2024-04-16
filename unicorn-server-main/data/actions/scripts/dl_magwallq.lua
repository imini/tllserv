function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7363 then
    queststatus = getPlayerStorageValue(cid,4017)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a holy scarab.")
      doPlayerAddItem(cid,2140,1)
      setPlayerStorageValue(cid,4017,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

