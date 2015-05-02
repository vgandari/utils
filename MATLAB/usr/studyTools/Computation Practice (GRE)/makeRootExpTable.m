function [repTable] = makeRootExpTable(rootmax, expmax, powmax)
% This function makes a table of integers roots and their powers up to a
% maximum root, exponent, and power value. Powers that exceed powermax are
% rewritten as zero. Any value <=1 is an invalid entry for rootmax.
% 
% Inputs
% rootmax     - scalar integer, maximum root value
% expmax      - scalar integer, maximum exponent value
% powmax      - scalar integer, maximum power value

% Outputs
% repTable    - matrix, integer, table of powers; fisrt column is roots,
%               nth column contains nth power of roots

% Victor Gandarillas
% gandarillasv@gmail.com

% Baseline 20150314

% NOTES
% Debug at line 62

fname='makeRootExpTable';

% error([fname, ' incomplete']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);

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
repTable = zeros(rootmax-1, expmax);
repTable(:, 1) = 2:rootmax;
for n = 1:expmax
    repTable(:, n) = repTable(:, 1).^n;
end

% Delete forbidden values
[a, b] = size(repTable);
for i = 1:a
    for j = 1:b
        if repTable(i, j) >= powmax
            repTable(i, j) = 0;
        end
    end
end


% FIX THESE
% % Reduce repTable size (rowa)
% c = zeros(1, b);
% for i = a:1
%     if repTable(i, :) == c
%         repTable = repTable(1:i-1, :);
%     end
% end
% 
% % Reduce repTable size (columns)
% d = zeros(a, 1);
% for j = b:1
%     if repTable(:, j) == d
%         repTable = repTable(:, 1:j-1);
%     end
% end


% End of function
end
