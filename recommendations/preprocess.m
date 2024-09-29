function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.

  [m, n] = size(mat);
  counter = 0;
  % initializez vector gol
  vect = [];

  % parcurg matricea si calculez cate ratinguri are fiecare linie
  for i = 1:m
    counter = 0;
    for j = 1:n
      if mat(i, j) ~= 0
        counter = counter + 1;
      endif
    endfor
    % retin intr-un vector numarul de ratinguri
    vect(i) = counter;
  endfor

  % verific daca linia ramane in matrice adica daca are ratinguri mai mari sau
  % egale decat min_reviews
  lines_to_remain = vect >= min_reviews

  % construiesc matricea noua cu linii care trebuie pastrate
  reduced_mat = mat(lines_to_remain, :);
end
