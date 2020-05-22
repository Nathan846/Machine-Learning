function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);       
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

a1=[ones(m,1) X];
z2=a1*Theta1';
a2=[ones(m,1) sigmoid(z2)];
z3=a2*Theta2';
a3=sigmoid(z3);
cost=0;
for i=1:m
    for k=1:num_labels
        cost=cost+((y(i)==k)*(log(a3(i,k)))+(1-(y(i)==k))*log(1-(a3(i,k))));
    end
end
b=size(X,1);
r= (lambda/(2*m))*((sum(sum(Theta1(:,2:end).^2))) + sum(sum(Theta2(:,2:end).^2)));
J=(-1/b)*(cost)+r;

newy=zeros(size(X,1),size(a3,2));
for i=1:num_labels
    newy(:,i)=(y==i);
end
del3=a3-newy;
del2=(del3*Theta2).*[ones(size(z2,1),1) sigmoidGradient(z2)];
D1 = del2(:,2:end)' * a1;   
D2 = del3' * a2;

Theta1_grad = (1/m)*D1+(lambda/m)*[zeros(size(Theta1, 1), 1) Theta1(:,2:end);];
Theta2_grad = (1/m)*D2+(lambda/m)*[zeros(size(Theta2, 1), 1) Theta2(:,2:end);];% Part 3: Implement regularization with the cost function and gradients.
%
% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
