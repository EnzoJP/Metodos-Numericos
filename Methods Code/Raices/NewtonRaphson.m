function NewtonRaphson
    clc;
    format long;
    x = 0:0.1:2;
    y = fun(x);
    fa = 1.5;
    fb = 2;
    error = 0.001;
    haysol = 0;
    it = 1;
    m = 1 + 2 .^ (-2) * log(2);
    r = fb - (fun(fb) / m);

    while (haysol == 0)
        it += 1;
        if abs(fun(r)) < error || it >= 20;
            haysol = 1;
            disp('La raíz aproximada es:');
            disp(r);
        endif
        r = r - (fun(r) / m);
    endwhile
    disp('Número de iteraciones:');
    disp(it);
end

function z = fun(x)
    z = x - 2 .^ (-x);
endfunction

