function onUse(cid, item, frompos, item2, topos)
if item.uid == 7855 then
    queststatus = getPlayerStorageValue(cid,9676)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a bag.")
      bag = doPlayerAddItem(cid,1987,1)
      doAddContainerItem(bag,2678,14)
      doAddContainerItem(bag,2162,1)
      doAddContainerItem(bag,2161,1)
      doAddContainerItem(bag,2164,20)
      setPlayerStorageValue(cid,9676,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
return 1
end
