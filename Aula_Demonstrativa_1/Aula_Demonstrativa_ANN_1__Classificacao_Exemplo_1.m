% -------------------------------------------------------------------------
%     Aula_Demonstrativa_ANN_1__Classificacao_Exemplo_1.m
%     Vanderlei A. Silva - Junho/2021
% -------------------------------------------------------------------------
clear all; clc;
%%  Criando as amostras para Entrada e Alvo
L_Train=748; L_Valid=160; L_Teste=160; 
%[L_Train L_Valid L_Test]./sum([L_Train L_Valid L_Test])
[input_data_train,target_data_train] = criar_dataset_exemplo_classificacao(L_Train);
[input_data_valid,target_data_valid] = criar_dataset_exemplo_classificacao(L_Valid);
[input_data_teste,target_data_teste] = criar_dataset_exemplo_classificacao(L_Teste);

%%  Exibindo as amostras criadas por Gr�fico de Dispers�o
grafico_scatter(81,input_data_train,vec2ind(target_data_train'))

%%  Encadeando as amostras de Train, Valid, Test, para Entrada e Alvo 
x = [ input_data_train;  input_data_valid;  input_data_teste]';
t = [target_data_train; target_data_valid; target_data_teste]';

%%  Escolhendo a Fun��o de Treinamento
% For a list of all training functions type: help nntrain
trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

%%  Definindo o n�mero de n�s na(s) camada(s) oculta(s)
hiddenLayerSize = [2];
% hiddenLayerSize = [2,2];

%%  Criando uma rede (modelo/arquitetura/struct) para Pattern Recognition
net = patternnet(hiddenLayerSize, trainFcn);

%%  Escolhendo as Fun��es de Pr� e P�s Processamento
% For a list of all processing functions type: help nnprocess
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};

%%  Divis�o de dados para Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideFcn = 'divideind';
net.divideParam.trainInd =           1           : L_Train;
net.divideParam.valInd   = L_Train + 1           : L_Train + L_Valid;
net.divideParam.testInd  = L_Train + L_Valid + 1 : L_Train + L_Valid + L_Teste;

%%  Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'crossentropy';  % Cross-Entropy

%%  Choose Plot Functions
% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotperform','plotconfusion'};

%%  Treinamento da Rede
[net,tr] = train(net,x,t);
figure, plotperform(tr);

%%  Visualizando a Rede (diagrama de blocos)
view(net)

%%  Verificando o Desempenho da Rede Por Meio da Matriz de Confus�o
y = net([input_data_teste]');
t_class = vec2ind([target_data_teste]');
y_class = vec2ind(y);
figure, plotconfusion([target_data_teste]',y);

%%  Exibindo o Resultado da Classifica��o por Gr�fico de Dispers�o
grafico_scatter(91,input_data_teste,y_class)

%%  FIM