function onUse(cid, item, frompos, item2, topos)

if item.itemid == 5957 then
doRemoveItem(item.uid,1)
parchment = doPlayerAddItem(cid,1967,1)
doSetItemActionId(parchment,3434)
doSetItemText(parchment,"The legend read                                         by you affected                                        else the map is                                    undetected                                                 holds the key to Lithaton                            in a castle too grand to shun")
else
return 0
end
return 1
end
