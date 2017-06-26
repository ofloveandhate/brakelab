% generate random complex numbers which tend to stay away from the origin,
% and are in the interval from -1 to 1 (in complex space)
%
%
%
%
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

function v = rand_complex(m,n)

if nargin==0
	m = 1;
	n = 1;
elseif nargin==1
	n = m;
end

v = 2*rand(m,n)-1 + 1i*(2*rand(m,n)-1);

v = v./(abs(v).^2);
end
