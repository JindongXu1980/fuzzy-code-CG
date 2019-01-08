function y=fun2(x)
x=0:0.01:1;       
y=1-0.97*exp(-0.5*x.^2);
plot(y);
y1=1-0.97*exp(-x.^2);
hold on,
plot(y1,'*');
y2=1-0.99*exp(-1.5*x.^2);
hold on,
plot(y2,'-.');
y3=1-0.97*exp(-5*x.^2);
hold on,
plot(y3,'o');