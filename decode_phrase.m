function phrase = decode_phrase(message)
%%% Convertit un message {-1,+1} en phrase (ASCII)

if ~isequal(unique(message),[-1 ; 1])
    error('Le message decode ne doit comporter que des -1 ou des 1');
end

message(message==-1)=0;
message=num2str(message);
message=message(:);
message(1:701)=[];
message(end-700:end)=[];

if mod(length(message),7)~=0
    error('La phrase ne peut pas etre decodee');

else
    N=length(message)/7;
    phrase_mat=reshape(message,7,N)';
    phrase=char(bin2dec(phrase_mat));
    phrase=phrase';
end
