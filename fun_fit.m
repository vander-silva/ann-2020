// DATASET
// creating a function
x = -3:1/200:3;
fx = x.^7 - 14*x.^5 + 49*x.^3 - 36*x ;
figure(102);
plot(x,fx); hold on;
// inserting some noise
media  = 0;
desvio = 10; 
ruido = random('norm',media,desvio,1,length(x));
plot(x,fx+ruido,'.');

// defining the dataset
input_data = x;
target_data = fx+ruido;

xnet = -3:1/100:3;
plot(xnet,net1(xnet),'r');
legend('f(x)','dataset','net(dataset)');