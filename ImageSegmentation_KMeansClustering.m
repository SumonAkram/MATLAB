% Name: Image Segmentation using K-means Clustering
% Description: MATLAB code for segmenting an image using K-means clustering algorithm.

% Load the image
image = imread('image.jpg');

% Preprocess the image
grayImage = rgb2gray(image);
normalizedImage = double(grayImage) / 255;

% Reshape the image into a 2D matrix
imageMatrix = reshape(normalizedImage, [], 1);

% Perform K-means clustering
numClusters = 4;
[idx, centroids] = kmeans(imageMatrix, numClusters);

% Reshape the clustered image
segmentedImage = reshape(idx, size(grayImage));

% Display the original and segmented images
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');
subplot(1, 2, 2);
imshow(segmentedImage, [1, numClusters]);
title('Segmented Image');
