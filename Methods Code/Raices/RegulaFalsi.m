function RegulaFalsi
    clc;
    format long;
    x = 0:0.1:2;
    y = fun(x);
    fa = 0;
    fb = 2;
    error = 0.001;
    haysol = 0;
    it = 1;

    if (fun(fa)) * (fun(fb)) > 0
        disp('No hay')
    else
        while (haysol == 0)
            it += 1;
            m = (fun(fa) - fun(fb)) / (fa - fb);
            r = fb - (fun(fb) / m);
            if abs(fun(r)) < error || it >= 50
                haysol = 1;
                disp('la raiz esta en '),disp(r);
                disp('iteraciones'),disp(it);
            else
                if fun(r) * fun(fa) < 0
                    fb = r;
                else
                    fa = r;
                end
            end
        endwhile
        it;
    endif
end

function z = fun(x)
    z = x - 2 .^ (-x);
endfunction

