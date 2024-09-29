function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    % Check if input vectors x and y have the same length

    if length(x) ~= length(y)
      return;
    endif

    % nr elemente
    m = length(x);

    % initializez matricea Vandermonde
    V = zeros(m, m);

    % construiesc matricea Vandermonde 1 x x^2 ... x^n-1
    for i = 1:m
        V(:, i) = x.^(i-1);
    endfor

    % rezolv sistemul
    coef = V \ y;
endfunction
