clc;
clear all;
close all;
fname = 'triangle/triangle11.json';

fid = fopen(fname);
raw = fread(fid,inf);
str = char(raw');
fclose(fid);

val = jsondecode(str);
x = val(:,1);
y = val(:,2);
z = val(:,3);

x = (x - min(x))/(max(x) - min(x));
y = (y - min(y))/(max(y) - min(y));
z = (z - min(z))/(max(z) - min(z));

figure;
f=fit([x,y],z,'poly11','Normalize','on','Robust','Bisquare');

coeffs = coeffvalues(f);
pc = coeffs(1);
px = coeffs(2);
py = coeffs(3);
plot( f, [x, y], z );

XYZ = [x';y';z'];
title(sprintf('Plotting plane z=(%f)*x+(%f)*y+(%f)',px, py, pc));

N1 = [px/pc, py/pc, -1/pc];

% N1 = [1 -4 3]; % Normal vector to plane
N2= [0 0 -1]; % normal vector to x-y plane
cosang = dot(N1,N2); % actually n1.n2 = |n1||n2|cosang
angle = acosd((cosang / norm(N1)*norm(N2)));

XYZnew = AxelRot(XYZ, angle, [1 0 0],[]);

figure;
plot3(x, y, z, 'r');
hold on
plot3(XYZnew(1,:) , XYZnew(2,:), XYZnew(3,:));
figure;
plot(XYZnew(1,:) , XYZnew(2,:))


