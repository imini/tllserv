function onUse(cid, item, frompos, item2, topos)
stor = getPlayerStorageValue(cid,4130)
  if item.uid == 7477 and stor == -1 then
  doPlayerSendTextMessage(cid,22,"You have found an arcane staff.")
  doPlayerAddItem(cid,2453,1)
  setPlayerStorageValue(cid,4130,1)
  elseif item.uid == 7478 and stor == -1 then
  doPlayerSendTextMessage(cid,22,"You have found the avenger.")
  doPlayerAddItem(cid,6528,1)
  setPlayerStorageValue(cid,4130,1)
  elseif item.uid == 7479 and stor == -1 then
  doPlayerSendTextMessage(cid,22,"You have found an arbalest.")
  doPlayerAddItem(cid,5803,1)
  setPlayerStorageValue(cid,4130,1)
  else
  doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  return 1
end

