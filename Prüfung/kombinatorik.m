clear all
close all
k = 2;
n = 7;
function comb(n)
% Permutation (ohne Wiederholung)
perm_no_repeat = factorial(n);
fprintf("Permutation (ohne Wiederholung):\n")
fprintf("V(n) = n! = %d\n", perm_no_repeat)
end

function commb(n, k)

% Permutation (mit Wiederholung)
perm_repeat = factorial(n) / factorial(k);
fprintf("Permutation (mit Wiederholung):\n")
fprintf("V(n) = n!/k! = %.4f\n\n", perm_repeat)

% Variation (ohne Wiederholung)
var_no_repeat = nchoosek(n,k)*factorial(k);
fprintf("Variation (ohne Wiederholung):\n")
fprintf("V(n,k) = n!/(n-k)! = %.4f\n\n",var_no_repeat)

% Variation (mit Wiederholung)
var_repeat = n^k;
fprintf("Variation (mit Wiederholung):\n")
fprintf("V(n,k) = n^k = %.4f\n\n",var_repeat)

% Kombination (ohne Wiederholung)
comb_no_repeat = nchoosek(n,k);
fprintf("Kombination (ohne Wiederholung):\n")
fprintf("(n über k) = n!/k!(n-k)! = %.4f\n\n",comb_no_repeat)

% Kombination (mit Wiederholung)
comb_repeat = nchoosek(n+k-1,k);
fprintf("Kombination (mit Wiederholung):\n")
fprintf("(n+k-1 über k) = (n+k-1)! / k!(n-k) = %.4f\n\n", comb_repeat)
end