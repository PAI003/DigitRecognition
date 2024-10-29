# Copyright 2023 Popescu Alexandru-Ionut

function sir = prepare_photo(im)
  % Initializare sirul final.
  sir = zeros(1, 784);
  
  % Inversează pixelii imaginii im.
  im = 255 - im;
  
  % Transpune imaginea.
  im = im';
  
  % Transformă imaginea intr-un vector linie.
  sir = reshape(im, 1, []);

endfunction
