clc;
clear all;
shapes = ["circle";"rectangle";"triangle"];
X= zeros(100,45);
for i = 1:45
    fname = char(strcat(shapes(ceil(i/15)),"/",shapes(ceil(i/15)),string((mod(i,15)==0)*1 + ~(mod(i,15)==0)*mod(i,15)),".json"));
    [X_d,Y_d]= lsf(fname);
    S = X_d + 1i* Y_d;
    ft = fftshift(fft(S,1024));
    a =ifft(fftshift(ft(463:562)));
    X(:,i) = abs(a);
end
X_test = X(:,39)';
X = X(:,[1:38,40:45])';
y = [1*ones(1,15),2*ones(1,15),3*ones(1,15)]';
XX= sum(X.*X,2);
XXdash = 2 * X * X_test';
distance = XX-XXdash;
[v,i]= sort(distance);
pred = mode(y(i(1:5)));






