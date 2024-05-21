function MetodoDirectoInterpol
  x = [-0.75;-0.25;0.25]
  y = [548.25;437.75;437.75]

  for i = 1:3
    A(:,i) = x.^(i-1)
  endfor

  coef = A\y
endfunction

