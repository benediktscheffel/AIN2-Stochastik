clear all 
close all

% Bernouli-Verteilung Parameter (x,p)
%ber(0,0.8)

% Geometrische-Verteilung Parameter (x,p)
%geom(4,0.4)

% Binominal-Verteilung Parameter (x, n,p)
%bin(1,5,0.25)

%Poisson-Verteilung Parameter (x, lambda)
po(5,2)



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
geom_P_X_me_x = 1 - geocdf(x-1,p);
fprintf("P(X>=%d) = %.4f\n",x, geom_P_X_me_x)

% P(X>x)
fprintf("P(X>%d) = %.4f\n", x, geom_P_X_me_x-geom_P_X_e_x)
end

% Binominal-Verteilung X~Bin
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
P_X_me_x = 1- binocdf(x,n,p);
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
fprintf("P(X>=%d) = %.4f\n",x,1 - poisscdf(x,lambda))
end