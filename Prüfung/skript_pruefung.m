clear all 
close all
%% Main

% Beschreibende Statistik
% X = [10 25 25 25 30 35];
% Y = [55 60 40 70 45 40 65 55];
% Z = [3 10 9 1 5 10 2 3]
% Parameter(X, p-Quantil)
% stats(X, 0.1)
% multivarstat(X,Y)

%%
% Kombinatorik
% Permutation ohne Wiederholung Parameter (n)
% comb(10)
% Restliche Kombinatorik Parameter (n, k)
% comb2(14,2)

%%
% Diskrete Zuvallsvariablen
% X = [1, 2, 3, 4, 5];
% P = [0.1, 0.25, 0.35, 0.2, 0.1];
% zufallsvariable(2,X,P)

% Bernouli-Verteilung Parameter (x,p)
% ber(0,0.8)

% Geometrische-Verteilung Parameter (x,p)
%  geom(10,0.1)
% geom Quantil Parameter(qu,p) 
%  geomInv(0.5,0.34)

% Binominal-Verteilung Parameter (x, n,p)
% bin(2,50,0.03)

% Poisson-Verteilung Parameter (x, lambda)
%  po(3,10)

%%
% Stetige Zufallsvariablen
% Exponentialverteilung Parameter (x, lambda)
% exp(0.5,2)
% Exponentialverteilung Intervall Parameter (x, y, lambda)
% expIntervall(0, 5.5452,1/8)
% Exponentialverteilung Quantil Parameter (qu, lambda)
% expInv(0.9, 1/800)

% Gleichverteilung Parameter (x, a, b) 
% gleichverteilung(500,200,600)
% Gleichverteilung Intervall Parameter (x, y, a, b) 
% gleichverteilungIntervall(200,300,200,600)

% Normalverteilung Parameter (x, mu, sigma)
% norm(350,300,50)
% Norminv Parameter (p, mu, sigma)
% normi(0.965,13,1)
% Normalverteilung 2 Variablen Parameter (x, mux, muy, sigmax, sigmay)
% norm2v(380,150,190,20,sqrt(500))

%% Funktionen
% Beschreibende Statistik 
function stats(X,p)
%Arithetisches Mittel
mittel_x = mean(X);
fprintf("Mittelwert(X) = %.4f\n",mittel_x)
%Median
median_x = quantile(X,0.5);
fprintf("Median(X) = %.4f\n",median_x)
%Modalwert
modal_x = mode(X);
fprintf("Modal(X) = %.4f\n",modal_x)
%Quartile
q_025_x = quantile(X,0.25);
fprintf("0.25quantil(X) = %.4f\n",q_025_x)
q_075_x = quantile(X,0.75);
fprintf("0.75quantil(X) = %.4f\n",q_075_x)
pquantil_x = quantile(X,p);
fprintf("%.3fquantil(X) = %.4f\n",p,pquantil_x)
%(empirische) Varianz
var_x = var(X);
fprintf("Var(X) = %f\n",var_x)
%(empirische) Standardabweichung
std_x = std(X);
fprintf("Std(X) = %f\n",std_x)
%Spannweite
spann_x = max(X) - min(X);
fprintf("Spannweite(X) = %f\n",spann_x)
%Interquartilabstand
I = q_075_x - q_025_x;
fprintf("Interquartilabstand(X) = %f\n",I)
end

function multivarstat(X,Y)
%(empirische) Kovarianz
kovar_x_y = cov(X,Y);
Var_X = kovar_x_y(1,1);
Var_Y = kovar_x_y(2,2);
fprintf("Var(X) = %.4f\n",Var_X)
fprintf("Var(Y) = %.4f\n",Var_Y)


%(empirischer) Korrelationskoeffizient
corrcoef_X_Y = corrcoef(X,Y);
r_x_y = corrcoef_X_Y(1,2);
fprintf("r_x_y = %f\n",r_x_y)
if r_x_y > 0 && r_x_y < 1
    fprintf("Die Stichproben sind (linear) positiv korelliert.\n")
 
else 
if r_x_y < 0 && r_x_y > -1
    fprintf("Die Stichproben sind (linear) negativ korelliert.\n")
 
else 
if r_x_y == 0
    fprintf("Die Stichproben sind (linear) unkorelliert.\n")
end
end
end
[r, k, d] = regression(X,Y,'one');

plot(X,Y,'bo')
hold on
syms x
f = k*x +d;
fplot(f,'r-')
legend('X,Y','Regressionsgerade:f(x)=kx+d')


end

