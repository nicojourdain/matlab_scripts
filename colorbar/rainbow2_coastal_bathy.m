function c = rainbow2(m)
%rainbow2    Shades of dark red and blue color map
%   rainbow2(M), is an M-by-3 matrix that defines a colormap.
%   The colors begin with dark blue, range through shades of
%   blue to white, and then through shades of red to dark red.
%   jet_nico_br, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(rainbow2)
%
%   See also HSV, GRAY, HOT, BONE, COPPER, PINK, FLAG, 
%   COLORMAP, RGBPLOT.

%   Nico Jourdain, CNRS-LGGE, Mar 2015

if nargin < 1, m = size(get(gcf,'colormap'),1); end

% columns are (1) colorbar cursor from 0.00 to 1.00
%             (2) red 
%             (3) green
%             (4) blue
MM = [ 0.00000 0.84314 0.09020 0.50588 ; ...
       0.08333 0.39608 0.13725 0.52941 ; ...
       0.16667 0.45098 0.35294 0.64706 ; ...
       0.25000 0.11765 0.37647 0.63529 ; ...
       0.33333 0.17647 0.67059 0.66667 ; ...
       0.41667 0.39608 0.70980 0.19608 ; ...
       0.50000 0.70196 0.85098 0.40784 ; ...
       0.58333 1.00000 1.00000 0.49020 ; ...
       0.66667 0.96863 0.90980 0.33333 ; ...
       0.75000 0.98039 0.70196 0.26275 ; ...
       0.83333 0.97255 0.40000 0.07451 ; ...
       0.91667 0.87059 0.09804 0.16863 ; ...
       1.00000 0.49020 0.05490 0.02745 ];

%===========================================
% distort colorbar for coastal bathymetry :
for kk=1:9,
  MM(kk,1)=MM(kk,1)*0.25;
end
MM(10,1)=MM(10,1)*0.35;
MM(11,1)=MM(11,1)*0.55;
MM(12,1)=MM(12,1)*0.75;
%===========================================

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

