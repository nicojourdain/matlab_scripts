function h = gray30(m)
%GRAY30 plain gray color map
%   gray30(M) returns an M-by-3 matrix containing a "gray" colormap.
%   gray30, by itself, is the same length as the current figure's
%   colormap. If no figure exists, MATLAB creates one.
%
%   For example, to reset the colormap of the current figure:
%
%             colormap(gray30)
%
%   See also HSV, GRAY, PINK, COOL, BONE, COPPER, FLAG, 
%   COLORMAP, RGBPLOT.

%   N. Jourdain, LGGE-CNRS, Sep. 2015

if nargin < 1, m = size(get(gcf,'colormap'),1); end

r = (1:m)'/m;
g = r;
b = r;

h = zeros(size([r g b])) + 0.3;
