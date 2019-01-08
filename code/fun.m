function y=fun(x)
x=0:0.01:1;       
y=1-0.99*exp(-x.^2);
plot(y);
y1=1-0.85*exp(-x.^2);
hold on,
plot(y1,'*');
y2=1-0.5*exp(-x.^2);
hold on,
plot(y2,'+');
y3=1-0.15*exp(-x.^2);
hold on,
plot(y3,'x');