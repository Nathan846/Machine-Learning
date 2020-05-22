function [U, S] = pca(X)

[m, n] = size(X);
cov=(1/m)*X'*X;
[U S Z]=svd(cov);

end
