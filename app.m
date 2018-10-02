% this is a house price prediction system for predicting the price of house in the state of california 
% using machine learning 


% clearing the console and closing all figures 
clear; close all; clc

% load data 
fprintf('Loading data ...\n');
data = load('data.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

%printing some examples from the dataset 
fprintf('first 10 examples from the datset:\n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');
fprintf('Program paused. Press enter to continue.\n');
pause ;

% scaling the features 

[X mu sigma ] = Normalize(X);

% adding a column of ones to the data 
X = [ones(m,1) X];

% we are using the gradient descent algorithm for training the model
% choosing the parameters 
alpha = 0.01;
num_iters = 400;

% Intializing the theta and running gradient descent 
theta = zeros(3, 1);
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

%plotting the convergence curve 
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% taking the user input for prediction of price 
sizeOfHouse = str2double(input('Enter the size of house in sq-ft: ', 's'));
noOfRooms = str2double(input('Enter the number of rooms in the house: ', 's'));
%  feaure scaling the user input
sizeOfHouse = (sizeOfHouse-mu(1))/sigma(1);
noOfRooms = (noOfRooms-mu(2))/sigma(2);

% calculating the price 
price = theta(1) +  sizeOfHouse*theta(2) + noOfRooms*theta(3);
% printing the price 
fprintf('the price of the house with the given size and no. of rooms in california is :');
disp(price);
