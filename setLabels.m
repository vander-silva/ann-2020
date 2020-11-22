function [] = setLabels(hfg,text_size,label_size,xlabel_text,ylabel_text)
    hfg.FontName = 'Times New Roman';
    hfg.FontSize = text_size;
    hfg.XLabel.Interpreter = 'latex';
    hfg.YLabel.Interpreter = 'latex';
    %
    STR = sprintf('$$%s$$',xlabel_text);
    hfg.XLabel.String = STR;
    %
    STR = sprintf('$$%s$$',ylabel_text);
    hfg.YLabel.String = STR;
    %
    hfg.XLabel.FontSize = label_size;
    hfg.YLabel.FontSize = label_size;
end