function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
% theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
% taking num_iters gradient steps with learning rate alpha

m = length(y);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    d=(X*theta)-y;
    k = 1:m;
    t1 = sum((theta(1) + theta(2) .* X(k,2)) - y(k)); 
    t2 = sum(((theta(1) + theta(2) .* X(k,2)) - y(k)) .* X(k,2));
    theta(1) = theta(1)-(alpha/m)*(t1);
    theta(2) = theta(2)-(alpha/m)*(t2);
    
    J_history(iter) = computeCost(X, y, theta);

end

end