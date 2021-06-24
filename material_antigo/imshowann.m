function [] = imshowann(imagens,labels,saida_ANN,dataSetName,indices,output_color)
% -------------------------------------------------------------------------
% impressao de amostras de dataset para Pattern Recognition utilizando RNA
% Vanderlei A. Silva - Oct/2019
% -------------------------------------------------------------------------
switch nargin
    case 5
        ann_output_color = 'white';
    case 6
        ann_output_color = output_color;
    otherwise
        fprintf('\n\n Erro nargin imshowann...\n\n');
end
%
length_labels = length(labels);
if saida_ANN == -1
    saida_ANN = ones(length_labels,1)*-1; % sem sa?da de rede por enquanto
end
for k = 1:length(indices)
    vec  = imagens(:,indices(k));
    lab  = labels(indices(k));
    y    = saida_ANN(indices(k));
    
    %mat = vec2mat(vec,28)'; % cria??o da matriz imagem 28x28 para impressao
    mat = reshape(vec,[28,28]);
    
    

    % Manusear dados de impressao ------------------
    h0 = figure(1); h0.Color = 'black'; h0.ToolBar = 'none'; h0.MenuBar = 'none'
    h1 = subplot(2,3,1); cla(h1); imshow(mat); title('Imagem','Color','white','FontSize',18);
    h2 = subplot(2,3,2); cla(h2); h2.Color = 'black'; t = text(0.3,0.5,num2str(lab),'Color','white','FontSize',220);axis off; title('Label','Color','white','FontSize',18);
    h3 = subplot(2,3,3); cla(h3); h3.Color = 'black'; t = text(0.3,0.5,num2str(y),'Color',ann_output_color,'FontSize',220);axis off; title('Saida da Rede Neural','Color','white','FontSize',18);
    h2 = subplot(2,3,5); cla(h2); h2.Color = 'black'; t = text(0,0.5,dataSetName,'Color',ann_output_color,'FontSize',20);axis off;
    pause(2)
end
%