function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7075 then
    queststatus = getPlayerStorageValue(cid,2092)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a beastslayer axe.")
      doPlayerAddItem(cid,3962,1)
      setPlayerStorageValue(cid,2092,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

