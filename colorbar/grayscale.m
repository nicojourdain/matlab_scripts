function h = grayscale(m)
%SEAICE  light gray to dark gray color map
%   grayscale(M) returns an M-by-3 matrix containing a "gray" colormap.
%   grayscale, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(grayscale)
%
%   See also HSV, GRAY, PINK, COOL, BONE, COPPER, FLAG, 
%   COLORMAP, RGBPLOT.

%   N. Jourdain, LGGE-CNRS, Aug. 2016

if nargin < 1, m = size(get(gcf,'colormap'),1); end

r = (1:m)'/m;
g = r;
b = r;

h = flipud([r g b]) * 0.5 + 0.25;
