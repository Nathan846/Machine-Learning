function [bestEpsilon bestF1] = selectThreshold(yval, pval)

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    t=pval<epsilon;
    fp = sum((t == 1) & (yval == 0));
    tp = sum((t == 1) & (yval == 1));
    fn = sum((t == 0) & (yval == 1));
    p=tp/(tp+fp);
    r=tp/(tp+fn);
    F1 = (2*p*r)/(p+r);
    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
