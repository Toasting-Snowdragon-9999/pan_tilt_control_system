import cv2
import numpy as np


def get_hsv_value(image, x, y):
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    h, s, v = hsv[y, x]
    return h, s, v

def load_image(image_path):
    return cv2.imread(image_path)

def main():
    image_path = "pics/tennis_ball.jpg"
    image = load_image(image_path)
    height, width = image.shape[:2]
    x = int(height/2)
    y = int(width/2)
    print (f"Image shape: x={x}, y={y}")    
    h, s, v = get_hsv_value(image, x, y)
    print(f"HSV value at ({x}, {y}): ({h}, {s}, {v})")

    #target_color_dark = [53, 100, 43] # tennis ball on iphone
    #target_color_light = [57, 78, 97] # tennis ball on iphone

    #target_color_dark = [92, 20, 69]    # tennis ball on webcame
    #target_color_light = [65, 10, 91]   # tennis ball on webcame

    target_color_dark = [71, 30, 81]    # tennis ball on webcame
    target_color_light = [71, 31, 74]   # tennis ball on webcame

    cv_h, cv_s, cv_v = gimp_to_opencv_hsv(target_color_dark[0], target_color_dark[1], target_color_dark[2])  
    print(f"OpenCV HSV dark: ({cv_h}, {cv_s}, {cv_v})")
    cv_h, cv_s, cv_v = gimp_to_opencv_hsv(target_color_light[0], target_color_light[1], target_color_light[2])
    print(f"OpenCV HSV light: ({cv_h}, {cv_s}, {cv_v})")

def gimp_to_opencv_hsv(gimp_h, gimp_s, gimp_v):
    cv_h = gimp_h/2
    cv_s = gimp_s/100*255
    cv_v = gimp_v/100*255
    return cv_h, cv_s, cv_v

if __name__ == "__main__":
    main()
