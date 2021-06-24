% -------------------------------------------------------------------------
%     Aula_Demonstrativa_ANN_1__Classificacao_Exemplo_1.m
%     Vanderlei A. Silva - Junho/2021
% -------------------------------------------------------------------------
% clear all; clc;
% x = Imagens_Treinamento_20k;
% t = Targets_Treinamento_20k;
%%  Criando as amostras para Entrada e Alvo
%   L_teste_por_class              1x1                        8  double              
%   L_train_por_class              1x1                        8  double              
%   L_valid_por_class              1x1                        8  double  
percentis = 100.*[L_train_por_class L_valid_por_class L_teste_por_class]./sum([L_train_por_class L_valid_por_class L_teste_por_class]);
fprintf('\nTreinamento %.2f%%, Validacao %.2f%%, Teste %.2f%%\n',percentis(1),percentis(2),percentis(3));
%%  Encadeando as amostras de Train, Valid, Test, para Entrada e Alvo 
x = [ Imagens_Treinamento_20k,  Imagens_Validacao_10k,  Imagens_Teste_8k];
t = [ Targets_Treinamento_20k,  Targets_Validacao_10k,  Targets_Teste_8k];

%%  Escolhendo a Função de Treinamento
% For a list of all training functions type: help nntrain
trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

%%  Definindo o número de nós na(s) camada(s) oculta(s)
hiddenLayerSize = [40];
% hiddenLayerSize = [2,2];

%%  Criando uma rede (modelo/arquitetura/struct) para Pattern Recognition
net = patternnet(hiddenLayerSize, trainFcn);

%%  Escolhendo as Funções de Pré e Pós Processamento
% For a list of all processing functions type: help nnprocess
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};

%%  Divisão de dados para Training, Validation, Testing
% For a list of all data division functions type: help nndivide
L_Train = L_train_por_class * 10;
L_Valid = L_valid_por_class * 10;
L_Teste = L_teste_por_class * 10;
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

%%  Verificando o Desempenho da Rede Por Meio da Matriz de Confusão
y = net(Imagens_Teste_8k);
t_class = vec2ind(Targets_Teste_8k);
y_class = vec2ind(y);
figure, plotconfusion([Targets_Teste_8k],y);

%%  FIM