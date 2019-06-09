from microbit import *
import radio
import utime
import neopixel

radio.on()
np = neopixel.NeoPixel(pin0, 100)

colours = [[255,0,0], [0,255,0], [0,0,255], [255,255,0], [255, 0, 255], [0,255,255], [255,255,255]]

def turnOnLEDs():
	pin1.write_digital(1)

def turnOffLEDs():
	pin0.write_digital(1)
	pin1.write_digital(0)

def drawLight():
	global colours
	global setting
	for i in range(0,len(np)):
		np[i] = colours[setting%len(colours)-1]  # first element
	np.show()

turnOnLEDs()

setting = 0
while True:
	incoming = radio.receive()
	if(incoming is not None):
		if(int(incoming) >= 0 and int(incoming) <= 10):
			setting = int(incoming)
			radio.send(str(setting))

	if(setting == 0):
		turnOffLEDs()
		display.clear()
	else:
		turnOnLEDs()
		drawLight()
		display.show(setting)

#setting = 0
#while True:
#    incoming = radio.receive()
#    if(incoming is not None):
#    	setting = int(incoming)
#    	radio.send(str(setting))
#    display.show(setting)##

    #if(setting == 0):
   # 	turnOffLEDs()
   # else:
   # 	drawLight()
   # 	utime.sleep_ms(500)