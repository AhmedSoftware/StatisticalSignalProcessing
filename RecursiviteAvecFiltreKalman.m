function [X_n, erreurPrediction] =RecursiviteAvecFiltreKalman(Y,b,r)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N=length(Y); %longeur vecteur d'observation
%N=500;
A = eye(r+1);
A(1)=0;
B=zeros(r+1,1);
B(1)=1;


%A=[0 0 0; 0 1 0 ; 0 0 1]
%B=[1;0;0]
p_n=eye(r+1); % matrice d'erreur
X_n=[];
X=rand(r+1,1); 
gama_u =0.1;
gama_v = 0;
erreurPrediction = []
for i=r+1:N
C = [b; Y(i-1:-1:i-r)];
k_n = A*p_n*A'*C+C'*B*B*gama_u;
r_n=C'*k_n+gama_v;
K_n = (1/r_n) * k_n; %le gain de filtre de kalman
X=A*X+K_n*(Y(i)-C'*A*X);
p_n = A*p_n*A'-(k_n*k_n')/r_n+B*B'*gama_u;
erreurPrediction =[erreurPrediction  p_n(:,[1])];
X_n=[X_n X] ;
end

end

