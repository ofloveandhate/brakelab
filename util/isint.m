% from u/meibster at stackoverflow

function answer = isint(n)

if size(n) == [1 1]
    answer = isreal(n) && isnumeric(n) && round(n) == n;
else
    answer = false;
end


end