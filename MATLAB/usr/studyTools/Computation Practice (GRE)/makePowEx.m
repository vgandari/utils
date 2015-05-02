function [rootApprox, rooApprox2] = makeRootApproxTable(n)
% Generates integer roots and exponenets with answer key listing powers.
% User prescribes maximum root, exponent, and power values. Powers that
% exceed powermax are rewritten as zero. Any value <=1 is an invalid entry
% for rootmax.
% 
% Inputs
% rootmax     - scalar integer, maximum root value
% expmax      - scalar integer, maximum exponent value
% powmax      - scalar integer, maximum power value
% x           - number of exercises
% 
% Outputs
% repTable    - matrix, integer, table of powers; fisrt column is roots,
%               nth column contains nth power of roots
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Baseline 20150314
% 
% NOTES
% Optimize max power replacement

fname='makeRootApproxTable';

warning([fname, ' incomplete']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);

% Error Checking
if (~isinteger(rootmax) || ~isinteger(expmax) || ~isinteger(powmax))
    warning('Using floor values for noninteger inputs');
    rootmax = floor(rootmax);
    expmax = floor(expmax);
    powmax = floor(powmax);
end

if rootmax <=1
    error('rootmax must be greater than 1');
end

% Function Definition
% Make Table
rootApprox = [floor(randi(rootmax, x, 1)), floor(randi(expmax, x, 1))];
[a, b] = size(rootApprox);
rooApprox2 = rootApprox(:, 1).^rootApprox(:, 2);

for i = 1:x
    while rooApprox2(i) > powmax
        rootApprox(i, :) = [floor(randi(rootmax, 1)), floor(randi(expmax, 1))];
        rooApprox2(i) = rootApprox(i, 1).^rootApprox(i, 2);
    end
end

% End of function
end
