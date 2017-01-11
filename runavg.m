function[out] = runavg(in,N)
%N - window length (doit etre impair)
%in - input vector
%out - output vector

for(i=(N-1)/2+1:length(in)-(N-1)/2)
 %out(i)=sum(in(i-(N-1)/2:i+(N-1)/2))/N;
 out(i-(N-1)/2)=sum(in(i-(N-1)/2:i+(N-1)/2))/N;
end

%for(i=1:(N-1)/2+1)
%out(i)=NaN;
%
%end
