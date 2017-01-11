function[out] = nanmeansp(in)
%in - input vector
%out - output vector

if ( isempty(in) ),
 out=0.0;
else
 out=nanmean(in);
end
