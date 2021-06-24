function [vetor_embaralhado] = embaralhar(vetor_sequencial)
% vetor_sequencial = [10 13 15 18];
LenVect = length(vetor_sequencial);
IndexVector = 1:LenVect;
Indice_embaralhado = [];
while (LenVect > 1)
    IndiceSorteado = randi([1 LenVect],1,1);
    ValorSorteado = IndexVector(IndiceSorteado);
    Indice_embaralhado = [Indice_embaralhado, ValorSorteado];
    
    aux1 = IndexVector(1:IndiceSorteado-1);
    if (IndexVector(IndiceSorteado) == IndexVector(end))
        IndexVector = [aux1];
    else
        aux2 = IndexVector(IndiceSorteado+1:end);
        IndexVector = [aux1,aux2];
    end
    %fprintf("\n Número sorteado: %d \n\n",ValorSorteado);
    LenVect = length(IndexVector);
end
Indice_embaralhado = [Indice_embaralhado, IndexVector];
vetor_embaralhado = vetor_sequencial(Indice_embaralhado);

%vetor = [1,4,5,7,9,10,11,17,19,20,23,27,29,32,36,39,41,42,46,48,49,52,56,59,61,65,66,68];
