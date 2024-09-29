function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	% TOOD 1: si(xi) = yi, i = 0 : n - 1

	% TODO 2: s_n-1(xn) = yn

  %s(n + 1) = y(n + 1);

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1

	% TODO 6: s0''(x0) = 0

	% TODO 7: s_n-1''(x_n) = 0

	% Solve the system of equations

  % numar de intervale
  n = length(x);

  % initializez coeficientii
  a = b = d = zeros(n - 1, 1);

  % din sistem aflu coeficientii a(i)
    a(1:(n - 1)) = y(1:(n - 1));

  % initializez matricea din sistem
  mat_A = zeros(n);
  mat_A(1, 1) = 1;
  mat_A(n, n) = 1;

  % completez matricea conform ecuatiilor din sistem
  for i = 2:(n - 1)
    mat_A(i, i - 1) = x(i) - x(i - 1);
    mat_A(i, i + 1) = x(i + 1) - x(i);
    mat_A(i, i) = 2 * (x(i + 1) - x(i - 1));
  endfor

  % initializez o matrice auxiliara pentru a calcula coeficientii c(i)
  mat_xq = zeros(n, 1);
  mat_xq(1) = 0;
  mat_xq(n) = 0;

  % adaug coeficientii pentru a afla din sistem ce am nevoie, adica c(i)
  mat_xq(2:n - 1) = 3 * ((y(3:n) - y(2:n - 1)) ./ (x(3:n) - x(2:n - 1)) - (y(2:n - 1) - y(1:n-2)) ./ (x(2:n - 1) - x(1:n-2)));

  % din sistemul acesta aflu c(i)
  c = mat_A \ mat_xq;

  % aflu coeficientii b(i) si d(i) din formula generalizata
  b(1:n-1) = (y(2:n) - y(1:n-1)) ./ (x(2:n) - x(1:n-1))-(x(2:n) - x(1:n - 1)) / 3 .* (c(2:n) + 2 * c(1:n - 1));
  d(1:n-1) = (c(2:n) - c(1:n - 1)) ./ (3 * (x(2:n) - x(1:n - 1)));

  % adaug coeficientii in rezultatul final
  for i = 1:(n - 1)
    coef(4 * (i - 1) + 1) = a(i);
    coef(4 * (i - 1) + 2) = b(i);
    coef(4 * (i - 1) + 3) = c(i);
    coef(4 * (i - 1) + 4) = d(i);
  endfor

end