% Diskrete Zufalsvariablen
function zufallsvariable(x,X,P)

% Erwartungswert
E_X = sum(X.*P);
fprintf("E(X) = %.4f\n",E_X)

% Varianz
Var_X = var(X,P);
fprintf("Var(X) = %.4f\n",Var_X)
% Standardabweichung
Std_X = std(X,P);
fprintf("Std(X) = %.4f\n\n",Std_X)
% P(X=x)
fprintf("P(X=%d) = %.4f\n",x,P(x))
% P(X<=x)
f_x = 0;
for i = 1:x
    f_x = f_x +P(i);
end
fprintf("P(X<=%d) = %.4f\n",x, f_x)
%P(X>=x)
fprintf("P(X>=%d) = %.4f\n",x, 1-f_x)
% Verteilung
subplot(1,2,1)
stem(X,P)
xlim([X(1)-1,X(length(X)) + 1])
ylim([0,max(P)+0.05])
% Verteilungsfunktion
subplot(1,2,2)
stairs(cumsum(P));
xlim([X(1)-1,X(length(X)) + 1])
ylim([0,1])
end


%Kombinatorik
function comb(n)
% Permutation (ohne Wiederholung)
perm_no_repeat = factorial(n);
fprintf("Permutation (ohne Wiederholung):\n")
fprintf("V(n) = n! = %d\n", perm_no_repeat)
end

function comb2(n, k)

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

% Bernouli Verteilung X~Ber(p)
function ber(x,p)
q = 1-p;
% Erwartungswert
fprintf("E(X)= p = %.4f\n",p)
% Varianz
fprintf("Var(X)= pq = %.4f\n",p*q)
% Standardabweichung
fprintf("Std(X)= %4f\n",sqrt(p*q))
% P(X=x)
p_x = 0;
if x == 1
    p_x = p;
else
if x == 0
  p_x = q;   
end
end

fprintf("P(X=%d) = %.4f\n",x, p_x)

% P(X<=x)
p_X_le_x = 0;
if x < 0
    p_X_le_x = q;
else
if x >= 0 && x < 1
    p_X_le_x = p;
end
end
fprintf("P(X<=%d) = %.4f\n",x, p_X_le_x)
end

% Geometrische Verteilung X~geom(p)
function geom(x,p)
q = 1-p;
fprintf("q = %.4f\n",q)
% Erwartungswert 
geom_E_X = 1/p;
fprintf("E(X) = %.4f\n", geom_E_X)

%Varianz
geom_Var_X = q/p^2;
fprintf("Var(X) = %.4f\n", geom_Var_X)

%Standardabweichung
geom_Std_X = sqrt(geom_Var_X);
fprintf("Std(X) = %.4f\n\n", geom_Std_X)
% P(X = x) 
geom_P_X_e_x = geopdf(x-1,p);
fprintf("P(X=%d) = %.4f\n",x, geom_P_X_e_x)
% P(X<=x)
geom_P_X_le_x = geocdf(x-1,p);
fprintf("P(X<=%d) = %.4f\n",x, geom_P_X_le_x)
%P(X < x)
fprintf("P(X<%d) = %.4f\n", x, geom_P_X_le_x-geom_P_X_e_x)

% P(X>=x)
geom_P_X_me_x = 1 - geocdf(x-2,p);
fprintf("P(X>=%d) = %.4f\n",x, geom_P_X_me_x)

% P(X>x)
fprintf("P(X>%d) = %.4f\n", x, geom_P_X_me_x-geom_P_X_e_x)
end

function geomInv(qu,p)
xp = log(abs(qu -1)) / log(1-p);
fprintf("x%.3f = %.4f\n",qu, xp)
end

% Binominal-Verteilung X~Bin(n,p)
function bin(x,n,p)
q = 1-p;
% Erwartungswert
E_x = n*p;
fprintf("E(x) = %.4f\n",E_x)
% Varianz
Var_x = n*p*q;
fprintf("Var(x) = %.4f\n",Var_x)
% Standardabweichung
Std_x = sqrt(Var_x);
fprintf("Std(X) = %.4f\n\n",Std_x)
% P(X=x)
P_X_e_x = binopdf(x,n,p);
fprintf("P(X=%d) = %.4f\n",x,P_X_e_x)
% P(X<=x)
P_X_le_x = binocdf(x,n,p);
fprintf("P(X<=%d) = %.4f\n",x,P_X_le_x)
% P(X>=x)
P_X_me_x = 1- binocdf(x-1,n,p);
fprintf("P(X>=%d) = %.4f\n",x,P_X_me_x)
end

