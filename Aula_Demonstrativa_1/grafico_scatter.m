function [] = grafico_scatter(fignum,input_data_teste,y_class)
figure(fignum);
classes_cores = ['ro';'go';'bo';'ko']; % [1 2 3 4];
for k = 1:size(input_data_teste,1)
    plot(input_data_teste(k,1),input_data_teste(k,2), classes_cores(y_class(k),:)); hold on;
end
line([0 1],[0.5 0.5],'LineStyle','--','LineWidth',2);
line([0.5 0.5],[0 1],'LineStyle','--','LineWidth',2); grid on;
hfg = gca;  setLabels(hfg,18,26,'x_1','x_2');
end

