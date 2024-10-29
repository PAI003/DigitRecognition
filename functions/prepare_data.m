# Copyright 2023 Popescu Alexandru-Ionut

function [train_mat, train_val] = prepare_data(name, no_train_images)
  n = 784;
  
  % initializare train_mat.
  train_mat = zeros(no_train_images, n);
  
  % initializare train_val.
  train_val = zeros(1, no_train_images);
  
  % incarcă datele din tabelul primit ca argument.
  d = load(name);
  
  % extrage imaginile de antrenament din d.trainX și le salvează în train_mat.
  train_mat = d.trainX(1:no_train_images, :);
  
  % extrage etichetele imaginilor de antrenament din d.trainY și le salvează în train_val.
  train_val = d.trainY(1:no_train_images);

 endfunction

