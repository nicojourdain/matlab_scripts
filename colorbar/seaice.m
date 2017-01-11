function h = seaice(m)
%SEAICE  blue-white color map
%   seaice(M) returns an M-by-3 matrix containing a "hot" colormap.
%   seaice, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(seaice)
%
%   See also HSV, GRAY, PINK, COOL, BONE, COPPER, FLAG, 
%   COLORMAP, RGBPLOT.

%   N. Jourdain, LGGE-CNRS, Sep. 2015

if nargin < 1, m = size(get(gcf,'colormap'),1); end

r = (1:m)'/m;
g = 0.85*r + 0.15;
b = 0.60*r + 0.40;

h = [r g b];
