close all
clear all
% Exponentialverteilung Parameter (x, lambda)
% exp(2,0.5)
% Exponentialverteilung Intervall Parameter (x, y, lambda)
% expIntervall(1,2,0.5)

% Gleichverteilung Parameter (x, a, b) 
% gleichverteilung(3,0,10)
% Gleichverteilung Intervall Parameter (x, y, a, b) 
% gleichverteilungIntervall(5,9,0,10)

% Normalverteilung Parameter (x, mu, sigma)
% norm(175,180.3,7.17)
% Norminv Parameter (p, mu, sigma)
% normi(0.95,180.3,7.17)
%  Normalverteilung Parameter (x, mux, muy, sigmax, sigmay)
% norm2v(380,150,190,20,sqrt(500))


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
fprintf("Std(X) = %.4f\n\n", Std_X)
P_X_le_x = 0;
f_x = 0;
if a <= x && x <= b
    P_X_le_x = (x-a)/b-a;
    f_x = 1/(b-a);
else
if x > b
    P_X_le_x = 1;
end
end
fprintf("f(%.4f) = %.4f\n",x,f_x)
fprintf("P(X<=%.4f) = %.4f\n",x,P_X_le_x)
end

function gleichverteilungIntervall(x,y,a,b)
P_X_le_x = 0;
P_X_le_y = 0;
if a <= x && x <= b
    P_X_le_x = (x-a)/b-a;
else
if x > b
    P_X_le_x = 1;
end
end
if a <= y && y <= b
    P_X_le_y = (y-a)/b-a;
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