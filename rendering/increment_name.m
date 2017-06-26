%this function generates a filename, based on highest number already in
%directory.  
%
%could potentially be used elsewhere for autogeneration of
%names.
%
%
% copyright 2013 - 2017 Dani Brake
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


function newname = increment_name(basename)

file_list = dir([basename '_*']);
if ~isempty(file_list)
	filenumbers = zeros(1,length(file_list));
	for ii = 1:length(file_list)
		filenumbers(ii) = extract_number(file_list(ii).name, basename);
	end
else
	filenumbers = 0;
end

newname = sprintf('%s_%i',basename,max(filenumbers)+1);


end

function n = extract_number(name, basename)
	
if has_extension(name)
	r = [length(basename)+2 length(name)-4];
else
	r = [length(basename)+2 length(name)];
end
n = str2double(name(r(1):r(2)));

if isnan(n)
	n = -1;
end


end


function result =  has_extension(name)

if strcmp((name(end-3)), '.')
	result = true;
else
	result = false;
end

end

