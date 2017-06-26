% reldiff = relative_difference(left, right)
%
% compute the relative difference between two sets of numbers.
%
%
% copyright 2015 - 2017 Dani Brake
% University of Notre Dame
% Applied and Computational Mathematics and Statistics
% danielthebrake@gmail.com
%
% University of Wisconsin Eau Claire
% Department of Mathematics
% brakeda@uwec.edu
%
%
%     This file is part of brakelab.
%
%     brakelab is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     brakelab is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function reldiff = relative_difference(left, right)


reldiff = zeros(size(left));

indices_equal = (left-right) == 0;
indices_unequal = ~indices_equal;



reldiff(indices_unequal) = abs(left(indices_unequal) - right(indices_unequal)) ./ max(abs(left(indices_unequal)),abs(right(indices_unequal)));

end
