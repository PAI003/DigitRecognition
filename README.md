# DigitRecognition

NUME: Popescu Alexandru-Ionut 
GRUPA: 314CA 
METODE NUMERICE - TEMA 2 

TASK 1 - functia task1 primeste o matrice photo si un număr k si returnează o noua matrice new_X, care 
reprezinta aproximarea matricii initiale photo utilizand algoritmul SVD (Descompunerea in Valori Singulare). 

TASK 2 - functia task2 primeste o matrice photo si un numar pcs si returneaza o noua matrice new_X, care reprezinta aproximarea matricii initiale photo utilizand descompunerea valorilor singulare (SVD). 
Matricea photo este convertita la tipul double pentru a permite calculele cu precizie mai mare. 
Se calculeaza media pentru fiecare vector a_i din matricea photo, denumită mu, folosind functia mean i specificand dimensiunea 2 (media pe fiecare rand). Vectorii a_i din matricea photo sunt actualizati prin scaderea mediei corespunzatoare din mu. Se construieste matricea Z prin transpunerea matricei photo. 
Se aplica descompunerea valorilor singulare (SVD) asupra matricei Z utilizand functia svd, care returneaza matricile U, S i V. 
Se construieste matricea W selectand primele pcs coloane ale matricei V. Se calculeaza matricea Y prin inmultirea transpusa a matricei W cu matricea photo. 
Se aproximeaza matricea initiala photo utilizand formula new_X = W * Y + mu. 

TASK 3 - functia task3 primeste o matrice photo si un numar pcs si returneaza o noua matrice new_X, care reprezinta aproximarea matricii initiale photo utilizand analiza componentelor principale (PCA). 
Se normalizeaza matricea initiala photo prin scaderea mediei fiecărui rand din photo. 
Se calculeaza matricea de covarianta a matricei normalizate utilizand functia cov si transpunerea acesteia (photo_norm’). 
Se calculeaza vectorii si valorile proprii ale matricei de covarianta utilizand functia eig, care returneaza matricea V si matricea diagonala S. 
Valorile proprii sunt ordonate descrescator, iar vectorii proprii corespunzatori sunt reordonati in acelasi mod. Se selecteaza primele pcs coloane din matricea V, obinand astfel matricea V_pcs. 
Se calculeaza matricea Y prin inmultirea transpusa a matricei V_pcs cu matricea normalizata photo_norm. 
Se aproximeaza matricea initiala photo utilizand formula photo_approx = V_pcs * Y. 
Se aduna media fiecarui rand, care a fost scazuta anterior, la matricea aproximata photo_approx, obinand astfel matricea finala new_X. 

TASK 4: -> visualise_image - functia visualise_image primeste o matrice de antrenament train_mat si un numar number si afisează imaginea corespunzatoare liniei number din matricea de antrenament. 
Se initializeaza matricea im cu dimensiunile finale ale imaginii, adică 28x28, si se completeaza cu zerouri. 
Se citeste linia number din matricea de antrenament train_mat si se stocheaza în variabila line. 
Se transforma linia citita intr-o matrice 28x28 prin utilizarea functiei reshape si se transpune matricea obtinuta prin '. 
Matricea rezultata este convertita la tipul uint8 pentru a fi o imagine valida (valori intregi în intervalul [0, 255]). 
Imaginea este afisată utilizand functia imshow care primeste matricea im ca argument. 

-> prepare_data - functia prepare_data primeste numele unui fisier si numarul de imagini de antrenament 
no_train_images, si returneaza matricea train_mat si vectorul train_val care contin datele pregatite pentru antrenament. 

-> magic_with_pca - functia magic_with_pca primeste o matrice de antrenament train_mat si un numar pcs care reprezinta numarul de componente principale pastrate, 
si returneaza matricea de antrenament prelucrata train, media miu, matricea transformarilor Y i matricea Vk. 
Matricea de antrenament train_mat este convertita la tipul double. Se calculeaza media fiecărei coloane a matricii train_mat si se salveaza rezultatul in vectorul miu. 
Se scade media miu din matricea train_mat pentru a centra datele in jurul valorii medii. 
Se calculeaza matricea de covarianta cov_matrix folosind formula (X’ * X) / (m - 1), unde X este matricea centrata train_mat. 
Se calculeaza vectorii si valorile proprii ale matricei de covariantă cov_matrix utilizand functia eig. 
Valorile proprii sunt ordonate descrescator, iar vectorii proprii corespunzatori sunt reordonati in consecintă in matricea Vk. 
Se pastreaza doar primele pcs coloane din matricea Vk. Se creeaza matricea Y prin inmultirea matricii centrate train_mat cu matricea Vk. 
Se calculeaza matricea train care reprezinta o aproximare a matricii de antrenament initiale folosind matricea Vk calculata anterior, 
prin înmultirea matricii Y cu transpusa matricei Vk. 

-> prepare_photo - functia prepare_photo primeste o imagine im sub forma de matrice si returneaza un vector sir reprezentand imaginea pregatita pentru utilizare in algoritmi de prelucrare. 

-> KNN - functia KNN primeste urmatorii parametrii: labels - etichetele asociate datelor de antrenament, Y- matricea de antrenament, test - vectorul de testare 
i k - numarul de vecini considerati in algoritmul k-NN. 
Aceasta functie implementeaza algoritmul k-NN pentru a realiza o predictie pe baza datelor de antrenament si a unui punct de test. 
Se calculeaza distanta euclidiana intre fiecare rand din matricea Y si vectorul test utilizand functia norm(Y(i, :) - test). Rezultatele sunt stocate in matricea distance. 
Se ordoneaza crescator distantele calculate si se păstreaza primele k valori. Indicele ordonarii este stocat in variabila idx. 
Se extrag etichetele corespunzatoare celor mai apropiate k puncte si se stocheaza in variabila nearest_labels. Se calculeaza predictia utilizand mediana valorilor din nearest_labels prin apelul functiei median(nearest_labels). 
Predictia finala este returnata de catre functie. 

-> classifyImage - functia classifyImage primeste urmatorii parametrii: im - imaginea de testare, train_mat - matricea de antrenament, 
train_val - etichetele asociate datelor de antrenament si pcs - numărul de componente principale pastrate in algoritmul PCA. 
Aceasta functie realizeaza clasificarea imaginii de testare folosind algoritmul KNN si baza de antrenament transformata prin PCA.
