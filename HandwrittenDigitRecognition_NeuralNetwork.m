% Name: Neural Network for Handwritten Digit Recognition
% Description: MATLAB code for training and testing a neural network model to recognize handwritten digits.

% Load the MNIST dataset
load('mnist.mat');

% Preprocess the dataset
inputData = double(reshape(train_images, [], size(train_images, 3))) / 255;
targetData = double(train_labels);

% Create and train the neural network model
hiddenLayerSize = 100;
net = patternnet(hiddenLayerSize);
net = train(net, inputData', targetData');

% Test the neural network on test dataset
testInputData = double(reshape(test_images, [], size(test_images, 3))) / 255;
testTargetData = double(test_labels);
testOutputData = net(testInputData');

% Evaluate the accuracy
correctCount = sum(round(testOutputData) == testTargetData);
accuracy = correctCount / numel(testTargetData) * 100;

% Display the accuracy
disp(['Accuracy: ' num2str(accuracy) '%']);
