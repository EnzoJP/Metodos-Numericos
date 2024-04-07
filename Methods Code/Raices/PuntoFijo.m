function PuntoFijo
    clc;
    format long;
    x0 = 2;
    it = 0;
    sol = 0;
    er = 0.01;

    while sol == 0
        it += 1;
        gx0 = -(x0^2) / 3 + x0 + 1; %funcion g(x) obtenida al multiplicar ev en punto
        x1 = gx0;
        y = x1^2 - 3; %func

        if abs(y) < er || it >= 14
            sol = 1;
        end

        x0 = x1;
    end

    disp('Resultado final:');
    disp(x0);
    disp('Iteraciones realizadas:');
    disp(it);
end



