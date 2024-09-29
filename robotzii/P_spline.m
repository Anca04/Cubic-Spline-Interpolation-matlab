function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients

  % retin lungimea lui x_interp si x
  length_x_interp = length(x_interp);
  length_x = length(x);

  y_interp = zeros(length_x_interp, 1);

  r = 1;
  i = 1;
  while i <= length_x_interp
    copy_x_interp = x_interp(i);
    for j = 1:(length_x - 1)
      % verific daca sunt in intervalul [x(i), x(i + 1)]
      if x(j) <= copy_x_interp && copy_x_interp <= x(j + 1)
        % aflu coeficientii
        a = coef(4 * (j - 1) + 1);
        b = coef(4 * (j - 1) + 2);
        c = coef(4 * (j - 1) + 3);
        d = coef(4 * (j - 1) + 4);
        dif = x_interp(i) - x(j);

        % calculez y_interp cu ajutorul coeficientilor spline
        y_interp(r) = a + b * dif + c * dif ^ 2 + d * dif ^ 3;
        r = r + 1;
        break;
      endif
    endfor
    i = i + 1;
  endwhile
end
