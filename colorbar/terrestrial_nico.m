function c = terrestrial_nico(m)
%terrestrial_nico
%   terrestrial_nico(M), is an M-by-3 matrix that defines a colormap.
%
%   The colormap terrestrial_nico is a modification of Ferret's terrestrial_cmyk.
%
%   terrestrial_nico, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(terrestrial_nico)
%
%   See also HSV, GRAY, HOT, BONE, COPPER, PINK, FLAG, 
%   COLORMAP, RGBPLOT.
%
%   Nico Jourdain, CNRS-LGGE, Mar 2015

if nargin < 1, m = size(get(gcf,'colormap'),1); end

% columns are (1) colorbar cursor from 0.00 to 1.00
%             (2) red 
%             (3) green
%             (4) blue
MM = [ 0.00 0.00 0.60 0.00;
       0.10 0.20 0.90 0.00; 
       0.20 1.00 1.00 0.00; 
       0.40 0.60 0.30 0.00; 
       0.80 0.75 0.70 0.65;
       1.00 1.00 1.00 1.00 ];

[ ny nx ] = size(MM);

m0=m;
r = [];
g = [];
b = [];
%%%
for kk=1:ny-1,
  if ( kk == ny-1 ),
      m(kk) = m0-numel(r);
  else
      m(kk)=round(m0*MM(kk+1,1))-numel(r);
  end
  %%
  if ( kk == 1 & m(kk) > 1 ),
      r = [ r ; ((0:m(kk)-1)'/max(m(kk)-1,1))*(MM(kk+1,2)-MM(kk,2))+MM(kk,2) ];
      g = [ g ; ((0:m(kk)-1)'/max(m(kk)-1,1))*(MM(kk+1,3)-MM(kk,3))+MM(kk,3) ];
      b = [ b ; ((0:m(kk)-1)'/max(m(kk)-1,1))*(MM(kk+1,4)-MM(kk,4))+MM(kk,4) ];  
  elseif ( kk == ny-1 & m(kk) > 1 ),
      r = [ r ; ((1:m(kk))'/max(m(kk),1))*(MM(kk+1,2)-MM(kk,2))+MM(kk,2) ];
      g = [ g ; ((1:m(kk))'/max(m(kk),1))*(MM(kk+1,3)-MM(kk,3))+MM(kk,3) ];
      b = [ b ; ((1:m(kk))'/max(m(kk),1))*(MM(kk+1,4)-MM(kk,4))+MM(kk,4) ];
  elseif ( kk == 1 & m(kk) == 1 ),
      r = [ r ; MM(kk,2) ];
      g = [ g ; MM(kk,3) ];
      b = [ b ; MM(kk,4) ];
  elseif ( kk == ny-1 & m(kk) == 1 ),
      r = [ r ; MM(kk+1,2) ];
      g = [ g ; MM(kk+1,3) ];
      b = [ b ; MM(kk+1,4) ];
  elseif ( m(kk) >= 1 ),
      r = [ r ; ((0.5:1:m(kk)-0.5)'/m(kk))*(MM(kk+1,2)-MM(kk,2))+MM(kk,2) ];
      g = [ g ; ((0.5:1:m(kk)-0.5)'/m(kk))*(MM(kk+1,3)-MM(kk,3))+MM(kk,3) ];
      b = [ b ; ((0.5:1:m(kk)-0.5)'/m(kk))*(MM(kk+1,4)-MM(kk,4))+MM(kk,4) ];
  end
end

%
c = [r g b]; 

