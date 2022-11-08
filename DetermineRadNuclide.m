clear all
close all
RNa0Nb0 = 5;
Nbi = 1;
Nai = 1;
ta = 6.7;
tb = 9.2;
la = 1 / ta;
lb = 1 / tb;
dt = 0.1;
Na(1) = Nai;
% Calculating the amount of radioactive nucleids after radioactive decay
Nb(1) = Nbi;
T(10) = 0;
i=1;
while max(T) < 70
dNadt = -Na(i)*la;
dNbdt = RNa0Nb0 * Na(i)*la - Nb(i)*lb;
i=i+1;
Na(i) = Na(i-1) + dt*dNadt;
Nb(i) = Nb(i-1) + dt*dNbdt;
T(i) = T(i-1) + dt;
end
% analytic solution
NbA = la/(lb-la) * RNa0Nb0 * (exp(-la.*T)-exp(-lb.*T)) + exp(-lb.*T)
figure;
plot(T,Nb,'k-');
xlabel('t (h)');
ylabel('NB');