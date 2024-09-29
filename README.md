Implementare tema2 MN

Task 1:

Am implementat functia stereo_to_mono, aplicand mean, adica fac media 
aritmetica a fiecarui rand. Spectrograma am implementat-o prin aflarea, mai 
intai, a lungimii semnalului, apoi aplic floor pentru a afla numarul de 
ferestre. Parcurg fiecare fereastra, aflu segementul de semnal pentru aceasta
si aplic hanning. Aflu tarnsformata Fourier (fft) si elimin partea conjugata, 
parcurgand doar prima jumatate. Vectorul de frecventa este prima jumatate, iar 
vectorul pentru timp, pentru fiecare fereastra, este dimensiunea ferestrei 
impartita la sampling rate. Pentru apply_reverb apelez stereo_to_mono, apoi
aplic fftconv (calculez convolutia) si normalizez.

Task 2:

Citesc din fisier si creez vectorii. Am implementat Spline-ul cubic, cu 
ajutorul formulelor generale, determin coeficientii. Am aflat coeficientii
pentru a din primele conditii Si(xi) = yi, construiesc matricea sistemului,
urmand restul formulelor. Aflu coeficientii lui c prin rezolvarea sistemului
dedus din formule. De asemenea, aflu coeficientii pentru b si d. Adaug la final 
coeficientii, construind vectorul aferent. In functia P_spline, parcurg 
vectorul si verific daca ma aflu in interval, extrag coeficientii si deduc 
y_interp. Pentru Vandermonde creez matricea aferenta conform formei generale. 
Aflu coeficientii din sistemul format din matricea creata si vectorul y. In 
functia P_vandermonde, calculez din nou matricea si rezolv sistemul. 

Task 3:

Am implementat mai intai functia care elimina liniile care au ratinguri mai 
mici decat min_reviews. Parcurg matricea si retin intr-un vector numarul de 
ratinguri, apoi verific daca aceea linie trebuie eliminata sau nu. La final, 
construiesc noua matrice. Functia cosine_similarity urmareste implementarea 
formulei. Citesc matricea cu csvread, apoi in recommendations apelez
functiile necesare, pe rand. Sortez indexii si pastrez indicii pentru temele
recomandate.
