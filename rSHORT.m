%Ali AHMED, Youba OTMANI, Zakaria Mzirda

function [rshort] = rSHORT()
deltatF=0.3125*10^(6);
Sk=[];
Sk=sqrt(13/6).*[0 0 1+j 0 0 0 -1-j  0  0  0  1+j  0  0  0 -1-j  0  0  0 -1-j  0 0 0 1+j 0 0 0 0 0 0 0 -1-j 0 0 0 -1-j 0 0 0 1+j 0 0 0 1+j 0 0 0 1+j 0 0 0 1+j 0 0];
Sk=Sk';
length(Sk)
Nst=length(Sk)-1;
Tshort = 0.8*10^(-6);
Ttr= 100*10^(-9);
t1=[]
t1=-Ttr/2:Ttr/10:Ttr/2;
t2=Ttr/2:Ttr/10:Tshort-Ttr/2;
t3=Tshort-Ttr/2:Ttr/10:Tshort+Ttr/2;
t =[t1,t2,t3];
Wtshort1=sin(pi/2*(0.5+t1/Ttr)).^2;
Wtshort2=ones(1,length(t2));
Wtshort3=sin(pi/2*(0.5-(t3-Tshort)/Ttr)).^2;
%fenetrage
wtshort=[Wtshort1 Wtshort2 Wtshort3];

rshort =[];

for n=1:10
     somme=0;
   for k = -Nst/2:Nst/2
   somme = Sk(k+Nst/2+1)*exp(1j*2*pi*k*deltatF.*t)+somme;
   somme = abs(somme);
   end
   short = wtshort.*somme;
   rshort = [rshort short]; 
end
end

