function c = blue_red_darkend(m)
%blue_red_darkend    Shades of dark red and blue color map
%   blue_red_darkend(M), is an M-by-3 matrix that defines a colormap.
%
%   The colormap blue_red_darkend goes from purple to dark red via white at its center
%
%   blue_red_darkend, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(blue_red_darkend)
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
MM = [ 0.000 0.16 0.20 0.43 ; ...
       0.150 0.44 0.19 0.62 ; ...
       0.250 0.65 0.45 0.70 ; ...
       0.375 0.32 0.78 0.94 ; ...
       0.470 1.00 1.00 1.00 ; ...
       0.530 1.00 1.00 1.00 ; ...
       0.625 0.96 0.92 0.23 ; ...
       0.850 0.89 0.22 0.18 ; ...
       1.000 0.20 0.00 0.00 ];

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

