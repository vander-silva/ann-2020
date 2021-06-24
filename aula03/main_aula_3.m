%% ---<(0) Aula Redes Neurais EELT7019 - Nov/2019   >----------------------
clear all; close all;
impressoes = 1;
%% ---<(1) Carregar as imagens para treinamento >--------------------------
filename = 'train-images.idx3-ubyte' %% 60 mil imagens 784x60000
Imagens_Treinamento_60k = loadMNISTImages(filename); clear filename;  clc; whos;

%% ---<(2) Carregar os alvos/labels treinamento >--------------------------
filename = 'train-labels.idx1-ubyte' %% 60 mil labels 1x60000 
Labels_Treinamento_60k = loadMNISTLabels(filename)'; clear filename;  clc; whos;

%% ---<(3) Imprimir resultados para verificação >--------------------------
if impressoes
indices = randi(length(Labels_Treinamento_60k),[1 5]); % criacao indices aleatorios
imshowann(Imagens_Treinamento_60k, Labels_Treinamento_60k, -1, 'DataSet Treinamento e Validação',indices); clear indices
end
%% ---<(4) Carregar as imagens para teste        >-------------------------
filename = 't10k-images.idx3-ubyte' %% 10 mil imagens 28x28
Imagens_Test_10k = loadMNISTImages(filename); clear filename;  clc; whos;

%% ---<(5) Carregar os labels teste              >-------------------------
filename = 't10k-labels.idx1-ubyte' %% 10 mil imagens 28x28
Labels_Test_10k = loadMNISTLabels(filename)'; clear filename;  clc; whos;

%% ---<(6) Imprimir resultados para verificação  >-------------------------
if impressoes
indices = randi(length(Labels_Test_10k),[1 5]); % criacao indices aleatorios
imshowann(Imagens_Test_10k, Labels_Test_10k, -1, 'DataSet Para Teste',indices);
end
%% ---<(7) Verificar a distribuição nas classes  >-------------------------
for n = 0:9
 amostras_por_classe(n+1) = length(find(Labels_Treinamento_60k(1,:) == n));
end
figure(2);
plot([0:9],amostras_por_classe); hold on;
stem([0:9],amostras_por_classe,'filled'); hold on; grid on;
line([-2 10],[6000 6000],'Color','b');
clear n amostras_por_classe;

%% ---<(8) Igualar a distribuição nas classes    >-------------------------
qtde_por_clas = 1000;
indices = [];
for n = 0:9
 aux = find(Labels_Treinamento_60k(1,:) == n);
 indices = [indices; aux(1,1:qtde_por_clas)];
end
indices = sort(indices);
Imagens_Treinamento_10k = Imagens_Treinamento_60k(:,indices);
Labels_Treinamento_10k = Labels_Treinamento_60k(1,indices);
clear qtde_por_clas indices aux Imagens_Treinamento_60k Labels_Treinamento_60k n;   whos;

%% ---<(9) Imprimir resultados para verificação  >-------------------------
if impressoes
indices = randi(length(Labels_Treinamento_10k),[1 10]); % criacao indices aleatorios
imshowann(Imagens_Treinamento_10k,Labels_Treinamento_10k,-1,'Data Set Treinamento Equalizado',indices); clear indices
end
%% ---<(10) Verificar a distribuição nas classes  >------------------------
for n = 0:9
 amostras_por_classe(n+1) = length(find(Labels_Treinamento_10k(1,:) == n));
end
hfg = figure(3);
plot([0:9],amostras_por_classe); hold on;
stem([0:9],amostras_por_classe,'filled'); hold on; grid on;
line([-2 10],[6000 6000],'Color','k');
hfg.ToolBar = 'none';
clear n amostras_por_classe;

%% ---<(11) Construir Vetor Alvo Treinamento - Target Train >--------------
Targets_Treinamento_10k = zeros(10,length(Labels_Treinamento_10k));
for k = 1:length(Labels_Treinamento_10k)
    %Targets_Treinamento_10k(:,k)= full(ind2vec(Labels_Treinamento_10k(1,k)+1,10));
    Targets_Treinamento_10k(:,k)= index2vector(Labels_Treinamento_10k(1,k)+1,10);
end
clear k;  whos;

%% ---<(12) Construir Vetor Alvo Teste - Target Test   >-------------------
for k = 1:length(Labels_Test_10k)
    %Targets_Test_10k(:,k)= full(ind2vec(Labels_Test_10k(1,k)+1,10));
    Targets_Test_10k(:,k)= index2vector(Labels_Test_10k(1,k)+1,10);
end
clear k;
%% ---<(13) Projetar a Rede Neural   >--------------------------------------
nnstart
[Saida_ANN] = myfun(Imagens_Test_10k(:,:));
 for k = 1:size(Saida_ANN,2)
    Labels_Saida_ANN(k) = find(  Saida_ANN(:,k) == max(Saida_ANN(:,k))  ) - 1;
 end
clear k Label_Teste_Saida
 
%% ---<(14) Imprimir resultados para verificação  >------------------------
for indices = 1:100
    if Labels_Saida_ANN(indices) == Labels_Test_10k(indices)
       str = sprintf('[%d],  Alvo: %d,  Saida: %d,   [OK]\n',indices,Labels_Test_10k(indices),Labels_Saida_ANN(indices));
       imshowann(Imagens_Test_10k, Labels_Test_10k, Labels_Saida_ANN, str,indices);       
    else
       str = sprintf('[%d],  Alvo: %d,  Saida: %d,   [ERRO]\n',indices,Labels_Test_10k(indices),Labels_Saida_ANN(indices));
       imshowann(Imagens_Test_10k, Labels_Test_10k, Labels_Saida_ANN, str,indices,'yellow');   pause(3);    
    end
end
clear indices str

%% ---<(15) Indices Errados                   >----------------------------
indices_errados = find(Labels_Saida_ANN ~= Labels_Test_10k);
for indices = indices_errados
   %imshowann(Imagens_Test_10k(:,amostras),Label_Teste_Saida(indices))
   str = sprintf('[%d],  Alvo: %d,  Saida: %d,   [ERRO]\n',indices,Labels_Test_10k(indices),Labels_Saida_ANN(indices));
   imshowann(Imagens_Test_10k, Labels_Test_10k, Labels_Saida_ANN, str,indices,'yellow');   pause(3); 
end
clear indices str


