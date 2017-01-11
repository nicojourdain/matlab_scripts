function h = black(m)
%BLACK plain black color map
%   black(M) returns an M-by-3 matrix containing a plain black colormap.
%   black, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(black)
%
%   See also HSV, GRAY, PINK, COOL, BONE, COPPER, FLAG, 
%   COLORMAP, RGBPLOT.

%   N. Jourdain, LGGE-CNRS, Sep. 2015

if nargin < 1, m = size(get(gcf,'colormap'),1); end

r = (1:m)'/m;
g = r;
b = r;

h = zeros(size([r g b]));
