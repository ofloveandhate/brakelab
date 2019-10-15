% plots a line in 3-space with color
%
% sadly, there are hardcoded magic constants. 
% this code was written for the plot_paths part of bertini_real, which 
% itself requires bertini_real to be compiled in a special way.  good luck, and
% sorry.  
%
% danielle amethyst, 2018-2019
% code definitely inspired by a q/a on matlab central
% i needed it in my repo, so here it is.

function h = color_line(x,y,z,cdata)

num_colors = 64;
cmap = @parula;

h = plot3(x,y,z); % capture the line handle when you plot it
cd = cmap(num_colors); % take your pick (doc colormap)
cd = interp1(linspace(min(cdata),max(cdata),length(cd)),cd,cdata); % map color to y values
cd = uint8(cd'*255); % need a 4xN uint8 array
cd(4,:) = 255; % last column is transparency

drawnow
set(h.Edge,'ColorBinding','interpolated','ColorData',cd)


end