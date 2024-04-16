function onUse(cid, item, frompos, item2, topos)
if item.uid == 7854 then
    queststatus = getPlayerStorageValue(cid,9675)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a sapphire hammer.")
      doPlayerAddItem(cid,7437,1)
      setPlayerStorageValue(cid,9675,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
return 1
end
