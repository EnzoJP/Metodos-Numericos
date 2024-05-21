




function richardson = richardson(i1, i2, h1, h2, n)
  b = (h1 / h2)^n;
  resultado = ((b * i2) - i1) / (b -1);
  richardson = resultado;
endfunction
