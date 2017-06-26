% val = issame_system(sys1, sys2)
%
% checks whether two bertini_inputs represent the same system.  
% this function is likely not correct for elaborate systems, etc
% that is, this is a surface-level check.
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


function val = issame_system(sys1, sys2)

if isequal(sys1.variable_group,sys2.variable_group) &&...
	isequal(sys1.hom_variable_group,sys2.hom_variable_group) &&...
	isequal(sys1.constant,sys2.constant) &&...
	isequal(sys1.parameter,sys2.parameter) &&...
	isequal(sys1.subfunction,sys2.subfunction) &&...
	isequal(sys1.functions,sys2.functions)
	val = true;
else
	val = false;
end

end
