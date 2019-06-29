function [ resulat] =Seuillage(message)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
in_positif=find(message>0);
in_negatif=find(message<0);
message(in_positif)=ones(1,length(in_positif));
message(in_negatif)=-ones(1,length(in_negatif));
resulat = message;
end

