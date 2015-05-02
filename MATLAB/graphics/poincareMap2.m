function [PX, PY, view_axis1, view_axis2, c] = poincareMap(n, b, x, y, z, tol)
% This function generates data for use in generating a Poincaré map from a
% set of discrete data points in three dimensions. The output is a reduced
% data set in two dimensions suitable for plotting a Poincaré map whose
% axes form an orthogonal basis of the view plane. The view plane is a two
% dimensional subspace of the three dimensional space in which the original
% data is represented. Plot axes for the Poincaré map are automatically
% generated. The user can edit lines 99-108 to optionally include/exclude a
% visualization of the generated plot axes.
% 
% Inputs
% n     - float, 3-vector, orthogonal to view plane
% b     - float, 3-vector or 0 scalar, view plane offset from origin
% x     - float, vector, x coordinates of input data
% y     - float, vector, y coordinates of input data
% z     - float, vector, z coordinates of input data
% tol   - float, scalar, include data within tol distance of view plane
% 
% Outputs
% PX    - float, vector, x coordinate of points included in Poincaré map
% PY    - float, vector, y coordinate of points included in Poincaré map
% view_axis1 - float, vector, plot x axis vector
% view_axis2 - float, vector, plot y axis vector
% c          - colormap (default jet), shows progression of data set
% 
% Victor Gandarillas
% gandarillasv@gmail.com
% 
% Last updated 20150428
% 
% :TODO:
% Uncomment error line
% Complete header
% Write function
% Add error checking code

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
fname='poincareMap';
% error([fname, ' has not been written']);
warning([fname, ' has not been verified']);
warning([fname, ' has not been validated']);
warning(['Error messages for ', fname, ' have not been written']);
warning([fname, ' has not been properly commented']);

% -------------------------------------------------------------------------
% ERROR CHECKING
% -------------------------------------------------------------------------
if nargin <1
    warning('no input argument');
end

% -------------------------------------------------------------------------
% FUNCTION DEFINITION
% -------------------------------------------------------------------------

% VIEW PLANE VECTOR
% Normalize n
if norm(n) == 0
    error('n must be a nonzero vector');
else
    n = n/norm(n);
end

% USE ONLY COLUMN VECTORS
n = [n(1); n(2); n(3)];

% TRANSFORM B TO COLUMN VECTOR
if b ~= 0
    b = [b(1); b(2); b(3)];
else
    b = zeros(3, 1);
end

% DEFINE INDICES IN CASE VIEW VECTOR HAS TWO COMPONENTS OF EQUAL LENGTH
indices = [1 2 3 1 2];

% FIND INDEX OF LARGEST COMPONENT OF VIEW PLANE VECTOR
% CONTROL FLOW IS COMPLICATED IN CASE N HAS TWO COMPONENTS THAT ARE EQUAL
if length(find(max(abs(n)) == abs(n))) == 3
    view1 = 1;
    view2 = 2;
elseif length(find(max(abs(n)) == abs(n))) == 2
    view1 = find(min(n) == n);
    view2 = indices(view1 + 1);
%     view1 = 3;
%     view2 = 1;
elseif length(find(max(abs(n)) == abs(n))) == 1
    exclude = find(max(abs(n)) == abs(n));
    view1 = indices(exclude + 1);
    view2 = indices(exclude + 2);
%     view1 = 2;
%     view2 = 3;
end

% INITIALIZE DATA REFFERENCE FRAME AXES
axis1 = zeros(3, 1);
axis2 = zeros(3, 1);

% SELECT REFERENCE FRAME AXES LEAST PARALLEL TO VIEW VECTOR
axis1(view1) = 1;
axis2(view2) = 1;

