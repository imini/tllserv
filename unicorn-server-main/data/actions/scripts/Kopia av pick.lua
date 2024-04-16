function onUse(cid, item, frompos, item2, topos)
topos = {x=topos.x, y=topos.y, z=topos.z}
if item2.itemid == 0 then
 return 0
end

if item2.itemid == 353 and topos.x == 641 and topos.y == 701 and topos.z == 8 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 635 and topos.y == 694 and topos.z == 8 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 641 and topos.y == 698 and topos.z == 8 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 647 and topos.y == 692 and topos.z == 8 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 923 and topos.y == 624 and topos.z == 11 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 876 and topos.y == 580 and topos.z == 9 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 715 and topos.y == 470 and topos.z == 9 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 837 and topos.y == 456 and topos.z == 9 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 856 and topos.y == 312 and topos.z == 12 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 894 and topos.y == 491 and topos.z == 10 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 754 and topos.y == 419 and topos.z == 14 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 876 and topos.y == 580 and topos.z == 9 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 353 and topos.x == 912 and topos.y == 654 and topos.z == 11 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 355 and topos.x == 979 and topos.y == 682 and topos.z == 12 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 355 and topos.x == 821 and topos.y == 710 and topos.z == 10 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
elseif item2.itemid == 355 and topos.x == 819 and topos.y == 708 and topos.z == 11 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)

else
 return 0
end    
return 1
end