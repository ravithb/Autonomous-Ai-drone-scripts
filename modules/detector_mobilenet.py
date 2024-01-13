import jetson_inference
import jetson_utils
import cv2
import numpy as np

net = None
camera = None

def initialize_detector():
	global net, camera
	print('Initializing detector ')
	net = jetson_inference.detectNet("ssd-mobilenet-v2")
	camera = jetson_utils.videoSource("csi://0", argv=['--input-flip=rotate-180'])      # '/dev/video0' for V4L2

def get_image_size():
	return camera.GetWidth(), camera.GetHeight()

def close_camera():
	camera.Close()

def get_detections():
	person_detections = []
	img = camera.Capture()
	jetson_utils.cudaDeviceSynchronize()
	img2 = cv2.cvtColor(jetson_utils.cudaToNumpy(camera.Capture()),cv2.COLOR_RGB2BGR)
	try:
		detections = net.Detect(img)
		for detection in detections:
			if detection.ClassID == 1: #remove unwanted classes
				person_detections.append(detection)
	except Exception as e:
		print("Exception ", e)
	fps = net.GetNetworkFPS()

	return person_detections, fps, img2
#jetson_utils.cudaToNumpy(img)

