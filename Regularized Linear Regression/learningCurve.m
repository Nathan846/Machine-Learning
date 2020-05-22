function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)
%LEARNINGCURVE Generates the train and cross validation set errors needed 
%to plot a learning curve
%   [error_train, error_val] = ...
%       LEARNINGCURVE(X, y, Xval, yval, lambda) returns the train and
%       cross validation set errors for a learning curve. In particular, 
%       it returns two vectors of the same length - error_train and 
%       error_val. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i)).
%

% Number of training examples
m = size(X, 1);

error_train = zeros(m, 1);
error_val   = zeros(m, 1);
for i=1:m
    X_train=X(1:i,:);
    Y_train=y(1:i);
    [theta] = trainLinearReg(X_train, Y_train, lambda);
    error_train(i)=linearRegCostFunction(X_train, Y_train, theta,0);
    error_val(i)=linearRegCostFunction(Xval, yval, theta,0);


end
