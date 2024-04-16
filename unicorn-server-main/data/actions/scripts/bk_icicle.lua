function onUse(cid, item, frompos, item2, topos)
   
  stor = getPlayerStorageValue(cid,3077)
  queststatus = getPlayerStorageValue(cid,3078)
  
  if stor == -1 then
  doCreatureSay(cid,"It's just a normal icicle, right?",16)
  
  elseif stor == 1 and queststatus == -1 then
  doPlayerAddItem(cid,4848,1)
  doPlayerSendTextMessage(cid,22,"You have found an icicle.")
  setPlayerStorageValue(cid,3078,1)
  
  elseif queststatus == 1 then
  doCreatureSay(cid,"It's just a normal icicle, right?",16)

  else
  doMovePlayer(cid,2)
    end
  return 1
end