% :BUG: THE BUG IS --HERE--
% SET INTERMEDIATE AXES
% SUBTRACT COMPONENTS OF N FROM PRINCIPAL AXES
% n*(n'*axis1)
% n*(n'*axis2)
% n23 = n - n'*axis1;
% n31 = n - n'*axis2;
% int_axis1 = n23;
% int_axis2 = n31;
int_axis1 = axis1 - n*(n'*axis1);
int_axis2 = axis2 - n*(n'*axis2);
int_axis1 = -int_axis1;
int_axis2 = -int_axis2;

% ANGLE BETWEEN INTERMEDIATE AXES
theta = acos(int_axis1'*int_axis2);

% ANGLE BETWEEN INTERMEDIATE AXES AND VIEW AXES
phi = (theta - pi/2)/2;

% VIEW AXES
view_axis1 = simple2DCM(n, phi)'*int_axis1;
view_axis2 = simple2DCM(n, -phi)'*int_axis2

% :DEBUG: TEST FOR ORTHOGONALITY
norm(cross(view_axis1, view_axis2))
n

% YOU CAN'T CHANGE THE SIGN OF THE AXES - THEY AREN'T PERPENDICULAR,
% THEY WON'T BE PERPENDICULAR IF YOU SIMPLY FLIP THEM; CHANGING SIGN OF PHI
% WILL MAKE THEM MORE ACCUTE OR MORE OBTUSE

% :DEBUG:
% PLOT REFERENCE FRAME AXES, N, AND VIEW AXES
figure(1)
plot3([0 1], [0 0], [0 0], 'k.-', ... % x (solid black with point)
    [0 0], [0 1], [0 0], 'k.-', ... % y (solid black with point)
    [0 0], [0 0], [0 1], 'k.-', ... % z (solid black with point)
    [0 n(1)], [0, n(2)], [0, n(3)], 'p', ... % n (star)
    [0 int_axis1(1)], [0, int_axis1(2)], [0, int_axis1(3)], 'r--', ... % int axis 1 (broken red line)
    [0 int_axis2(1)], [0, int_axis2(2)], [0, int_axis2(3)], 'm--', ... % int axis 2 (broken magenta line)
    [0 view_axis1(1)], [0, view_axis1(2)], [0, view_axis1(3)], 'b.-', ... % view axis 1 (solid blue with point)
    [0 view_axis2(1)], [0, view_axis2(2)], [0, view_axis2(3)], 'g.-') % view axis 2 (solid green with point)
axis(0.4*[-2 2 -2 2 -2 2])
view(n)
xlabel('x')
ylabel('y')
zlabel('z')


% SELECT POINTS TO PLOT
dataset = length(x); % number of points to test

j = 0;
P = zeros(dataset, 3);
for ii = 1:dataset
    % INCLUDE POINTS WITHIN TOLERANCE
    if abs(n'*[x(ii); y(ii); z(ii)] - b) <= tol
        j = j + 1;
        P(j, :) = [x(ii), y(ii), z(ii)];
    end
end

% NO POINTS PROVIDED WITHIN TOLERANCE
if j == 0
    warning('There are no points within tolerance to generate map');
    return
end

P = P(1:j, :);

% TRANSFORM DATA TO VIEW FRAME
PX = zeros(j, 1);
PY = zeros(j, 1);

for ii = 1:j
    PX(ii) = P(ii, :)*view_axis1;
    PY(ii) = P(ii, :)*view_axis2;
end

% ADD COLOR IF 5TH OUTPUT ARGUMENT REQUIRED
if nargout == 5
    c = jet(j);
end
    
%     Example plot
%     figure(2)
%     scatter(PX, PY, 20, c)
%     xlabel(fprintf('[', num2str(view_axis1(1)), ',', num2str(view_axis1(2)), ',', num2str(view_axis1(3)), ']'))
%     ylabel(fprintf('[', num2str(view_axis2(1)), ',', num2str(view_axis2(2)), ',', num2str(view_axis2(3)), ']'))

% -------------------------------------------------------------------------
% END OF FUNCTION
% -------------------------------------------------------------------------
end
