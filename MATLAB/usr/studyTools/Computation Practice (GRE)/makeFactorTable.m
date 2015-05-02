function [factorEx, factorKey, pFactorKey] = makeFactorTable(factormin, factormax)
% Produce all prime factors of integers 1 through n,
% output to matrix with values left justified; includes nonprime factors;
% all other entries set to zero
% 
% Inputs
% n     - scalar integer, maximum number that will be factored
% 
% Outputs
% A     - matrix, integer, factors of numbers 1 through n on each row
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Baseline 20150315
% 
% NOTES
% Complete header
% Debug line 34
% Modify code to include all factors, even nonprime factors

fname='makeFactorTable';

% error([fname, ' incomplete']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);

% Error Checking
% if (~isinteger(n))
%     warning('Using floor values for noninteger input');
%     n = floor(n);
% end

% if nargin < 2
%     factormin = 1;
% end

if ~(floor(factormax) == factormax && floor(factormin) == factormin)
    warning('Using floor values for noninteger input');
    factormax = floor(factormax);
    factormin = floor(factormin);
end

% Function Definition
factorKey = 0;
factorEx = factormin:factormax;
factorEx = factorEx';

for i = factormin:factormax
    f = factor(i);
    f = unique(f);
    [a, b] = size(factorKey);
    if b < length(f) && b >=1
        factorKey = [factorKey, zeros(a, length(f)-b)];
        factorKey = [factorKey; f];
    elseif b > length(f) && b >=1
        factorKey = [factorKey; [f, zeros(1, b-length(f))] ];
    elseif b >=1
        factorKey = [factorKey; f];
    end
end

factorKey = factorKey(2:a, :);

% for i = factormin:factormax
%     f = factor(i);
%     f = primes(max((f)));
%     [a, b] = size(pFactorKey);
%     if b < length(f) && b >=1
%         pFactorKey = [pFactorKey, zeros(a, length(f)-b)];
%         pFactorKey = [pFactorKey; f];
%     elseif b > length(f) && b >=1
%         pFactorKey = [pFactorKey; [f, zeros(1, b-length(f))] ];
%     elseif b >=1
%         pFactorKey = [pFactorKey; f];
%     end
% end
% 
% pFactorKey = factorKey(2:a, :);

% End of Function
end
