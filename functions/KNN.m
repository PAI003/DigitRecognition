# Copyright 2023 Popescu Alexandru-Ionut

function prediction = KNN(labels, Y, test, k)
  % Initializează prediction
  prediction = -1;
  
  % Initializează distanțele
  [m, n] = size(Y);
  distance = zeros(m, 1);
  
  % Calculează distanța Euclidiană între fiecare rând și vectorul de test
  for i = 1:m
    distance(i) = norm(Y(i, :) - test);
  endfor
  
  % Ordonează crescător distanțele și păstrează primele k valori
  [~, idx] = sort(distance);
  nearest_labels = labels(idx(1:k));
  
  % Calculează predicția ca mediana celor k valori cele mai apropiate
  prediction = median(nearest_labels);

endfunction

