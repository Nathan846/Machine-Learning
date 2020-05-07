function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)

X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);
J = 1/2*sum(sum(((X * Theta'-Y).^2).*R));
Theta_grad = zeros(size(Theta));
for i = 1: num_movies
    idx = find(R(i,:) == 1);
    Theta_temp = Theta(idx,:);
    Y_temp = Y(i,idx);
    X_grad(i,:) = (X(i,:) * Theta_temp' - Y_temp) * Theta_temp;
    X_grad(i,:) = X_grad(i,:) + lambda * X(i,:);
end
for j = 1: num_users
    idx = find(R(:,j) == 1); % find i
    X_temp = X(idx,:);
    Y_temp = Y(idx,j);
    Theta_grad(j,:) = (X_temp * Theta(j,:)' - Y_temp)' * X_temp;
    Theta_grad(j,:) = Theta_grad(j,:) + lambda * Theta(j,:);
end
J = J + (lambda/2) * (sum(sum((Theta.^2))) + sum(sum((X.^2))));
grad = [X_grad(:); Theta_grad(:)];

end
