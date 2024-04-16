function onStepIn(cid, item, topos)

pos1 = {x=724, y=339, z=15, stackpos=253}
pos2 = {x=723, y=340, z=15, stackpos=253}
pos3 = {x=724, y=340, z=15, stackpos=253}
pos4 = {x=725, y=340, z=15, stackpos=253}
pos5 = {x=723, y=341, z=15, stackpos=253}
pos6 = {x=724, y=341, z=15, stackpos=253}
newpos = {x=714, y=336, z=14}
sumpos = {x=718, y=339, z=14}
tp1 = getThingfromPos(pos1)
tp2 = getThingfromPos(pos2)
tp3 = getThingfromPos(pos3)
tp4 = getThingfromPos(pos4)
tp5 = getThingfromPos(pos5)
tp6 = getThingfromPos(pos6)

get = getPlayerStorageValue(cid,2701)

if item.uid == 7202 and item.itemid == 2025 then
doTeleportThing(tp1.uid,newpos)
doTeleportThing(tp2.uid,newpos)
doTeleportThing(tp3.uid,newpos)
doTeleportThing(tp4.uid,newpos)
doTeleportThing(tp5.uid,newpos)
doTeleportThing(tp6.uid,newpos)
doTeleportThing(cid,newpos)
doSendMagicEffect(newpos,0)
doSummonCreature("Boreg",sumpos)

else
return 0
end
return 1
end