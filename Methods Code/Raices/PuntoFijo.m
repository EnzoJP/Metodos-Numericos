function metodo_PuntoFijo
    x0 = 2;
    it = 0;
    sol = 0;
    er = 0.01;

    while sol == 0
        it += 1;
        gx0 = -(x0^2) / 3 + x0 + 1; %funcion g(x) obtenida al multiplicar
        x1 = gx0;
        y = x1^2 - 3; %func

        if abs(y) < er
            sol = 1;
        end

        x0 = x1;
    end

    disp('Resultado final:');
    disp(x0);
    disp('Iteraciones realizadas:');
    disp(it);
end



