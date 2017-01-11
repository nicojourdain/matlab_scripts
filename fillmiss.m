function[out] = fillmiss(in)
%in - input vector
%out - output vector

if ( isnan(in(1)) )
   for (k=1:length(in)-1)
     if( ~isnan(in(1+k)) )
       out(1)=in(k+1);
       in(1)=in(k+1);
       break;
     end;
    end;
end;

if ( isnan(in(length(in))) )
   for (k=1:length(in)-1)
     if( ~isnan(in(length(in)-k)) )
       out(length(in))=in(length(in)-k);
       in(length(in))=in(length(in)-k);
       break;
     end;
    end;
end;
   

for(i=1:length(in))
if( isnan(in(i)) )

  for (k=1:length(in)-1)
   if( i-k>0 )
   if( ~isnan(in(i-k)) )
     tmp1=in(i-k);
     a1=k;
     break;
   end;
   end;
  end;

  for (k=1:length(in)-1)
   if( i-k<length(in) && ~ isnan(in(i+k)) )
     tmp2=in(i+k);
     a2=k;
     break;
   end;
  end;

  out(i)=(a2*tmp1+a1*tmp2)/(a1+a2);

else

 out(i)=in(i);

end;
end;

end
