% render_into_file(basename, plot_params)
%
% a utility for saving plots to a file from matlab.
%
% intended for use with the 
%   - paramotopy,  (paramotopy.com)
%   - bertini_real,  (bertinireal.com, https://github.com/ofloveandhate/bertini_real)
%   - bertini_tropical, (https://github.com/ofloveandhate/bertini_tropical)
%   - bertini_real-chebfun (not available online yet [as of june 2017])
% suites of functions.
%
% if the argument is `gendef`, you will get the current default values.
%
%
% input:
%  plotmode -- a string which forms the basis of a filename
%  plot_params -- a structure with data members for setting up the save.
%      members:  format, a string for the format to save.  see the print
%                         help.
%                format_flag, again a string for the save driver to use.
%
%  outputs a file of the appropriate format to the current working dir.
%
%
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


function plot_params = render_into_file(varargin)

if ~isempty(varargin)
	if isa(varargin{1},'char')
		if strcmp(varargin,'gendef')
			plot_params = generate_defaults();
			return
		end
	end
end

if isempty(varargin)
	plot_params = generate_defaults();
	args = {};
elseif and(ischar(varargin{1} ), length(varargin)==1)
	
	plot_params.format = 'eps';
	plot_params.format_flag = 'psc2';
	
	plot_params.basename = varargin{1};
	
elseif isstruct(varargin{1})
	plot_params = varargin{1};
	
	if ~isfield(plot_params,'basename')
		error('incomplete plot_params.  add field ''basename''');
	end
	
	if ~isfield(plot_params,'resolution')
		error('incomplete plot_params.  add field ''resolution''');
	end
	
	args = varargin(2:end);
else
	plot_params = generate_defaults();
end

plot_params.fig = gcf;

PaperPositionCrap(plot_params);

evalme = get_command(plot_params, args);

% display(evalme);
eval(evalme);
display(sprintf('image saved as %s',get_final_name(plot_params)));
end



function evalme = get_command(plot_params, args)

final_name = get_final_name(plot_params);

% if strcmp(plot_params.format,'eps')
% 	args = [args, {'-fillpage'}];
% end

evalme = sprintf('print(plot_params.fig,''%s'',''-d%s'', ''-r%i''',final_name,plot_params.format_flag, plot_params.resolution);
for ii = 1:length(args)
    evalme = sprintf('%s,''%s''',evalme,args{ii});
end
evalme = sprintf('%s);',evalme);

end


function final_name = get_final_name(plot_params)

name_no_ext = get_name(plot_params);
final_name = sprintf('%s.%s',name_no_ext,plot_params.format);

end




function name_no_ext = get_name(plot_params)

if ~isfield(plot_params,'autoname')
	name_no_ext = increment_name(plot_params.basename);
else
	if plot_params.autoname
		name_no_ext = increment_name(plot_params.basename);
	else
		name_no_ext = plot_params.basename;
	end
end

end


% i truly hate this function, but matlab does weird sizing things,
% inconsistently with version, for eps and pdf prints.  
% please help me deal with this better, if you can.
function PaperPositionCrap(plot_params)

set(plot_params.fig,'PaperPositionMode','auto');

if isfield(plot_params.fig,'PaperSize')
	plot_params.fig.PaperSize = fig.PaperPosition(3:4);
end

end



function plot_params = generate_defaults()

plot_params.window = get(gcf,'Position');
plot_params.basename = default_filename();
plot_params.format = 'eps';
plot_params.format_flag = 'epsc2';
plot_params.autoname = true;
plot_params.resolution = 150;
end



function name = default_filename()

[~, name, ~] = fileparts(pwd);
name = name(~isspace(name));

end

