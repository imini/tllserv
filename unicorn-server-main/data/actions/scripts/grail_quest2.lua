function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7834 then
    queststatus = getPlayerStorageValue(cid,9557)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a bag.")
      bag = doPlayerAddItem(cid,1987,1)
      doAddContainerItem(bag,2131,1)
      doAddContainerItem(bag,2145,8)
      doAddContainerItem(bag,2168,1)
      doAddContainerItem(bag,1684,1)
      setPlayerStorageValue(cid,9557,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

