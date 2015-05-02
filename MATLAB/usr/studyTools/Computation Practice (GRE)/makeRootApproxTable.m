function [rootApprox] = makeRootApproxTable(n)
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
% Baseline 20150315
% 
% NOTES
% Debug line 61


fname='makeRootApproxTable';

warning([fname, ' incomplete']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);

% Error Checking
if ~(floor(n) == n)
    warning('Using floor values for noninteger input');
    n = floor(n);
end

% Function Definition
% Make Table
powers = 1:n;
powers = powers';

rootApprox = zeros(n, 1);

for i = 1:n
    rootApprox(i) = round(1000*sqrt(powers(i)))/1000;
end

% i = 1;
% while i < n
%     % If perfect square, do not include and shorten arrays
%     if (floor(sqrt(powers(i))) == sqrt(powers(i)))
%         rootApprox = rootApprox(1:length(rootApprox)-1);
%         if i < n
%             powers = [powers(1:i-1); powers(i+1:length(powers))];
%         else
%             powers = powers(1:i-1);
%         end
%     else
%         % If not perfect square, calculate approximate root
%         rootApprox(i) = round(100*sqrt(powers(i)))/100;
%         i = i + 1;
%     end
% end

% End of function
end
