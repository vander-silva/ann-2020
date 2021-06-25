% -------------------------------------------------------------------------
%     Aula_Demonstrativa_ANN_2__Part_1_Carregar_DataSet.m (Mnist, Patt.Recog)
%     Vanderlei A. Silva - Junho/2021
% -------------------------------------------------------------------------
clear all;  impressoes = 0; close all;
%% ---<(1) Carregar DataSet treinamento >----------------------------------
% IMAGENS
filename = 'train-images.idx3-ubyte' %% 60 mil imagens 784x60000
Imagens_Treinamento_60k = loadMNISTImages(filename); clear filename;  clc; whos;
% LABELS
filename = 'train-labels.idx1-ubyte' %% 60 mil labels 1x60000 
Labels_Treinamento_60k = loadMNISTLabels(filename)'; clear filename;  clc; whos;

%% ---<(2) Carregar DataSet Teste        >---------------------------------
% IMAGENS
filename = 't10k-images.idx3-ubyte' %% 10 mil imagens 28x28
Imagens_Test_10k = loadMNISTImages(filename); clear filename;  clc; whos;
% LABELS
filename = 't10k-labels.idx1-ubyte' %% 10 mil imagens 28x28
Labels_Test_10k = loadMNISTLabels(filename)'; clear filename;  clc; whos;

%% ---<(3) Imprimir alguns resultados para verificação >-------------------
% DATASET TREINAMENTO
if impressoes
indices = randi(length(Labels_Treinamento_60k),[1 5]); % criacao indices aleatorios
imshowann(Imagens_Treinamento_60k, Labels_Treinamento_60k, -1, 'DataSet Treinamento e Validação',indices); clear indices
end
% DATASET TESTE
if impressoes
indices = randi(length(Labels_Test_10k),[1 5]); % criacao indices aleatorios
imshowann(Imagens_Test_10k, Labels_Test_10k, -1, 'DataSet Para Teste',indices);
end
%% ---<(4) Verificar a distribuição nas classes  >-------------------------
for n = 0:9
 amostras_por_classe(n+1) = length(find(Labels_Treinamento_60k(1,:) == n));
end
figure(2);
plot([0:9],amostras_por_classe); hold on;
stem([0:9],amostras_por_classe,'filled'); hold on; grid on;
line([-2 10],[6000 6000],'Color','b');
clear n amostras_por_classe;

%% ---<(5) Igualar a distribuição das classes e Reduzir e Embaralhar amostras >------
L_train_por_class = 2000;
L_valid_por_class = 1000;
L_teste_por_class =  800;
indices_train = [];
indices_valid = [];
indices_teste = [];
for n = 0:9
 indices_class_trein = find(Labels_Treinamento_60k(1,:) == n);
 indices_class_teste = find(Labels_Test_10k(1,:) == n);
 indices_train = [indices_train, indices_class_trein(1,1:L_train_por_class)];
 indices_valid = [indices_valid, indices_class_trein(1,L_train_por_class+1:L_train_por_class+L_valid_por_class) ];
 indices_teste = [indices_teste, indices_class_teste(1,1:L_teste_por_class) ];
end
indices_train = embaralhar(indices_train);
indices_valid = embaralhar(indices_valid);
indices_teste = embaralhar(indices_teste);

Imagens_Treinamento_20k = Imagens_Treinamento_60k(:,indices_train);
Labels_Treinamento_20k  = Labels_Treinamento_60k (1,indices_train);

Imagens_Validacao_10k   = Imagens_Treinamento_60k(:,indices_valid);
Labels_Validacao_10k    = Labels_Treinamento_60k (1,indices_valid);

Imagens_Teste_8k   = Imagens_Test_10k(:,indices_teste);
Labels_Teste_8k    = Labels_Test_10k (1,indices_teste);

clear qtde_por_clas indices aux Imagens_Treinamento_60k Labels_Treinamento_60k n k; clc;   whos;

%% ---<(6) Imprimir resultados para verificação  >-------------------------
pause
impressoes = 0;
if impressoes
indices = randi(length(Labels_Treinamento_20k),[1 10]); % criacao indices aleatorios
imshowann(Imagens_Treinamento_20k,Labels_Treinamento_20k,-1,'Data Set Treinamento Equalizado',indices); clear indices
end
if impressoes
indices = randi(length(Labels_Validacao_10k),[1 10]); % criacao indices aleatorios
imshowann(Imagens_Validacao_10k,Labels_Validacao_10k,-1,'Data Set Validacao Equalizado',indices); clear indices
end
if impressoes
indices = randi(length(Labels_Teste_8k),[1 10]); % criacao indices aleatorios
imshowann(Imagens_Teste_8k,Labels_Teste_8k,-1,'Data Set Teste Equalizado',indices); clear indices
end
%% ---<(7) Verificar a distribuição nas classes de cada dataset  >---------
% DATASET DE TREINAMENTO -------------------------------
for n = 0:9
 amostras_por_classe(n+1) = length(find(Labels_Treinamento_20k(1,:) == n));
end
hfg = figure(3);
subplot(2,2,1); plot([0:9],amostras_por_classe); hold on;
stem([0:9],amostras_por_classe,'filled'); hold on; grid on;
line([-0.5 10],[3000 3000],'Color','k');
hfg.ToolBar = 'none';
clear n amostras_por_classe;
% DATASET DE VALIDACAO ----------------------------------
for n = 0:9
 amostras_por_classe(n+1) = length(find(Labels_Validacao_10k(1,:) == n));
end
hfg = figure(3);
subplot(2,2,2); plot([0:9],amostras_por_classe); hold on;
stem([0:9],amostras_por_classe,'filled'); hold on; grid on;
line([-0.5 10],[1500 1500],'Color','k');
hfg.ToolBar = 'none';
clear n amostras_por_classe;
% DATASET DE TESTE -------------------------------------
for n = 0:9
 amostras_por_classe(n+1) = length(find(Labels_Teste_8k(1,:) == n));
end
hfg = figure(3);
subplot(2,2,3); plot([0:9],amostras_por_classe); hold on;
stem([0:9],amostras_por_classe,'filled'); hold on; grid on;
line([-0.5 10],[1000 1000],'Color','k');
hfg.ToolBar = 'none';
clear n amostras_por_classe;

%% ---<(8) Construir Vetores Alvo - Targets >------------------------------
Targets_Treinamento_20k = zeros(10,length(Labels_Treinamento_20k));
for k = 1:length(Labels_Treinamento_20k)
    Targets_Treinamento_20k(:,k)= ind2vec([Labels_Treinamento_20k(1,k)+1],10);
    %Targets_Treinamento_10k(:,k)= index2vector(Labels_Treinamento_10k(1,k)+1,10);
end

Targets_Validacao_10k = zeros(10,length(Labels_Validacao_10k));
for k = 1:length(Labels_Validacao_10k)
    Targets_Validacao_10k(:,k)= ind2vec([Labels_Validacao_10k(1,k)+1],10);
    %Targets_Validacao_20k(:,k)= index2vector(Labels_Validacao_10k(1,k)+1,10);
end

Targets_Teste_8k = zeros(10,length(Labels_Teste_8k));
for k = 1:length(Labels_Teste_8k)
    Targets_Teste_8k(:,k)= ind2vec([Labels_Teste_8k(1,k)+1],10);
    %Targets_Teste_20k(:,k)= index2vector(Labels_Teste_8k(1,k)+1,10);
end
clear *Test_10k hfg indices* k;clc;  whos;

%% FIM