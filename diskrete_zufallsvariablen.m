clear all
close all

% Zuvallsvariable
X = [1, 2, 3, 4, 5];
% Wahrscheinlichkeiten von X
P = [0.1, 0.25, 0.35, 0.2, 0.1];
zufallsvariable(5,X,P)

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
xlim([0,length(X) + 1])
ylim([0,max(P)+0.05])
% Verteilungsfunktion
subplot(1,2,2)
stairs(cumsum(P));
xlim([1,length(X) + 1])
ylim([0,1])
end