function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% TODO: Calcualte y_interp using the Vandermonde coefficients
  % Initialize the output vector y_interp with zeros and the same length as x_interp

    length_x_interp = length(x_interp);
    length_coef = length(coef);

    % initializez matricea
    V = zeros(length_x_interp, length_coef);

    % calculez elementele matricei
    for i = 1:length_coef
        V(:, i) = x_interp.^(i-1);
    endfor

    % aflu y_interp
    y_interp = V * coef;
end
