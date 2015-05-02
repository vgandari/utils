function [q] = viewVarsByRow(p)
% Function description
% 
% This function displays each row of the input arrays
% Inputs
% p     - array

% Outputs
% none  - each row of the arrays is displayed

% Victor Gandarillas
% gandarillasv@gmail.com

% Baseline 20150314

% NOTES
% Complete header
% Write function
% Add error checking code

% Add multiple argument capability
% Get variable name from input (true variable name only exists outside
% function)

fname='viewVarsByRow';

error([fname, ' incomplete']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);

% Error Checking
if nargin <1
    warning('no input argument');
end

% Function Definition
fprintf('%s row %d: %f\n', varname, i, varval);

% End of Function
end
