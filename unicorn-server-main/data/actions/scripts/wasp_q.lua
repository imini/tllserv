function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7183 then
    queststatus = getPlayerStorageValue(cid,2300)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a brass helmet and an antidote rune.")
      doPlayerAddItem(cid,2460,1)
      doPlayerAddItem(cid,2266,1)
      setPlayerStorageValue(cid,2300,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

