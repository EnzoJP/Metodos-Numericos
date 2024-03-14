function biseccion
    %función
    x=0:0.1:2;
    func = @(x) f(x);

    % Ingresar el intervalo [a, b] o escribirlo
    a = input('Ingrese el primer número del intervalo: ');
    b = input('Ingrese el segundo número del intervalo: ');

    % Inicializar variables
    stop = 0;
    iter = 0;
    while stop == 0
        % Cálculo de las funciones en los extremos y en el punto medio
        fA = func(a);
        fB = func(b);
        rk = (a + b) / 2;
        fRk = func(rk);
        iter = iter + 1;

        % Condiciones de parada
        if abs(fRk) <= 0.03 || iter > 50
            stop = 1;
        end

        % Modificación de a o b
        if stop == 0
            if fA * fRk < 0
                b = rk;
            else
                if fB * fRk < 0
                    a = rk;
                end
            end
        end
    end

    % Mostrar el resultado
    disp('La raíz de la función está en:');
    disp(rk);
end
function z = f(x)
  z=x-2.^(-x);
endfunction
