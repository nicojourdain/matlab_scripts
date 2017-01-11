function[out] = fillmiss_nico(in,N)
%in - input vector
% N - maximum size of window in which
%     missing values are filled (N is an odd)
%out - output vector

out(1)=NaN;
if ( isnan(in(1)) )
   for (k=1:(N-1)/2)
     if( ~isnan(in(1+k)) )
       out(1)=in(k+1);
       in(1)=in(k+1);
       break;
     end;
    end;
end;

out(length(in))=NaN;
if ( isnan(in(length(in))) )
   for (k=1:(N-1)/2)
     if( ~isnan(in(length(in)-k)) )
       out(length(in))=in(length(in)-k);
       in(length(in))=in(length(in)-k);
       break;
     end;
    end;
end;
   

for(i=1:length(in))
if( isnan(in(i)) )

  tmp1=NaN;
  for (k=1:(N-1)/2)
   if( i-k>0 )
   if( ~isnan(in(i-k)) )
     tmp1=in(i-k);
     a1=k; %i-(i-k)
     break;
   end;
   end;
  end;

  tmp2=NaN;
  for (k=1:(N-1)/2)
   if( i+k<=length(in) )
   if( ~ isnan(in(i+k)) )
     tmp2=in(i+k);
     a2=k; %i+k-i
     break;
   end;
   end;
  end;

  if ( isnan(tmp1) || isnan(tmp2) )
    out(i)=NaN;
  else
    out(i)=(a2*tmp1+a1*tmp2)/(a2+a1);
  end;

else

 out(i)=in(i);

end;
end;

end
