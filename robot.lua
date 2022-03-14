

--robot with scanner on up side
local w=require('os').sleep
local r=require('robot')
local inv=r.inventorySize()
local t=os.time()
local c=r.compareTo

function waitFor()
r.select(1)
while true do
w(1)
if c(15) then return trade()
else r.drop(3)
end
end

function trade()
 r.drop(0)
 t=os.time()
 while os.time()-t < 9000 do
 w(0.2)
 i=getStackInInternalSlot(1)
 if i then r.drop(1) return work()
 else end

function work()
while not getStackInInternalSlot(1) do
w(1)
end
r.drop(3)
return waitFor()
end

waitFor()
