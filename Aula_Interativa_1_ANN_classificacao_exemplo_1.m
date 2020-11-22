clear all; close all;
% -------------------------------------------------------------------------
% ---  0) Objetivo: Rede Neural, Classificação Sim/Não, Com 1 neuronio ----
% -------------------------------------------------------------------------
caso_1 = 1; % Rede:  IW = [5.40;5.03], b = -8
caso_2 = 0; % Rede:  IW = [1;1],       b = -1
caso_3 = 0; % Rede:  IW = [5.35;5.35], b = -8
%
% -------------------------------------------------------------------------
% ---  1) Obtendo um DATASET  ---------------------------------------------
% -------------------------------------------------------------------------
% Dataset random [0,1]
lower_limit = 0;    upper_limit = 1;    n_samples = 200;
input_data = random('Uniform',lower_limit,upper_limit,2,n_samples);
%
plot(input_data(1,:),input_data(2,:),'ko'); hold on;
line([0 1],[0.5 0.5],'LineStyle','--','LineWidth',2);
line([0.5 0.5],[0 1],'LineStyle','--','LineWidth',2); grid on;
%
hfg = gca;  setLabels(hfg,18,26,'x_1','x_2');
%
% -------------------------------------------------------------------------
% ---  Caso [1]: Obtendo a Resposta da Rede:  IW = [5.40;5.03], b = -8    -
% -------------------------------------------------------------------------
if (caso_1)
figure(20); % Plot x1,x2,classe
IW = [5.40;5.03]
b  = -8;
v  = [input_data']*IW + b;
y  = hardlim(v);
%
index_0 = find(y == 0);
index_1 = find(y == 1);
plot(input_data(1,index_0),input_data(2,index_0),'ro'); hold on;
plot(input_data(1,index_1),input_data(2,index_1),'bo'); grid on;
line([0 1],[0.5 0.5],'LineStyle','--');
line([0.5 0.5],[0 1],'LineStyle','--');
line([0.5 1],[1 0.5],'LineStyle','--','LineWidth',2,'Color','black');
hfg = gca;  setLabels(hfg,18,26,'x_1','x_2');
% -------------------------------------------------------------------------
figure(21); % Plot samples x y
subplot(2,2,1);
        y1 = [input_data']*IW;
        plot(index_0,y1(index_0),'ro'); hold on;
        plot(index_1,y1(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras',''); title('Com viés');
subplot(2,2,2);
        y2 = y1+b;
        plot(index_0,y2(index_0),'ro'); hold on;
        plot(index_1,y2(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras',''); title('Sem viés');
subplot(2,2,3);
        y3  = hardlim(y2);
        plot(index_0,y3(index_0),'ro'); hold on;
        plot(index_1,y3(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','');  title('Classificação');
end
% -------------------------------------------------------------------------
% ---  Caso [2]: Obtendo a Resposta da Rede:  IW = [1;1], b = -1    -------
% -------------------------------------------------------------------------
if (caso_2)
figure(30); % Plot x1,x2,classe
IW = [1;1]
b  = -1;
v  = [input_data']*IW + b;
y  = hardlim(v);
%
index_0 = find(y == 0);
index_1 = find(y == 1);
plot(input_data(1,index_0),input_data(2,index_0),'ro'); hold on;
plot(input_data(1,index_1),input_data(2,index_1),'bo'); grid on;
line([0 1],[0.5 0.5],'LineStyle','--');
line([0.5 0.5],[0 1],'LineStyle','--');
line([0 1],[1 0],'LineStyle','--','LineWidth',2,'Color','black');
hfg = gca;  setLabels(hfg,18,26,'x_1','x_2');
% -------------------------------------------------------------------------
figure(31); % Plot samples x y
subplot(2,2,1);
        y1 = [input_data']*IW;
        plot(index_0,y1(index_0),'ro'); hold on;
        plot(index_1,y1(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras',''); title('Com viés');
subplot(2,2,2);
        y2 = y1+b;
        plot(index_0,y2(index_0),'ro'); hold on;
        plot(index_1,y2(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras',''); title('Sem viés');
subplot(2,2,3);
        y3  = hardlim(y2);
        plot(index_0,y3(index_0),'ro'); hold on;
        plot(index_1,y3(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','');  title('Classificação');
end
% -------------------------------------------------------------------------
% ---  Caso [3]: Obtendo a Resposta da Rede:  IW = [5.35;5.35], b = -8    -
% -------------------------------------------------------------------------
if (caso_3)
figure(40); % Plot x1,x2,classe
IW = [5.35;5.35]
b  = -8;
v  = [input_data']*IW + b;
y  = hardlim(v);
%
index_0 = find(y == 0);
index_1 = find(y == 1);
plot(input_data(1,index_0),input_data(2,index_0),'ro'); hold on;
plot(input_data(1,index_1),input_data(2,index_1),'bo'); grid on;
line([0 1],[0.5 0.5],'LineStyle','--');
line([0.5 0.5],[0 1],'LineStyle','--');
line([0.5 1],[1 0.5],'LineStyle','--','LineWidth',2,'Color','black');
hfg = gca;  setLabels(hfg,18,26,'x_1','x_2');
% -------------------------------------------------------------------------
figure(41); % Plot samples x y
subplot(2,2,1);
        y1 = [input_data']*IW;
        plot(index_0,y1(index_0),'ro'); hold on;
        plot(index_1,y1(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras',''); title('Com viés');
subplot(2,2,2);
        y2 = y1+b;
        plot(index_0,y2(index_0),'ro'); hold on;
        plot(index_1,y2(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras',''); title('Sem viés');
subplot(2,2,3);
        y3  = hardlim(y2);
        plot(index_0,y3(index_0),'ro'); hold on;
        plot(index_1,y3(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','');  title('Classificação');
end
% -------------------------------------------------------------------------

