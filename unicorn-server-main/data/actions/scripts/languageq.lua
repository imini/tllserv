function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7512 then
    queststatus = getPlayerStorageValue(cid,4146)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found candy and a panda teddy.")
      doPlayerAddItem(cid,6568,1)
      doPlayerAddItem(cid,6569,17)
      setPlayerStorageValue(cid,4146,1)
    else
      doPlayerSendTextMessage(cid,22,"The drawers are empty.")
    end
  end
  return 1
end

