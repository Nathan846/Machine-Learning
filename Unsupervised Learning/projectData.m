function Z = projectData(X, U, K)

Z = zeros(size(X, 1), K);
U1=U(:, 1 : K);
Z=X*U1;


end
