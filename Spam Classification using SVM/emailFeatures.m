function x = emailFeatures(word_indices)

n = 1899;

x = zeros(n, 1);
for i=1:n
    count=0;
    for j=1:size(word_indices,1)
        if(word_indices(j)==i)
            x(i)=1;
            count=1;
        end
    end
    if(count==0)
        x(i)=0;
    end
end

end
