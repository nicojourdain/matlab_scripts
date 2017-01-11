function theResult = ncload(filenam,var1,var2,var3,var4,var5,var6,var7,var8,var9)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% N. JOURDAIN, LGGE-CNRS, Grenoble, April 2015
%
% Used to load all variables present in a netcdf file :
% 	> ncload(filenam)
% or to load a list of selected variables :
%	> ncload(filenam,var1,var2,var3,...)
%
% Works as previous ncload, but based on new netcdf 
% function that are now present by default in matlab
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 1, disp('#&!*$ Error  -->   Usage:   ncload(file_name) or ncload(file_name,var1,var2,var3,...) '), return, end

ncid = netcdf.open(filenam,'NC_NOWRITE');

[ndims,nvars,ngatts,unlimdimid] = netcdf.inq(ncid);

% Get file dimensions :
for kk=1:ndims,
  [dimname, dimlen] = netcdf.inqDim(ncid,kk-1);
  dimid(kk) = netcdf.inqDimID(ncid,dimname);
  mdim(kk) = dimlen;
end

disp([ 'Opening file ', filenam ])
disp([ num2str(ndims-1), ' dimensions and ', num2str(nvars-1), ' variables' ])

if nargin == 1, % get all variables

  % Get variables :
  for kk=1:nvars,
    [varname, xtype, dimids, numatts] = netcdf.inqVar(ncid,kk-1);
    disp([ '     ', varname, '  (' num2str(numel(dimids)), ' dimensions)' ])
    varid = netcdf.inqVarID(ncid,varname);
    var = netcdf.getVar(ncid,varid);
    xvarname{kk}=varname;
    xvar{kk}=var;
    assignin('caller',xvarname{kk},xvar{kk});
    clear var
  end
  theResult = xvarname;

else % get selected variables

  for kk=1:nargin-1,
    varname = eval(['var',num2str(kk)]); 
    varid = netcdf.inqVarID(ncid,varname);
    var = netcdf.getVar(ncid,varid);
    xvarname{kk}=varname;
    xvar{kk}=var;
    assignin('caller',xvarname{kk},xvar{kk});
    clear var
  end
  theResult = xvarname;

end

netcdf.close(ncid);
