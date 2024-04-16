---Mindstone script by Firio and based on fortune script
function onUse(cid, item, frompos, item2, topos)

if item2.itemid == 2178 then
rand = math.random(1,12)
 if rand == 1 then
doPlayerSendTextMessage(cid,22,"You remember your first dragon.")
  doSendMagicEffect(topos,2)
 elseif rand == 2 then
doPlayerSendTextMessage(cid,22,"You are thinking about buying a house.")
  doSendMagicEffect(topos,2)
  elseif rand == 3 then
doPlayerSendTextMessage(cid,22,"You are very hungry.")
  doSendMagicEffect(topos,2)
  elseif rand == 4 then
doPlayerSendTextMessage(cid,22,"You want to be the best fisher of the world.")
  doSendMagicEffect(topos,2)
  elseif rand == 5 then
doPlayerSendTextMessage(cid,22,"You want to be the best fisher of the world.")
  doSendMagicEffect(topos,2)
  elseif rand == 6 then
doPlayerSendTextMessage(cid,22,"You remember that necromancers can summon!.")
  doSendMagicEffect(topos,2)
  elseif rand == 7 then
doPlayerSendTextMessage(cid,22,"You remember that you got some gold from your friend.")
  doSendMagicEffect(topos,2)
  elseif rand == 8 then
doPlayerSendTextMessage(cid,22,"You see a vortex in your mind.")
  doSendMagicEffect(topos,2)
    elseif rand == 9 then
doPlayerSendTextMessage(cid,22,"You are very sleepy.")
  doSendMagicEffect(topos,2)
    elseif rand == 10 then
doPlayerSendTextMessage(cid,22,"You want to go buy some food.")
  doSendMagicEffect(topos,2)
      elseif rand == 11 then
doPlayerSendTextMessage(cid,22,"You are thinking that this mind stone is useless after all.")
  doSendMagicEffect(topos,2)
        elseif rand == 12 then
doPlayerSendTextMessage(cid,22,"You want to throw the mind stone away")
  doSendMagicEffect(topos,2)
 end
else
 return 0
end
return 1
end