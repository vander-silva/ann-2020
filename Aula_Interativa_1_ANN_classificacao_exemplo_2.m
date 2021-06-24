% Aula_Interativa_1_ANN_classificacao_exemplo_1.m
clear all; close all;
%% -------------------------------------------------------------------------
% ---  0) Objetivo: Rede Neural, ClassificaÃ§Ã£o Sim/NÃ£o, Com 1 neuronio ----
% -------------------------------------------------------------------------
% caso_1 = 1; % Rede:  IW = [5.40;5.03], b = -8
% caso_2 = 1; % Rede:  IW = [1;1],       b = -1
% caso_3 = 1; % Rede:  IW = [5.35;5.35], b = -8
%
%% -------------------------------------------------------------------------
% ---  1) CRIANDO um DATASET ALEATÓRIO ------------------------------------
% -------------------------------------------------------------------------
n_samples = 200;
[input_data,target_data] = criar_dataset_exemplo_classificacao(n_samples)

%% Ploting
classes_cores = ['ro';'go';'bo';'ko']; % [1 2 3 4];
for k = 1:size(input_data,1)
    classe = vec2ind(target_data(k,:)');
    plot(input_data(k,1),input_data(k,2), classes_cores(classe,:)); hold on;
    %plot(input_data(k,1),input_data(k,2),'ro'); hold on;
end
line([0 1],[0.5 0.5],'LineStyle','--','LineWidth',2);
line([0.5 0.5],[0 1],'LineStyle','--','LineWidth',2); grid on;
hfg = gca;  setLabels(hfg,18,26,'x_1','x_2');

%% Limpando o workspace
clear Class* input_data_* *Lim indice_* n_samples x_* classe* k hfg
whos
%% nnstart
y = net(input_data');
%% Ploting
classes_cores = ['ro';'go';'bo';'ko']; % [1 2 3 4];
for k = 1:size(input_data,1)
    classe = find(y(:,k)== max(y(:,k))),
    plot(input_data(k,1),input_data(k,2), classes_cores(classe,:)); hold on;
end
line([0 1],[0.5 0.5],'LineStyle','--','LineWidth',2);
line([0.5 0.5],[0 1],'LineStyle','--','LineWidth',2); grid on;
hfg = gca;  setLabels(hfg,18,26,'x_1','x_2');
%% -------------------------------------------------------------------------
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
hfg = gca;  setLabels(hfg,18,20,'amostras','y_1'); title('Com viés');
subplot(2,2,2);
        y2 = y1+b;
        plot(index_0,y2(index_0),'ro'); hold on;
        plot(index_1,y2(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','y_2'); title('Sem viés');
subplot(2,2,3);
        y3  = hardlim(y2);
        plot(index_0,y3(index_0),'ro'); hold on;
        plot(index_1,y3(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','y_3');  title('Classificação');
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
hfg = gca;  setLabels(hfg,18,20,'amostras','y_1'); title('Com viés');
subplot(2,2,2);
        y2 = y1+b;
        plot(index_0,y2(index_0),'ro'); hold on;
        plot(index_1,y2(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','y_2'); title('Sem viés');
subplot(2,2,3);
        y3  = hardlim(y2);
        plot(index_0,y3(index_0),'ro'); hold on;
        plot(index_1,y3(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','y_3');  title('Classificação');
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
hfg = gca;  setLabels(hfg,18,20,'amostras','y_1'); title('Com viés');
subplot(2,2,2);
        y2 = y1+b;
        plot(index_0,y2(index_0),'ro'); hold on;
        plot(index_1,y2(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','y_2'); title('Sem viés');
subplot(2,2,3);
        y3  = hardlim(y2);
        plot(index_0,y3(index_0),'ro'); hold on;
        plot(index_1,y3(index_1),'bo'); hold on; grid on;
hfg = gca;  setLabels(hfg,18,20,'amostras','y_3');  title('Classificação');
end
% -------------------------------------------------------------------------