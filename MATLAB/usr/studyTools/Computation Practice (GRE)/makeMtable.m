function [A] = makeMtable(n, m)
% This function generates a multiplication table of integers
% 
% Inputs
% n     - scalar integer value, max value of bottommost column value being
%         multiplied
% n     - scalar integer value, max value of rightmost row value being
%         multiplied

% Outputs
% A     - matrix, table of multitplied values


% Victor Gandarillas
% gandarillasv@gmail.com

% Baseline 20150314

% Notes
% Add error checking code

fname='makeMtable';

% error([fname, ' incomplete']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);

% Error Checking
if (~isinteger(n) || ~isinteger(m))
    warning('Using floor values for noninteger inputs');
    n = floor(n);
    m = floor(m);
end

for i = 1:n
    for j = 1:m
        A(i, j) = i*j;
    end
end

% End of function
end
