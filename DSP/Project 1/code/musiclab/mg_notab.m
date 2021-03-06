function notetable()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.

load mg_notab                         

a = figure('Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'PointerShapeCData',mat1, ...
	'Position',[0 0 430 395]);
b = axes('Parent',a, ...
	'Box','on', ...
	'CameraUpVector',[0 1 0], ...
	'Color',[1 1 1], ...
	'ColorOrder',mat2, ...
	'Layer','top', ...
	'Visible','off', ...
	'XColor',[0 0 0], ...
	'XLim',[0 600], ...
	'XLimMode','manual', ...
	'YColor',[0 0 0], ...
	'YDir','reverse', ...
	'YLim',[0 560], ...
	'YLimMode','manual', ...
	'ZColor',[0 0 0]);
c = image('Parent',b, ...
	'CData',mat3, ...
	'XData',[1 1024], ...
	'YData',[1 768]);
c = text('Parent',b, ...
	'Color',[0 0 0], ...
	'HandleVisibility','callback', ...
	'HorizontalAlignment','center', ...
	'Position',[299.099 -12.2118 0], ...
	'VerticalAlignment','bottom');
set(get(c,'Parent'),'Title',c);
