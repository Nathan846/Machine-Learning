function idx = findClosestCentroids(X, centroids)

idx = zeros(size(X,1), 1);
K = size(centroids, 1);
for i=1:size(X,1)
    maxi=10000;
    index = 0;
    for j=1:K
        F=norm(X(i,:)-centroids(j,:));
        if(F<maxi)
            maxi = F;
            index = j;
        end
    idx(i)=index;
    end
end
end

