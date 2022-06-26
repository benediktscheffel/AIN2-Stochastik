clear all
close all
X = [3 2 10 7 0 3 5];
Y = [5 4 3 2 1];

stats(X)
%multivarstat(X,Y)
%(empirische) Kovarianz
function stats(X)
%Arithetisches Mittel
mittel_x = mean(X);
fprintf("Mittelwert(X) = %f\n",mittel_x)

%Median
median_x = quantile(X,0.5);
fprintf("Median(X) = %f\n",median_x)

%Modalwert
modal_x = mode(X);
fprintf("Modal(X) = %f\n",modal_x)

%Quartile
q_025_x = quantile(X,0.25);
fprintf("0.25quantil(X) = %f\n",q_025_x)
q_075_x = quantile(X,0.75);
fprintf("0.75quantil(X) = %f\n",q_075_x)

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