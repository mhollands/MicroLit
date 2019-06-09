from microbit import *
import radio
import utime

target = 0
remote = 0

while True:
	if(target != remote):
		radio.on()
		radio.send(str(target))
		display.set_pixel(4,4,9)
		incoming = radio.receive()
		if(incoming is not None):
			remote = int(incoming)
	else:
		radio.off()
		display.set_pixel(4,4,0)

	if button_a.was_pressed():
		target = target - 1
	if button_b.was_pressed():
		target = target + 1
	display.show(target)