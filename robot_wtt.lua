--утилита принимает оплату и предметы для обравботки
--в указанных количествах. оплата помещается вниз
--на обработку подаются вверх
--после этого роботи ждет пока предметы будут обработаны
--и возвращает готовое заказчику
local component=require('component')
local r=component.proxy(component.list('robot')())
local comp=require('computer')
local i=component.proxy(component.list('inventory_controller')()).getStackInInternalSlot

local w=os.sleep
local t=0
local inv=r.inventorySize()
local s={}
local count=''
local price=''

  while not tonumber(price) do
  print('введите объём минимальной партии предметов оплаты:')
    price=tonumber(io.read())
    if tonumber(price) and tonumber(price) > 64 then price = nil end
  end
while not tonumber(count) do
  print('введите объём минимальной партии обрабатываемых предметов:')
    count=tonumber(io.read())
    if tonumber(count) and tonumber(count) > 64 then count = nil end
  end

function re(n)
  r.turn(true)
  r.drop(3,n)
  r.turn(false)
  return true
end

function waitFor()
  r.select(1)
  w(0.05)
  r.suck(3)
  if i(1) then
    if r.compareTo(inv) then
      if i(1).size==price then
        return trade()
      end
    end
    re(i(1).size)
    return waitFor()
  end
end

function trade()
  t=0
  while t < 150 do
    t=t+1
    w(0.1)
    r.suck(3)
    s=i(2)
    if s then 
      print('oppa, 4e tyt')
      r.select(2)
      if s.size > count then
        re(s.size-count)
      end
      if r.drop(1) then
        r.select(1)
        r.drop(0)
        return work()
      else
        re(i(2).size)
        r.select(1)
        re(i(1).size)
        return waitFor()
      end
    else
      
    end
    
  end
  print('ystal jdat')
      re(i(1).size)
  return waitFor()
end

function work()
  while not i(1) or i(1).size < count do
    w(1)
  end
  re(3)
  for slot = 1, inv-1 do
    s=i(slot)
    if s then
      r.select(slot)
      re(s.size)
    end
  end
  return waitFor()
end

while true do
waitFor() end
