function onUse(cid, item, frompos, item2, topos)
underwell = {x=296, y=414, z=8}

if item.uid == 7146 and item.itemid == 1368 then
doTeleportThing(cid,underwell,0)

else
doPlayerSendCancel(cid,"This is not possible.")
return 1
end
end

