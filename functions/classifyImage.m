# Copyright 2023 Popescu Alexandru-Ionut

function prediction = classifyImage(im, train_mat, train_val, pcs)
  % Initializare predicție
  prediction = -1;
  
  % Cast im la double
  im = double(im);
  
  % Aplică funcția magic_with_pca setului de date de antrenament
  [train, miu, Y, Vk] = magic_with_pca(train_mat, pcs);
  
  % Scade din vectorul imagine media fiecărei coloane din train_mat
  im = im - miu;
  
  % Schimbă baza imaginii prin înmulțirea cu matricea Vk
  im_pca = im * Vk;
  
  % Calculează predicția folosind algoritmul KNN cu k = 5
  prediction = KNN(train_val, Y, im_pca, 5);

endfunction

