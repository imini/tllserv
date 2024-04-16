function onUse(cid, item, frompos, item2, topos)

random = math.random(1,8)

newpos = {x=topos.x,y=topos.y+5,z=topos.z}
itempos = {x=topos.x,y=topos.y+4,z=topos.z}
swordpos = {x=topos.x,y=topos.y+1,z=topos.z,stackpos=2}
magicpos1 = {x=topos.x,y=topos.y,z=topos.z}
getsword = getThingfromPos(swordpos)

if item.itemid == 1945 and random == 1 and doPlayerRemoveMoney(cid, 50) == 1 then
doTransformItem(item.uid,1946)
doTransformItem(getsword.uid,2377)
doSendMagicEffect(magicpos1,13)
doPlayerSendTextMessage(cid,22,"Sorry, you recieved a twohanded sword. Better luck next time.")

elseif item.itemid == 1945 and random == 2 and doPlayerRemoveMoney(cid, 50) == 1 then
doTransformItem(item.uid,1946)
doTransformItem(getsword.uid,2392)
doSendMagicEffect(magicpos1,13)
doPlayerSendTextMessage(cid,22,"Sorry, you recieved a fire sword. Better luck next time.")

elseif item.itemid == 1945 and random == 3 and doPlayerRemoveMoney(cid, 50) == 1 then
doTransformItem(item.uid,1946)
doTransformItem(getsword.uid,2393)
doSendMagicEffect(magicpos1,13)
doPlayerSendTextMessage(cid,22,"Sorry, you recieved a giant sword. Better luck next time.")

elseif item.itemid == 1945 and random == 4 and doPlayerRemoveMoney(cid, 50) == 1 then
doTransformItem(item.uid,1946)
doTransformItem(getsword.uid,2396)
doSendMagicEffect(magicpos1,13)
doPlayerSendTextMessage(cid,22,"Sorry, you recieved an ice rapier. Better luck next time.")

elseif item.itemid == 1945 and random == 5 and doPlayerRemoveMoney(cid, 50) == 1 then
doTransformItem(item.uid,1946)
doTransformItem(getsword.uid,2397)
doSendMagicEffect(magicpos1,13)
doPlayerSendTextMessage(cid,22,"Sorry, you recieved a longsword. Better luck next time.")

elseif item.itemid == 1945 and random == 6 and doPlayerRemoveMoney(cid, 50) == 1 then
doTransformItem(item.uid,1946)
doTransformItem(getsword.uid,2400)
doSendMagicEffect(magicpos1,14)
doSendMagicEffect(getPlayerPosition(cid),2)
doTeleportThing(cid,newpos,0)
doSendMagicEffect(newpos,10)
doSendMagicEffect(itempos,14)
doCreateItem(2152,3,itempos)
doPlayerSendTextMessage(cid,22,"Congratulations, you recieved the magic sword.")

elseif item.itemid == 1945 and random == 7 and doPlayerRemoveMoney(cid, 50) == 1 then
doTransformItem(item.uid,1946)
doTransformItem(getsword.uid,2404)
doSendMagicEffect(magicpos1,13)
doPlayerSendTextMessage(cid,22,"Sorry, you recieved a combat knife. Better luck next time.")

elseif item.itemid == 1945 and random == 8 and doPlayerRemoveMoney(cid, 50) == 1 then
doTransformItem(item.uid,1946)
doTransformItem(getsword.uid,2419)
doSendMagicEffect(magicpos1,13)
doPlayerSendTextMessage(cid,22,"Sorry, you recieved a scimitar. Better luck next time.")

elseif item.itemid == 1946 then
doTransformItem(item.uid,1945)
else
doPlayerSendTextMessage(cid,22,"Return when you have enough money.")
end
return 1
end





