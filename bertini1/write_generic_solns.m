% [] = write_generic_solns(points, filename)
%
% write a set of column-points to a file, Bertini 1 style.
%
% write the points to a file.  the points are arranged so that the
% variables are the rows, and solutions are the columns
%
%
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

function write_generic_solns(points, filename)

fid = fopen(filename,'w');


if iscell(points)
	if ndims(points)==1
		num_pts = length(points);
		fprintf(fid,'%i\n\n',num_pts);
		for ii = 1:num_pts
			for jj = 1:size(points{ii},1)
				fprintf(fid,'%s\n',points{ii}{jj});
			end
			fprintf(fid,'\n');
		end
	else
		num_pts = size(points,2);
		fprintf(fid,'%i\n\n',num_pts);
		for ii = 1:num_pts
			for jj = 1:size(points,1)
				fprintf(fid,'%s\n',points{jj,ii});
			end
			fprintf(fid,'\n');
		end
	end
	
elseif isa(points,'sym')
	
	fprintf(fid,'%i\n\n',size(points,2));

	for ii = 1:size(points,2)
		for jj = 1:size(points,1)
			fprintf(fid,'%s %s\n',char(real(points(jj,ii))),char(imag(points(jj,ii))));
		end
		fprintf(fid,'\n');
	end
	
else


	fprintf(fid,'%i\n\n',size(points,2));

	for ii = 1:size(points,2)
		for jj = 1:size(points,1)
			fprintf(fid,'%16.15e %16.15e\n',real(points(jj,ii)),imag(points(jj,ii)));
		end
		fprintf(fid,'\n');
	end
end

fclose(fid);

end
