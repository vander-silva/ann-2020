function [input_data,target_data] = criar_dataset_exemplo_classificacao(n_samples)
%% Dados de Entrada (x1,x2), Classes
n_samples = round(n_samples/4);
% CLASSE 1
LowLim = 0.0;  UpLim = 0.5;   x_1 = random('Uniform',LowLim,UpLim,n_samples,1);
LowLim = 0.0;  UpLim = 0.5;   x_2 = random('Uniform',LowLim,UpLim,n_samples,1);
                              input_data_1 =[x_1,x_2];
                              Class_1 = [1 0 0 0].*ones(n_samples,1);
% CLASSE 2
LowLim = 0.5;  UpLim = 1.0;   x_1 = random('Uniform',LowLim,UpLim,n_samples,1);
LowLim = 0.0;  UpLim = 0.5;   x_2 = random('Uniform',LowLim,UpLim,n_samples,1);
                              input_data_2=[x_1,x_2];
                              Class_2 = [0 1 0 0].*ones(n_samples,1);
% CLASSE 3
LowLim = 0.0;  UpLim = 0.5;   x_1 = random('Uniform',LowLim,UpLim,n_samples,1);
LowLim = 0.5;  UpLim = 1.0;   x_2 = random('Uniform',LowLim,UpLim,n_samples,1);
                              input_data_3 =[x_1,x_2];
                              Class_3 = [0 0 1 0].*ones(n_samples,1);
% CLASSE 4
LowLim = 0.5;  UpLim = 1.0;   x_1 = random('Uniform',LowLim,UpLim,n_samples,1);
LowLim = 0.5;  UpLim = 1.0;   x_2 = random('Uniform',LowLim,UpLim,n_samples,1);
                              input_data_4 =[x_1,x_2];
                              Class_4 = [0 0 0 1].*ones(n_samples,1);
%% Encadeamento
input_data  = [input_data_1;input_data_2;input_data_3;input_data_4];
target_data = [Class_1;Class_2;Class_3;Class_4];

%% Embaralhar
indice_sequencial  = 1:n_samples*4;
indice_embaralhado = embaralhar(indice_sequencial);

input_data(:,1) = input_data(indice_embaralhado,1);
input_data(:,2) = input_data(indice_embaralhado,2);
target_data(:,1:4) = target_data(indice_embaralhado,1:4);