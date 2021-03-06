function orthovectortest(a, b)
% Test for unit vector orthogonality; debugging tool
%
% Inputs
% a     - scalar/array/matrix, datatype, description [units]
%
% Outputs
% q     - scalar/array/matrix, datatype, description [units]
%
% Victor Gandarillas
% gandarillasv@gmail.com
%
% Last Updated: 20150501
%

% :TODO: the next task
% :BUG: thing to fix
% :KLUDGE: why code is ugly
% :TRICKY: sleep on it before editing again
% :WARNING: be careful to/not to write code this way
% :COMPILER: compiler problems
% :ATTRIBUTE: value

% -------------------------------------------------------------------------
% !!! EDIT THESE LINES BEFORE EACH EDIT/SAVE/RUN !!!
% -------------------------------------------------------------------------
fname='orthovectortest';
% error([fname, ' has not been written']);
% warning([fname, ' has not been verified']);
% warning([fname, ' has not been validated']);
% warning(['Error messages for ', fname, ' have not been written']);
% warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% ERROR CHECKING
% -------------------------------------------------------------------------
if nargin <1
warning('no input argument');
end

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------

if norm(a) == 1
if b ~= 0
        fprintf('Vector is orthogonal\n');
    end
else
    error('Vector is not orthogonal\n');
end

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end