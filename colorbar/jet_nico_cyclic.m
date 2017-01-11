function c = jet_nico_cyclic(m)
%jet_nico_cyclic  Shades of dark red and blue color map
%   jet_nico_cyclic(M), is an M-by-3 matrix that defines a colormap.
%   The colors begin with dark blue, range through shades of
%   blue to white, and then through shades of red to dark red.
%   jet_nico_br, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(jet_nico_cyclic)
%
%   See also HSV, GRAY, HOT, BONE, COPPER, PINK, FLAG, 
%   COLORMAP, RGBPLOT.

%   Nico Jourdain, May 2014

if nargin < 1, m = size(get(gcf,'colormap'),1); end

% From [0.85 0.65 0.80] to [0.44 0.19 0.62 ] to [0.16 0.20 0.43] to [0.32 0.78 0.94 ] to [1 1 1], then [1 1 1] to [0.96 0.92 0.23] to [0.89 0.22 0.18] to [0.2 0 0] to [0.80 0.60 0.40]
% --------light brown---------deep purple------------darkblue-------------azur------------white--  -----white--------dark yellow------------red------------dark red-------light brown-----
%if (mod(m,2) == 0)
%    m0 = m*0.5;
%else
%    m0 = floor(m*0.5);
%end
m0 = floor(m*0.5);
% pink to deep purple :
m1 = floor(m0*0.25);
if ( m1 > 1 ),
  r1 = ((0:m1-1)'/max(m1-1,1))*(0.44-0.80)+0.80;
  g1 = ((0:m1-1)'/max(m1-1,1))*(0.19-0.60)+0.60;
  b1 = ((0:m1-1)'/max(m1-1,1))*(0.62-0.40)+0.40;
elseif ( m1 == 1 ),
  r1 = 0.80;
  g1 = 0.60;
  b1 = 0.40;
else
  r1 = [];
  g1 = [];
  b1 = [];
end
% deep purple to dark blue :
m2 = floor(m0*0.35)-numel(r1);
if ( m2 > 1 ),
  r2 = ((0:m2-1)'/max(m2-1,1))*(0.16-0.44)+0.44;
  g2 = ((0:m2-1)'/max(m2-1,1))*(0.20-0.19)+0.19;
  b2 = ((0:m2-1)'/max(m2-1,1))*(0.43-0.62)+0.62;
else
  r2 = [];
  g2 = [];
  b2 = [];
end
% dark blue to azur :
m3 = floor(m0*0.7)-numel(r1)-numel(r2);
if ( m3 > 1 ),
  r3 = ((0:m3-1)'/max(m3-1,1))*(0.32-0.16)+0.16;
  g3 = ((0:m3-1)'/max(m3-1,1))*(0.78-0.20)+0.20;
  b3 = ((0:m3-1)'/max(m3-1,1))*(0.94-0.43)+0.43;
elseif ( m2 == 1 ),
  r2 = 0.16;
  g2 = 0.20;
  b2 = 0.43;
else
  r3 = [];
  g3 = [];
  b3 = [];
end
% azur to white :
m4 = m0-numel(r1)-numel(r2)-numel(r3);
r4 = ((1:m4)'/max(m4,1))*(1.00-0.32)+0.32;
g4 = ((1:m4)'/max(m4,1))*(1.00-0.78)+0.78;
b4 = ((1:m4)'/max(m4,1))*(1.00-0.94)+0.94;
% white to dark yellow :
m5 = ceil(m0*0.25);
if ( m5 > 1 ),
  r5 = ((0:m5-1)'/max(m5-1,1))*(0.96-1.00)+1.00;
  g5 = ((0:m5-1)'/max(m5-1,1))*(0.92-1.00)+1.00;
  b5 = ((0:m5-1)'/max(m5-1,1))*(0.23-1.00)+1.00;
elseif ( m5 == 1 ),
  r5 = 1.00;
  g5 = 0.90;
  b5 = 0.17;
else
  r5 = [];
  g5 = [];
  b5 = [];
end
% dark yellow to red :
m6 = ceil(m0*0.50)-numel(r5);
if ( m6 > 0 ),
  r6 = ((1:m6)'/max(m6,1))*(0.89-0.96)+0.96;
  g6 = ((1:m6)'/max(m6,1))*(0.22-0.92)+0.92;
  b6 = ((1:m6)'/max(m6,1))*(0.18-0.23)+0.23;
else
  r6 = [];
  g6 = [];
  b6 = [];
end
% red to dark red :
m7 = ceil(m0*0.80)-numel(r5)-numel(r6);
if ( m7 > 0 ),
  r7 = ((1:m7)'/max(m7,1))*(0.20-0.89)+0.89;
  g7 = ((1:m7)'/max(m7,1))*(0.00-0.22)+0.22;
  b7 = ((1:m7)'/max(m7,1))*(0.00-0.18)+0.18;
else
  r7 = [];
  g7 = [];
  b7 = [];
end
% red to dark red :
m8 = m0-numel(r5)-numel(r6)-numel(r7);
if ( m8 > 0 ),
  r8 = ((1:m8)'/max(m8,1))*(0.80-0.20)+0.20;
  g8 = ((1:m8)'/max(m8,1))*(0.60-0.00)+0.00;
  b8 = ((1:m8)'/max(m8,1))*(0.40-0.00)+0.00;
else
  r8 = [];
  g8 = [];
  b8 = [];
end
%%%%%%%%%%%%%%%%%%%%%%%%
r = [ r4; r5 ];
g = [ g4; g5 ];
b = [ b4; b5 ];
if ( ~isempty(r3) ),
  r = [ r3; r ];
  g = [ g3; g ];
  b = [ b3; b ];
end
if ( ~isempty(r2) ),
  r = [ r2; r ];
  g = [ g2; g ];
  b = [ b2; b ];
end
if ( ~isempty(r1) ),
  r = [ r1; r ];
  g = [ g1; g ];
  b = [ b1; b ];
end
if ( ~isempty(r6) ),
  r = [ r; r6 ];
  g = [ g; g6 ];
  b = [ b; b6 ];
end
if ( ~isempty(r7) ),
  r = [ r; r7 ];
  g = [ g; g7 ];
  b = [ b; b7 ];
end
if ( ~isempty(r8) ),
  r = [ r; r8 ];
  g = [ g; g8 ];
  b = [ b; b8 ];
end
%
c = [r g b]; 

