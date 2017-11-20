local term = require('term')
local com = require('component')
local sensor = com.openperipheral_sensor
local gpu = com.gpu
local cb = com.chat_box
floor = math.floor
 
 cb.setName("§4Радар§7")
color = {
  green = 0x00ff00,
  yellow = 0xffb600,
  red = 0xff0000,
  cyan = 0x008B8B,
  pink = 0xff0094
}
 
-- Белый список ---
white = {
  Jane = true,
  DanilValiev1 = true,

  Bro777 = true,
  Dmitriy19 = true,
  Sausage = true
  
  
}
Humanoid = {
 Vestalfa = true
 
 }
 
 
gpu.setResolution(35,15)
 
while true do
  pl = sensor.getPlayers()
  term.clear()
  gpu.setForeground(color.yellow)
  gpu.set(2,1, 'В зоне обнаружения радара: '..#pl..' чел.')
    for i = 1, #pl do
     if white[pl[i].name] then 
	  gpu.setForeground(color.green)
      cb.say("§2"..pl[i].name.." §c# §6Дома")
     
       elseif Humanoid[pl[i].name] then 
	  gpu.setForeground(color.pink)
      cb.say("§D"..pl[i].name.." §3# §7Выделяет эктоплазму")
	
	  else gpu.setForeground(color.red)
      cb.say("§4"..pl[i].name.." §с# §6На территории")
	
	 end
	 
	 
	  
      
      
      gpu.set(2, i+1, i..'. '..pl[i].name)
    end
  os.sleep(60)
end