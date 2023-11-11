t = 0:0.5:120;
k = 0.05;
y = 75*exp(-k.*t);
n = size(t);
N = n(1,2);
P = [N sum(t); sum(t) sum(t.*t)];
Y = [sum(log(y)); sum(t.*log(y))];
Q = inv(P)*Y;