function[out] = runavg_new(in,N)
%N - window length (doit etre impair)
%in - input vector
%out - output vector

out=NaN(1,length(in)-(N-1));

for(i=(N-1)/2+1:length(in)-(N-1)/2)
  out(i-(N-1)/2)=sum(in(i-(N-1)/2:i+(N-1)/2))/N;
end
