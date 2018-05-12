function [] = newrap(vectIni,iterMax,errorMax,valorInicial)
    
    %validaciones
    if ~isnumeric(vectIni)
        disp('El vector no es numerico \n');
        return;
    end
    len = length(vectIni);
    if ( len ~= 4 )
        disp('Debe ingresar 4 valores en el polinomio: ax^3 + bx^2 +cx + b');
        return;
    end
    if ~isnumeric(errorMax)
        disp('Error no es numerico \n');
        return;
    end
    if ~isnumeric(valorInicial)
        disp('valor Inicial no es numerico \n');
        return;
    end
    
    % asignacion valores de vector
    a=vectIni(1);
    b=vectIni(2);
    c=vectIni(3);
    d=vectIni(4);
    
    % incialición de variables
    x=valorInicial;
    x_old = 0;
    iter = 1;
    vec_resultado(1)=x;
    fun_x=0;
    errorActual=0;

    while iter<=iterMax && errorActual <= errorMax
        fprintf('Iteración %d: raiz=%.20f con error =%.20f\n', iter, x, errorActual);
        
        % almacena resultado de polinomio y newton rapson
        fun_x = (a*x^3 + b*x^2 + c*x + d);
        vec_newRap(iter)=x; % vector x
        vec_fun_x(iter)=fun_x; % vecytor y
        
        % calcula newton rapson
        x_old = x;
        x = x - (a*x^3 + b*x^2 + c*x + d)/(3*a*x^2 + 2*b*x + c);
        
        % calcula error iteración
        errorActual=abs(x_old)-abs(x);
        iter = iter + 1;
    end
    figure;

    % muestra el polinomio original
    poli_original = [a b c d]; %Se define el polinomio
    rango = -10:.05:10; %Se definen los puntos a ser evaluados
    y = polyval ( poli_original , rango ); %Se evaluan los puntos en la funcion
    plot ( rango , y ); %Se grafica el polinomio
    hold on

    % muestra resultados Newton Rhapson
    plot(vec_newRap,vec_fun_x,'-*');
    hold off
end