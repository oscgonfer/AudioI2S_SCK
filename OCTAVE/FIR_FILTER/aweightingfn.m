function [freq,Atable] = aweigthingfn(fs,fftSize);   freq=[0:fs/(fftSize):fs/2];    fA = 10^(2.45);  fL = 10^1.5;  fH = 10^3.9;  fr = 1000;  D = abs(sqrt(0.5));    b = (1/(1-D))*(fr^2+fL^2*fH^2/fr^2-D*(fL^2+fH^2));  c = fL^2*fH^2;    f1 = ((-b-sqrt(b^2-4*c))/2)^0.5;  f4 = ((-b+sqrt(b^2-4*c))/2)^0.5;    f2 = (3-sqrt(5))/2*fA;  f3 = (3+sqrt(5))/2*fA;    A1000 = -2;    Atable = 20*log10((f4^2.*freq.^4)./(((freq.^2+f1^2).*(freq.^2+f2^2).^0.5).*((freq.^2+f3^2).^0.5).*(freq.^2+f4^2)))-A1000;    %semilogx(freq,Atable);  %grid  %xlabel('Freq (Hz)')  %ylabel('A.weighting (dB)');  %  %table = zeros(257,2);  %table(:,1) = freq(:);  %table(:,2) = Atable(:);  %  %csvwrite('aweightingtableNORM.csv', table);endfunction