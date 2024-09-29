function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.

    mat = read_mat(path);

    mat = preprocess(mat, min_reviews);

    [U, S, V] = svds(mat, num_features);

    % numar de linii din V
    num_row_V = size(V, 1);

    % calculez similaritatea mai intai
    for i = 1:num_row_V
     V_aux_liked = V(liked_theme, :);
     V_aux = V(i, :);
     similar(i) = cosine_similarity(V_aux_liked, V_aux);
    endfor

    % sortez
    [~, index_sort] = sort(similar, 'descend');

    % elimin indicii pentru liked_theme
    j = 1;
    for i = 1:length(index_sort)
      if index_sort(i) ~= liked_theme
        new_index_sort(j) = index_sort(i);
        j = j + 1;
      endif
    endfor

    % obtin indicii pentru temele recomandate
    recoms = new_index_sort(1:num_recoms);
end
