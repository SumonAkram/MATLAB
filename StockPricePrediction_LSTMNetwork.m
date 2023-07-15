% Name: Stock Price Prediction using Long Short-Term Memory (LSTM) Network
% Description: MATLAB code for training and evaluating an LSTM network to predict stock prices.

% Load the historical stock price data
data = readtable('stock_prices.csv');

% Preprocess the data
prices = data.Close;
normalizedPrices = (prices - mean(prices)) / std(prices);

% Split the data into training and testing sets
trainData = normalizedPrices(1:700);
testData = normalizedPrices(701:end);

% Define the LSTM network architecture
numFeatures = 1;
numHiddenUnits = 100;
layers = [ ...
    sequenceInputLayer(numFeatures), ...
    lstmLayer(numHiddenUnits), ...
    fullyConnectedLayer(1), ...
    regressionLayer];

% Train the LSTM network
XTrain = trainData(1:end-1);
YTrain = trainData(2:end);
net = trainNetwork(XTrain, YTrain, layers);

% Predict stock prices using the trained network
XTest = testData(1:end-1);
netPredictions = predict(net, XTest);

% Evaluate the performance of the model
rmse = sqrt(mean((netPredictions - testData(2:end)).^2));
disp(['Root Mean Squared Error (RMSE): ' num2str(rmse)]);

% Visualize the predicted and actual stock prices
figure;
plot(prices, 'b');
hold on;
plot([NaN; netPredictions * std(prices) + mean(prices)], 'r');
legend('Actual Prices', 'Predicted Prices');
