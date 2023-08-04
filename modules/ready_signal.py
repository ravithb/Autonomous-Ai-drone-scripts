import Jetson.GPIO as GPIO
import time

channel = 12

def initialize():
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(channel, GPIO.IN)

def waitForHarwareEnabe():
    print("Waiting for hadware enable")
    GPIO.wait_for_edge(channel, GPIO.RISING)
    print("Hardware enable received")

def isHardwareEnabled():
    return (GPIO.input(channel) == GPIO.HIGH)

def close():
    GPIO.cleanup()
        