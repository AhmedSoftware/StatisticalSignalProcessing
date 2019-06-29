%Ali AHMED, Youba OTMANI, Zakaria Mzirda

%Synchronisation temporelle du message 
 clear all
 close all
 
%creation de l'apprentissage
%on ajoute le preambule avant la transmission car l'émeteur et le
%recepeteur le connait
preambule = rSHORT();

load('MessageCode_1_Ali.mat')
%ordre=3;
ordre = 2
%apprentissage
% le message d'entré est message_code ( on va le changer selon le variable
% que recoit le recepteur
message_Avec_preambule= [ preambule' ; message_code]; %concatener le preambule

X = [rand(2000,1); message_Avec_preambule]; %simuler le retard
    
    %debut de la synchornisation
    intercor =xcorr(X,preambule);% pour pouvor aficher l'intercorelation
    maxIndiceAuto =length(xcorr(preambule));% la taille de l'autocorelation preambule
    intercor = intercor(length(intercor)/2:length(intercor));
    [max,indice] = max(intercor); %trouver l'indice max de l'intercorelation
    XsansDecalage=X(indice-1:length(X)); % un signal synchronise
    y=XsansDecalage(length(preambule)+2:length(XsansDecalage)); % pour enlever le preambule
    %find de la syhnchronisation 
    
%pour tester si la synchronisation est bien faite 
 [xK pn] = RecursiviteAvecFiltreKalman(y,1,ordre);
 coeficients=xK(:,[50]);
 an=coeficients(2:length(coeficients))
 a=[1 -an'];
 xUseVecteurPrediction =filter(a,1,y);
 xUseFilterSeuillage = Seuillage(xUseVecteurPrediction);
 message_avecCoeficientPredit=decode_phrase(xUseFilterSeuillage)
%fin du test

figure(1)
plot(X);
title("message décalé");

figure(2);
plot(preambule)
title("le premabule");

figure(3)
plot(intercor);
title("intertocorrelation");

figure(4)
plot(y);
title("le signal en sortie apres syncronisation");


