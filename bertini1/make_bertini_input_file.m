
% creates a blank ready-to-populate bertini1 input file
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

function make_bertini_input_file(filename)

if nargin==0
	filename='input';
end
	
fid = fopen(filename,'w');

fprintf(fid,'CONFIG\n\ntracktype: 0;\n\nEND;\n\nINPUT\n\nvariable_group ;\n\nfunction ;\n\n\nEND;');

fclose(fid);


end
