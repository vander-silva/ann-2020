figure(102);
x = -3:1/200:3;

fx = x.^7 - 14*x.^5 + 49*x.^3 - 36*x ;
plot(x,fx); hold on;

media  = 0;
desvio = 10; 
ruido = random('norm',media,desvio,1,length(x));
plot(x,fx+ruido,'.');
dataset = fx+ruido;

xnet = -3:1/100:3;
plot(xnet,net1(xnet),'r');
legend('f(x)','dataset','net(dataset)');