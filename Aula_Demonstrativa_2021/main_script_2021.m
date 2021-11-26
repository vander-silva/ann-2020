%% Exemplo de Classificação com iris_dataset
clear all; clc; close all;
%% Voce vai precisar de:
% 1) main_script_2021.m         >> este arquivo: manipular dataset
% 2) embaralhar.m               >> funcao para embaralhar um vetor
% 3) ann_net_project_example.m  >> script para projetar a rede neural
%%
load iris_dataset.mat
%% Iris: load iris_dataset.mat
%   irisInputs               4x150               4800  double                   
%   irisTargets              3x150               3600  double 
% Entradas:
%    [1] Comprimento da sépala em cm
%    [2] Largura     da sépala em cm
%    [3] Comprimento da pétala em cm
%    [4] Largura     da pétala em cm
%
% Classes:
%    [1] Iris setosa
%    [2] Iris versicolor
%    [3] Iris virginica
%% 1) VISULIZAR O FORMATO DOS DADOS
whos;
irisInput_names   = {'Sepal Length';'Sepal Width';'Petal Length';'Petal Width'};
irisTarget_names  = {'setosa';'versicolor';'virginica'};
cl_indices = [1,51,101,52]; % cl_indices = [1,2,3,4];  cl_indices = [1,51,101,52];
disp([ irisInput_names, num2cell(          irisInputs(:,cl_indices))]);
disp([irisTarget_names, num2cell(         irisTargets(:,cl_indices))]);
disp(['vec2ind   '    , num2cell([vec2ind(irisTargets(:,cl_indices))])]);
%% 2) ANÁISE GRÁFICA DOS DADOS
figure('Name','Gráfico de Dispersão','Position',[1 1 1303 961]);     cl_cont = 1;
for cl_lin = 1:4
    for cl_col = 1:4
        %% Grafico de dispersão
        subplot(4,4,cl_cont); gscatter(irisInputs(cl_col,:),irisInputs(cl_lin,:),vec2ind(irisTargets));
        cl_h = gca; cl_h.Legend.Visible = 'off';
        %% Na diagonal principal imprimir legenda e texto
        if cl_lin == cl_col
            text(cl_h.XLim(1)+0.5,cl_h.YLim(2)-1,irisInput_names(cl_lin),'Color','red','FontSize',14);
            cl_h.Legend.Visible = 'on';
            cl_h.Legend.String = irisTarget_names;
            cl_h.Legend.Location = 'southeast';
        end
        %% Atualizar o contador de gráfico
        cl_cont = cl_cont+1;
    end
end
clear -regexp ^cl ans; whos;
%% 3) DISTRIBUIÇÃO DAS CLASSES
figure('Name','Distribuição das Classes','Position',[1 1 1303 607]);
stem(vec2ind(irisTargets(:,:))); grid on; axis([-20 170 0 3.2]);
yticks([1  2  3]); yticklabels({'Classe 1','Classe 2','Classe 3'});
xlabel('Amostras de Alvo'); xticks([0 50 100 150]); 
%% 4) DIVISÃO DAS AMOSTRAS: DATASETS TREIN. VALID. TEST. 
% [0.68 0.16 0.16]*150 = [102   24   24]
%             Treinamento  Validação      Teste
% Classe 1:            34          8          8 
% Classe 2:            34          8          8 
% Classe 3:            34          8          8 
%         TOTAL:      102         24         24
%% 4.1) Dataset de Treinamento
index_trein = embaralhar([1:34, 51:84, 101:134]); 
irisInputs_trein  = irisInputs (:,index_trein);
irisTargets_trein = irisTargets(:,index_trein);
%%
figure('Name','Distribuição das Classes - Treinamento','Position',[1 1 1303 607]);
stem(vec2ind(irisTargets_trein(:,:))); grid on; axis([-10 114 0 3.2]);
yticks([1  2  3]); yticklabels({'Classe 1','Classe 2','Classe 3'});
xlabel('Amostras de Alvo - Dataset Treinamento'); xticks([0 34 68 102]); 
%% 4.2) Dataset de Validação
index_valid = embaralhar([35:42, 85:92, 135:142]);
irisInputs_valid  = irisInputs (:,index_valid);
irisTargets_valid = irisTargets(:,index_valid);
%%
figure('Name','Distribuição das Classes - Validação','Position',[1 1 1303 607]);
stem(vec2ind(irisTargets_valid(:,:))); grid on; axis([-3 27 0 3.2]);
yticks([1  2  3]); yticklabels({'Classe 1','Classe 2','Classe 3'});
xlabel('Amostras de Alvo - Dataset Validação'); xticks([0 8 16 24]); 
%% 4.3) Dataset de Testes
index_test = embaralhar([43:50, 93:100, 143:150]);
irisInputs_test  = irisInputs (:,index_test);
irisTargets_test = irisTargets(:,index_test);
%%
figure('Name','Distribuição das Classes - Testes','Position',[1 1 1303 607]);
stem(vec2ind(irisTargets_test(:,:))); grid on; axis([-3 27 0 3.2]);
yticks([1  2  3]); yticklabels({'Classe 1','Classe 2','Classe 3'});
xlabel('Amostras de Alvo - Dataset Testes'); xticks([0 8 16 24]);  
%% 5) Toolbox de ANN - nnstart
% nnstart;
% ann_net_project_example;
%
% Dataset Composition...
% x = [irisInputs_trein,   irisInputs_valid,  irisInputs_test];
% t = [irisTargets_trein, irisTargets_valid, irisTargets_test];
%
% Dataset Divide...
% net.divideFcn = 'divideind';
% net.divideParam.trainInd =   1  : 102;
% net.divideParam.valInd   = 103  : 126;
% net.divideParam.testInd  = 127  : 150;
%
% Test the Network...
% y = net(irisInputs_test);
% t =     irisTargets_test;
% tind = vec2ind(t);
% yind = vec2ind(y);
% plotconfusion(t,y);
%
% net.layers{1}.initFcn
