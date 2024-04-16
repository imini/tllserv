function onUse(cid, item, frompos, item2, topos)
  if item.actionid == 7565 then
    queststatus1 = getPlayerStorageValue(cid,4356)
    queststatus2 = getPlayerStorageValue(cid,4316)
    if getPlayerStorageValue(cid,9542) == 5 then
      doPlayerSendTextMessage(cid,22,"You have found a tear of dustwit hidden in the fountain.")
      doPlayerAddItem(cid,2346,1)
      setPlayerStorageValue(cid,9542,6)
    elseif getPlayerStorageValue(cid,9542) > 5 then
      doPlayerSendTextMessage(cid,22,"The fountain is empty.")
      
     else 
     return 0
    end
  end
  return 1
end

