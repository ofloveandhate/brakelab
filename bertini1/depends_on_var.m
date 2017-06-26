% dep = depends_on_var(subfunc_index,var_index, var_deps, subfunc_deps)
%
% Bertini (TM) is a registered trademark
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

function dep = depends_on_var(subfunc_index,var_index, var_deps, subfunc_deps)

dependency_on_other_subfuncs = find(subfunc_deps(subfunc_index,:));
dep = 0;
if ~isempty(dependency_on_other_subfuncs)%recusive condition	
	for ii = 1:length(dependency_on_other_subfuncs)
		dep = dep + depends_on_var(dependency_on_other_subfuncs(ii),var_index,var_deps,subfunc_deps);
	end
end

dep = dep + var_deps(subfunc_index,var_index);
end
