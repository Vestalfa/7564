local component = require("component")
local colors = require("colors")
local rs = component.redstone
local event = require("event")
local cb = component.chat_box
local nick
local pull_e = require("event").pull
local gpu = component.gpu
local term = require("term")
local pos = "1"
local uti = "1"
local W = 80
local H = 25
local b_color, f_color = gpu.getBackground(), gpu.getForeground()

gpu.setResolution(40, 30)
 

 

local player = {
  [1] = "Jane" ,
  [2] = "Vestalfa",
  [3] = "SkillS",
  [4] = "dmitriy19",
  [5] = "Bro777",
  [6] = "Dmitriy19"
 }
 
 color = {
 green = 0x00ff00,
 yellow = 0xffb600,
 red = 0xff0000,
 cyan = 0x008b8b,
 pink = 0xFF00FF,
 darkm = 0x633E01
 }
 term.clear(0)
local n = 1
gpu.setForeground(color.yellow)
print("Created by Jane")
gpu.setForeground(color.darkm)
print("Little modded by Vestalfa (Jane's son)")
gpu.setForeground(color.cyan)
print("[~]Логи:")
cb.setName("§3Smart§aHouse§7")
rs.setBundledOutput(0, colors.red, 215)
rs.setBundledOutput(0, colors.blue, 215)
function opent(nick)
  rs.setBundledOutput(0, colors.red, 0)
  gpu.setForeground(color.green)
   cb.say(nick..", §2Дверь открыта на 1 секунду ")
   
  os.sleep(1)
  rs.setBundledOutput(0, colors.red, 215)
   cb.say(nick..", §cДверь закрыта")
   gpu.setForeground(color.green)
   print("["..n.."]"..nick.." - Использовал Opent")
   n=n+1
 end
 function open(nick)
  rs.setBundledOutput(0, colors.red, 0)
   cb.say(nick..", §2Дверь открыта")
   gpu.setForeground(color.green)
   print("["..n.."]"..nick.." - использовал Open ")
   pos = "0"
   n=n+1
  rs.setBundledOutput(0, colors.yellow, 215)
   os.sleep(0,2)
   rs.setBundledOutput(0, colors.yellow, 0)
   os.sleep(16)
   rs.setBundledOutput(0, colors.yellow, 215)
   os.sleep(0,2)
   rs.setBundledOutput(0, colors.yellow, 0)
  end
  function openadmin(nick)
  rs.setBundledOutput(0, colors.red, 0)
   pos = "0"
   n=n+1
 end
   function closeadmin(nick)
  rs.setBundledOutput(0, colors.red, 215)
   pos = "1"
   n=n+1
 end
  function close(nick)
  rs.setBundledOutput(0, colors.red, 215)
   cb.say(nick..", §cДверь закрыта")
   gpu.setForeground(color.green)
   print("["..n.."]"..nick.." - использовал Close")
   pos = "1"
   n=n+1
   
 end
   function UE(nick)
  rs.setBundledOutput(0, colors.blue, 215)
   cb.say(nick..", §cУтиль включен")
   gpu.setForeground(color.green)
   print("["..n.."]"..nick.." - включил утилизаторы")
   uti = "1"
   n=n+1
 end
  function UD(nick)
  rs.setBundledOutput(0, colors.blue, 0)
   cb.say(nick..", §2Утиль выключен")
   gpu.setForeground(color.green)
   print("["..n.."]"..nick.." - выключил утилизаторы")
   uti = "0"
   n=n+1
 end
 

while true do
 
 e = {event.pull("chat_message")} 
  if e[1] == "chat_message" then
   for i = 1, #player do
    if e[3] == player[i] then 
    os.sleep(0.1)
     nick = e[3]
   
     if ((e[4] == "open") and ( pos == "1" )) or ((e[4] == "сизам откройся") and ( pos == "1" )) then
      open(nick)
    
     elseif ((e[4] == "open") and ( pos == "0" )) or ((e[4] == "сизам откройся") and ( pos == "0" )) then
      cb.say(nick..", §cДверь уже открыта")
    gpu.setForeground(color.red)
      print("["..n.."]"..nick.." - попытался использовать Open")
      n=n+1
    
    elseif ((e[4] == "close") and ( pos == "0")) or ((e[4] == "сизам закройся") and ( pos == "0")) then
     close(nick)
   
       elseif ((e[4] == "close") and ( pos == "1")) or ((e[4] == "сизам закройся") and ( pos == "1")) then
        cb.say(nick..", §cДверь уже закрыта")
    gpu.setForeground(color.red)
      print("["..n.."]"..nick.." - попытался использовать Сlose")
      n=n+1

    elseif ((e[4] == "opent") and ( pos == "1")) then 
      opent(nick)
      
       elseif ((e[4] == "opent") and ( pos == "0" )) then 
      cb.say(" §cДверь уже открыта")
    gpu.setForeground(color.red)
      print("["..n.."]"..nick.." - попытался использовать Opent")
      n=n+1

    elseif ((e[4] == "выключить утиль") and ( uti == "1" )) then
      UD(nick)
    
    elseif ((e[4] == "включить утиль") and ( uti == "0" )) then
      UE(nick)
    
    elseif ((e[4] == "включить утиль") and ( uti == "1" )) then
      cb.say(nick..", §cУтилизаторы уже включены.")
    gpu.setForeground(color.red)
    print("["..n.."]"..nick.." - попытался включить утилизаторы")
    n=n+1
    elseif ((e[4] == "вырубить утиль") and ( uti == "0" )) then
      cb.say(nick..", §cУтилизаторы уже выключены.")
    gpu.setForeground(color.red)
    print("["..n.."]"..nick.." - попытался выключить утилизаторы")
    n=n+1
  elseif ((e[4] == "openadmin") and ( pos == "1")) then
   openadmin(nick)
    
  elseif ((e[4] == "closeadmin") and ( pos == "0")) then
   closeadmin(nick)
   
     elseif ((e[4] == "close") then
   os.exit()
   
  elseif (string.sub(e[4],1,2) == "##") then
   local a = string.sub(e[4],3)
    gpu.setForeground(color.pink)
   a = string.gsub(a,"&","§")
   print("["..n.."]"..nick.."§2Написал:"..a)
   cb.say(a)
   n=n+1
   break
   
  
  
    
  end
   end
  end 
end
end