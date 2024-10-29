# Copyright 2023 Popescu Alexandru-Ionut

function [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs)
  [m, n] = size(train_mat);
  
  % initializare train
  train = zeros(m, n);
  
  % initializare miu
  miu = zeros(1, n);
  
  % initializare Y
  Y = zeros(m, pcs);
  
  % initializare Vk
  Vk = zeros(n, pcs);
  
  % cast train_mat la double.
  train_mat = double(train_mat);
  
  % calculează media fiecărei coloane a matricii.
  miu = mean(train_mat);
  
  % scade media din matricea initială.
  train_mat = train_mat - miu;
  
  % calculează matricea de covarianță.
  cov_matrix = train_mat' * train_mat / (m - 1);
  
  % calculează vectorii și valorile proprii ale matricei de covarianță.
  [V, D] = eig(cov_matrix);
  
  % ordonează descrescător valorile proprii și crează o matrice Vk formată din
  % vectorii proprii așezați pe coloane, astfel încât prima coloană să fie vectorul
  % propriu corespunzător celei mai mari valori proprii și așa mai departe.
  [~, indices] = sort(diag(D), 'descend');
  Vk = V(:, indices);
  
  % păstrează doar primele pcs coloane din matricea Vk.
  Vk = Vk(:, 1:pcs);
  
  % crează matricea Y schimbând baza matricii inițiale.
  Y = train_mat * Vk;
  
  % calculează matricea train care este o aproximare a matricii inițiale
  % folosind matricea Vk calculată anterior.
  train = Y * Vk';

endfunction
