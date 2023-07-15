% Name: Object Detection using YOLOv3
% Description: MATLAB code for performing object detection using the YOLOv3 deep learning model.

% Load the pre-trained YOLOv3 network
net = load('yolov3.mat');

% Load and preprocess the image
image = imread('image.jpg');
resizedImage = imresize(image, net.inputSize);

% Perform object detection
detections = detectObjects(net, resizedImage);

% Display the bounding boxes and labels
annotatedImage = annotateImage(image, detections);
imshow(annotatedImage);
title('Object Detection using YOLOv3');
