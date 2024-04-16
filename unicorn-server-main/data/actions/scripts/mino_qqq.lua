function onUse(cid, item, frompos, item2, topos)
queststatus = getPlayerStorageValue(cid,3024)
  if item.uid == 7301 and queststatus == -1 then   
      doPlayerSendTextMessage(cid,22,"You have found a shimmering serpent sword.")
      doPlayerAddItem(cid,2409,1)
      setPlayerStorageValue(cid,3024,1)
      doSendMagicEffect(topos,4)
      
      elseif item.uid == 7302 and queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a mighty dragon hammer.")
      doPlayerAddItem(cid,2434,1)
      setPlayerStorageValue(cid,3024,1)
      doSendMagicEffect(topos,4)

    elseif item.uid == 7303 and queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a sharp knight axe.")
      doPlayerAddItem(cid,2430,1)
      setPlayerStorageValue(cid,3024,1)
      doSendMagicEffect(topos,4)
     
      elseif item.uid == 7303 and queststatus == 1 then
      doPlayerSendTextMessage(cid,22,"Your choice is made.")
      doMoveCreature(cid,0)
      
      elseif item.uid == 7302 and queststatus == 1 then
      doPlayerSendTextMessage(cid,22,"Your choice is made.")
      doMoveCreature(cid,0)
      
      elseif item.uid == 7301 and queststatus == 1 then
      doPlayerSendTextMessage(cid,22,"Your choice is made.")
      doMoveCreature(cid,0)

    else
      doPlayerSendTextMessage(cid,22,"Your choice is made.")
    end
end

