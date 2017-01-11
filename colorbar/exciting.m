function c = exciting(m)
%exciting
%   exciting(M), is an M-by-3 matrix that defines a colormap.
%
%   The colormap exciting is inspired by Ferret's exciting_cmyk.
%
%   exciting, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(exciting)
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
MM= [   0.000  94.510  88.627  94.118 ; ...
       11.111  69.804  62.745  80.392 ; ...
       22.222  50.196  65.098  80.784 ; ...
       33.333  40.392  75.686  60.784 ; ...
       44.444  33.725  69.412  20.000 ; ...
       55.556  80.000  90.588   4.314 ; ...
       66.667  98.039  96.078   9.804 ; ...
       77.778  97.255  50.980   6.667 ; ...
       88.889  98.039   7.059   4.706 ; ...
       99.999  59.608   5.882   3.137 ];

MM=MM*1.e-2;

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

