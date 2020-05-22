function centroids = computeCentroids(X, idx, K)

[m n] = size(X);
centroids = zeros(K, n);
k=zeros(K,1);
for i=1:m
    centroids(idx(i),:)=((k(idx(i))*centroids(idx(i),:))+X(i,:))/(k(idx(i))+1);
    k(idx(i))=k(idx(i))+1;

end

