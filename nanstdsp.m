function[out] = nanstdsp(in)
%in - input vector
%out - output vector

if ( isempty(in) ),
 out=0.0;
else
 out=nanstd(in);
end
