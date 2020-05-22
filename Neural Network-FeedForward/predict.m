function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);
p = zeros(size(X, 1), 1);
X = [ones(m, 1) X];
z1=X*Theta1';
z1=sigmoid(z1)
z1=[ones(m,1) z1];
o=z1*Theta2';
sigma=sigmoid(o);
[j,f]=max(sigma,[],2);
p=f;

end
