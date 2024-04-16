function onUse(cid, item, frompos, item2, topos)

humanpos = {x=944,y=763,z=8,stackpos=253}
wallpos = {x=944,y=763,z=8,stackpos=1}
createpos = {x=944,y=763,z=8}
getwall = getThingfromPos(wallpos)
gethuman = getThingfromPos(humanpos)

 if item.itemid == 2061 then
 doCreatureSay(cid,"You hear a distant rumble.",16)
 doRemoveItem(getwall.uid,1)
 doTransformItem(item.uid,2060)

 elseif item.itemid == 2060 and gethuman.itemid > 0 then
 doMoveCreature(gethuman.uid,0)
 doCreateItem(904,1,createpos)
 doTransformItem(item.uid,2061)

 else
 doCreateItem(904,1,createpos)
 doTransformItem(item.uid,2061)
 end
return 1
end