clc;
clear all;
shapes = ["circle";"rectangle";"triangle"];
X= zeros(40,45);
for i = 1:45
    fname = char(strcat(shapes(ceil(i/50)),"/",shapes(ceil(i/50)),string((mod(i,50)==0)*1 + ~(mod(i,50)==0)*mod(i,50)),".json"));
    [X_d,Y_d]= lsf(fname);
    S = X_d + 1i* Y_d;
    ft = fftshift(fft(S,1024));
    a =(fftshift(ft(493:532)));
    X(:,i) = abs(a);
end
y = [1*ones(1,50),2*ones(1,50),3*ones(1,50)]';
% pred = zeros(43,1);
[train_idx,test_idx] = divideblock(X,0.8,0,0.2);



% for j = 2:44
%     X_test = X(:,j)';
%     Xtrain = X(:,[1:j-1,j+1:45])';
%     ytrain = y([1:j-1,j+1:45]);
%     XX= sum(Xtrain.*Xtrain,2);
%     XXdash = 2 * Xtrain * X_test';
%     distance = XX-XXdash;
%     [v,idx] = min(distance);
%     pred(j-1) = ytrain(idx);
% %     [v,i]= sort(distance);
% %     pred(j-1) = mode(ytrain(i(1:3)));
%     end
% ccr = sum(pred==y(2:44))/43;
% conf = confusionmat(pred,y(2:44));



