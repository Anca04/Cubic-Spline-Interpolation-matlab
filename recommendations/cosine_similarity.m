function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.

  % calculez produsul
  prod = dot(A, B);
  % calculez normele
  norm_A = norm(A);
  norm_B = norm(B);

  % calculez similaritatea folosind formula
  similarity = prod / (norm_A * norm_B);
end
