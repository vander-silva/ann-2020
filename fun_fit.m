clear all; close all; clc;
% -----------------------------------------------------------
%              DATASET -> [input_data, target_data]
% -----------------------------------------------------------
% creating a function
	x = -3:1/200:3;
	fx = x.^7 - 14*x.^5 + 49*x.^3 - 36*x ;
	figure(102);      plot(x,fx);
% inserting some noise
	media  = 0;		
	desvio = 10; 
	ruido = random('norm',media,desvio,1,length(fx)); 
% dataset
	input_data = x;
	target_data = fx+ruido;     clear x media desvio fx ruido;
	figure(103);      plot(input_data,target_data,'.','DisplayName','Dataset'); hold on;
% -----------------------------------------------------------
%                   Projeto da Rede Neural
% -----------------------------------------------------------
	nnstart;
    prompt = 'Salve sua RNA com o nome: net  <enter>';
    response = input(prompt);
% -----------------------------------------------------------
%                     Uso da Rede Neural
% -----------------------------------------------------------
	new_input_data = -3:1/130:3;
	plot(new_input_data, net(new_input_data),'r','DisplayName','net(New input data)'); hold on;