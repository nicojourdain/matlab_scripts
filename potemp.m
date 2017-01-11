function y = potemp(Tis,Sis,Pis)
% FORMAT: Y = potemp(Tis,Sis,Pis)
%
%   Tis : in-situ temperature (degC)
%   Sis : in-situ salinity (psu)
%   Pis : depth (m)
% 
% Calculate potential temperature from in-situ temperature
%
% based on NEMO's OBS/obs_conv_functions.h90
%
% Check value: potemp(35,20,2000) = 19.621967
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin ~=3,
  error('FORMAT: Y = potemp(Tis,Sis,Pis)')
end

a1 =  1.067610e-05;
a2 = -1.434297e-06;
a3 = -7.566349e-09;
a4 = -8.535585e-06;
a5 =  3.074672e-08;
a6 =  1.918639e-08;
a7 =  1.788718e-10;

zpol = a1 + a2 * Sis + a3 * Pis + a4 * Tis + a5 * Sis * Tis + a6 * Tis * Tis + a7 * Tis * Pis;

y = Tis + Pis * zpol;
