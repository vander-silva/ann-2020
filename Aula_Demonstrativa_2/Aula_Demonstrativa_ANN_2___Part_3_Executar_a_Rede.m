% -------------------------------------------------------------------------
%     Aula_Demonstrativa_ANN_2___Parte3_Executar_a_Rede.m (Mnist)
%     Vanderlei A. Silva - Junho/2021
% -------------------------------------------------------------------------
%% ---<(13) Executar a Rede para DataSet de Testes  >----------------------
% clear all; load('rede_784_40_10_resultados.mat');
y = net(Imagens_Teste_8k);
t_class = vec2ind(Targets_Teste_8k);
y_class = vec2ind(y);
pause
%% ---<(14) Imprimir resultados para verificação  >------------------------
for indices = 1:100
    if y_class(indices) == t_class(indices)
       str = sprintf('[%d],  Alvo: %d,  Saida: %d,   [OK]\n',indices,t_class(indices)-1,y_class(indices)-1);
       imshowann(Imagens_Teste_8k, t_class-1, y_class-1, str,indices);       
    else
       str = sprintf('[%d],  Alvo: %d,  Saida: %d,   [ERRO]\n',indices,t_class(indices)-1,y_class(indices)-1);
       imshowann(Imagens_Teste_8k, t_class-1, y_class-1, str,indices,'yellow');   pause(3);    
    end
end
clear indices str
pause
%% ---<(15) Imprimir Apenas Indices Errados   >----------------------------
indices_errados = find(y_class ~= t_class);
for indices = indices_errados
   %imshowann(Imagens_Test_10k(:,amostras),Label_Teste_Saida(indices))
   str = sprintf('[%d],  Alvo: %d,  Saida: %d,   [ERRO]\n',indices,t_class(indices)-1,y_class(indices)-1);
   imshowann(Imagens_Teste_8k, t_class-1, y_class-1, str,indices,'yellow');   pause(3); 
end
clear indices str
% filename = 'rede_784_40_10_resultados.mat';
% save(filename);

% FIM