% Poisson-Verteilung X~Po(lambda)
function po(x, lambda)
% Erwartungsert
fprintf("E(X) = %.4f\n",lambda)
%Varianz
fprintf("Var(X) = %.4f\n",lambda)
% Standardabweichung
fprintf("Std(X) = %.4f\n\n",sqrt(lambda))
%P(X=x)
fprintf("P(X=%d) = %.4f\n",x,poisspdf(x,lambda))
%P(X<=x)
fprintf("P(X<=%d) = %.4f\n",x,poisscdf(x,lambda))
%P(X>=x)
fprintf("P(X>=%d) = %.4f\n",x,1 - poisscdf(x-1,lambda))
end

% Exponentialverteilung X~exp(lambda)
function exp(x, lambda)
% Erwartungswert
E_X = 1/lambda;
fprintf("E(X) = %.4f\n", E_X)
% Varianz
Var_X = 1 / lambda^2;
fprintf("Var(X) = %.4f\n",Var_X)
% Standardabweichung
Std_X = sqrt(Var_X);
fprintf("Std(X) = %.4f\n\n", Std_X)
% P(X<=x)
P_X_le_x  = expcdf(x*lambda);
fprintf("P(X<=%.4f) = %.4f\n",x,P_X_le_x)
% P(X>=x)
P_X_me_x  = 1 - P_X_le_x;
fprintf("P(X>=%.4f) = %.4f\n",x,P_X_me_x)
end

function expIntervall(x,y, lambda)
P_X_intervall = expcdf(y*lambda) - expcdf(x*lambda);
fprintf("P(%.4f < X < %.4f) = %.4f\n",x,y,P_X_intervall)
end

function expInv(qu, lambda)
xp = log(abs(1-qu)) / -lambda;
fprintf("x%.3f = %.4f\n",qu, xp)
end

% Gleichverteilung X~U(a,b)
function gleichverteilung(x,a,b)
% Erwartungswert
E_X = (a+b)/2;
fprintf("E(X) = %.4f\n",E_X)
% Varianz
Var_X = (b-a)^2/12;
fprintf("Var(X) = %.4f\n",Var_X)
% Standardabweichung
Std_X = sqrt(Var_X);
fprintf("Std(X  ) = %.4f\n\n", Std_X)
P_X_le_x = 0;
f_x = 0;
if a <= x && x <= b
    P_X_le_x = (x-a)/(b-a);
    f_x = 1/(b-a);
else
if x > b
    P_X_le_x = 1;
end
end
fprintf("f(%.4f) = %.4f\n",x,f_x)
fprintf("P(X<=%.4f) = %.4f\n",x,P_X_le_x)
fprintf("P(X>=%.4f) = %.4f\n",x,1-P_X_le_x)
end

function gleichverteilungIntervall(x,y,a,b)
P_X_le_x = 0;
P_X_le_y = 0;
if a <= x && x <= b
    P_X_le_x = (x-a)/(b-a);
else
if x > b
    P_X_le_x = 1;
end
end
if a <= y && y <= b
    P_X_le_y = (y-a)/(b-a);
else
if y > b
    P_X_le_y =1;
end
end
P_X_interv = P_X_le_y - P_X_le_x;
fprintf("P(%.4f<=X<=%.4f) = %.4f\n",x,y,P_X_interv)
end

% Normalverteilung X~N(mu,sigma)
function norm(x,mu, sigma)
% Erwartungswert
fprintf("E(X) = %.4f\n",mu)
% Varianz
fprintf("Var(X) = %.4f\n",sigma^2)
%standardabweichung
fprintf("Std(X) = %.4f\n\n",sigma)
% P(X<=x)
P_X_le_x = normcdf(x,mu,sigma);
fprintf("P(X<=%.4f) = %.4f\n",x,P_X_le_x)
end

function norm2v(x, mux, muy, sigmax, sigmay)
mu = mux +muy;
sigma = sqrt(sigmax^2+sigmay^2);
% Erwartungswert
fprintf("E(X) = %.4f\n",mu)
% Varianz
fprintf("Var(X) = %.4f\n",sigma^2)
%standardabweichung
fprintf("Std(X) = %.4f\n\n",sigma)
% P(X+Y<=x)
P_X_le_x = normcdf(x,mu,sigma);
fprintf("P(X+Y<=%.4f) = %.4f\n",x,P_X_le_x)
end

function normi (p, mu,sigma)
%xp
x = norminv(p,mu,sigma);
fprintf("x%.2f = %.4f\n", p, x)
end