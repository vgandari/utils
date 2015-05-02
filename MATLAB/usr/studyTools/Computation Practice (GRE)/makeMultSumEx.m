function [multSumEx, prodKey, sumKey] = makeMultSumEx(n, m, x)
% This function makes a two random column of numbers <=max(n, m) and a
% third column of numbers whose factors are 
% 
% Inputs
% n     - scalar, integer
% m     - scalar, integer
% x     - scalar, integer

% Outputs
% fact     - 2 column matrix, integer, contains a set of random integer
% values, all <=max(n, m)
% prod    - column vector, integer, each element is a product of the
% values in te same row as fact


% Victor Gandarillas
% gandarillasv@gmail.com

% Baseline 20150314

% Notes
% Write function
% Add error checking code

fname='makeMultSumEx';

% error([fname, ' incomplete']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);

% Error Checking
if (~isinteger(n) || ~isinteger(m))
    warning('Using floor values for noninteger inputs');
    n = floor(n);
    m = floor(m);
end

% Function Definition
a = max(n, m);
multSumEx = zeros(x, 2);
prodKey = zeros(x, 1);
sumKey = zeros(x, 1);

for i = 1:x
    multSumEx(i, :) = floor(randi(a, 1, 2));
    prodKey(i) = multSumEx(i, 1)*multSumEx(i, 2);
    sumKey(i) = multSumEx(i, 1) + multSumEx(i, 2);
end

prodKey = prodKey;
sumKey = sumKey;

% End of function
end
