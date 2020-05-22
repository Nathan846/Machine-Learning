function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

grad = zeros(size(theta));
yi=X*theta;
err=yi-y;
f=(1/(2*m))*sum((err).^2);
theta(1)=0;
r=(lambda/(2*m))*sum(theta.^2);
J=f+r;
grad = ((1/m)*(X'*(err)))+((lambda/m)*theta);








grad = grad(:);

end
