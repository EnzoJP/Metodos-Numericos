function ej1_secante
    % Definir la función
    x = 0:0.1:2;
    y = fun(x);
    fa = 0;
    fb = 2;
    error = 0.001;
    haysol = 0;
    it = 1;

    % Verificar si el producto de los valores de la función en los extremos del intervalo es mayor que 0
    if (fun(fa)) * (fun(fb)) > 0
        disp('No hay raíces en este intervalo.')
    else
        % Método de la secante
        while (haysol == 0)
            it = it + 1;
            m = (fun(fa) - fun(fb)) / (fa - fb);
            r = fb - (fun(fb) / m);

            if abs(fun(r)) < error % Comprobar si se alcanzó la tolerancia
                haysol = 1;
                disp('La raíz aproximada es:');
                disp(r);
            else
                fa = fb; % Actualizar los valores para la siguiente iteración
                fb = r;
            end
        endwhile
        disp('Número de iteraciones:');
        disp(it);
    end
end

% Definir la función
function z = fun(x)
    z = x - 2 .^ (-x);
end

