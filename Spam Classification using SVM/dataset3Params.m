function [C, sigma] = dataset3Params(X, y, Xval, yval)

Cselect = [0, 0.01,03, 0.1, 0.3, 1, 3, 10, 30];
sigmas = [8 , 0.01,03, 0.1, 0.3, 1, 3, 10, 30];
maximumerr=1000;
for i=1:size(Cselect,2)
    for j=1:size(sigmas,2)
        t=svmTrain(X,y,Cselect(i) , @(x1, x2)gaussianKernel(x1, x2, sigmas(j)));
        predictions=svmPredict(t,Xval);
        reval=mean(double(predictions ~= yval));
        if(reval<maximumerr)
            maximumerr=reval;
            C=Cselect(i);
            sigma=sigmas(j);
        end
    end
end

end
