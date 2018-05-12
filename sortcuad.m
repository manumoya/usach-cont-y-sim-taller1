function [] = srtcuad(vectIni)
    
    if ~isnumeric(vectIni)
        disp('El vector no es numerico \n');
        return;
    end
    if ~all(vectIni>0)
        disp('Todos los elemntos del vector deben ser mayor a cero \n');
        return;
    end
    len = length(vectIni);
    if ( len < 5 )
        disp('Debe ingresar al menos 5 valores en el vector');
        return;
    end
    
    % ordena vector de mayor a menor
    B = sort(vectIni,'descend');
    
    len_B=length(B);
    cont=0;
    tot_May=0;
    tot_Men=0;
    for ind =1:4
        tot_May=tot_May + B(ind);
        tot_Men=tot_Men + B(len_B-cont);
        cont=cont+1;
    end
    resultado = sqrt(tot_May)-sqrt(tot_Men);
    fprintf('Resultado= %.20f', resultado );
end



