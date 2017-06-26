% this simply function is 
% from u/meibster at stackoverflow
%
% works for only a single integer.  testing arrays of numbers is unsupported.

function answer = isint(n)

if size(n) == [1 1]
    answer = isreal(n) && isnumeric(n) && round(n) == n;
else
    answer = false;
end


end