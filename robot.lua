

--robot with scanner on up side
local w=require('os').sleep
local r=require('robot')
local inv=r.inventorySize()
local t=os.time()
local c=r.compareTo
local i=require('component').inventory_controller
local s={}
function waitFor()
r.select(1)
while true do
w(1)
  r.suck()
if c(15) then return trade()
else r.drop(3)
end end
end

function trade()
 r.drop(0)
 t=os.time()
 while os.time()-t < 9000 do
 w(0.2)
  r.suck(3)
 s=i.getStackInInternalSlot(1)
 if s then r.drop(1) return work()
 else end end end

function work()
while not i.getStackInInternalSlot(1) do
w(1)
end
r.drop(3)
return waitFor()
end

waitFor()
