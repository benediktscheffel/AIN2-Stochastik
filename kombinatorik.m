clear all
close all
k = 2;
n = 7;

% Permutation (ohne Wiederholung)
% Möglichkeiten n CDs im Regal anzuorden: V(n) = n!
perm_no_repeat = factorial(n);

% Permutation (mit Wiederholung)
% Möglichkeiten n CDs, k CDs sind gleich, im Regal anzuorden:V(n,k) = n!/k!
perm_repeat = factorial(n) / factorial(k);

% Variation (ohne  Wiederholung)
% Passwort mit einer Länge von k und n verfügbaren Zeichen, die sich nicht
% wiederholen dürfen: V(n,k) = n!/(n-k)!
var_no_repeat = nchoosek(n,k)*factorial(k);

% Variation (mit Wiederholung)
% Pin mit einer Länge von k und n Zeichen: V(n,k) = n^k
var_repeat = n^k;

% Kombination (ohne Wiederholung)
% beim Lotto werden k Zahlen aus n Zahlen ausgewählt: (n über k) = n! / k!(n-k)!
comb_no_repeat = nchoosek(n,k);

% Kombination (mit Wiederholung)
%  beim Lotto werden k Zahlen aus n Zahlen ausgewählt Zahlen können sich wiederholen: (n+k-1 über k) = (n+k-1)! / k!(n-k)!
comb_repeat = nchoosek(n+k-1,k);

