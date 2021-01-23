function print_relation(rel, varargin)
% PRINT_RELATION(rel, varargin)
%   Print out the pairs in a relation, rel
%    additional inputs are cell array of strings listing the elements the
%    set is defined on 
%
%   Ex. 1 - relation R on set A, 
%       A_elements = {'alpha', 'beta', 'gamma', ... };
%       print_relation(R, A_elements)
% 
%   Ex. 2 - relation R on A x B
%       A_elements = {'alpha', 'beta', 'gamma', ...};
%       B_elements = {'uno', 'dos', 'tres', ...};
%       print_relation(R, A_elements, B_elements)
% 
% ************************************************************************

[r,c] = size(rel);
if nargin==1
    if r==c
        txtr = num2cell(char(96 + [1:r]'));
        txtc = txtr;
    else
        txtr = num2cell(char(96 + [1:r]'));
        txtc = num2cell(char(96 + [1:c]'));
    end
elseif nargin==2
    txtr = varargin{1};
    txtc = txtr;
elseif nargin==3
    txtr = varargin{1};
    txtc = varargin{2};
else
    error('Wrong number of inputs passed to function');
end


for i=1:size(rel,1)
    for j=1:size(rel,2)
        if rel(i,j) > 0
            fprintf(' (%s,%s),', txtr{i}, txtc{j});
        end
    end
end
end

