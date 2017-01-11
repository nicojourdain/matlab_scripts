function[out] = runavg_hann(in,N)
%N - window length (doit etre impair)
%in - input vector
%out - output vector

out=NaN(1,length(in)-(N-1));

[ kk qq ] = size(in);

if ( kk == 1 ),
  w=hann(N)';
else
 w=hann(N);
end

for(i=(N-1)/2+1:length(in)-(N-1)/2)
  out(i-(N-1)/2)=sum(w.*in(i-(N-1)/2:i+(N-1)/2))/sum(w);
end
