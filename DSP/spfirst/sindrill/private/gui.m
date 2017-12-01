function fig = gui()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
% This problem is solved by saving the output as a FIG-file.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.
% 
% NOTE: certain newer features in MATLAB may not have been saved in this
% M-file due to limitations of this format, which has been superseded by
% FIG-files.  Figures which have been annotated using the plot editor tools
% are incompatible with the M-file/MAT-file format, and should be saved as
% FIG-files.

load gui

MATLABVERSION = version;
MATLABVERSION = str2num(MATLABVERSION(1:3));

h0 = figure('Units','characters', ...
    'CloseRequestFcn','sindrill CloseRequestFcn', ...
    'Color',[0.8 0.8 0.8], ...
    'Colormap',mat0, ...
    'CreateFcn','sindrill SetFigureSize', ...
    'MenuBar','none', ...
    'Name','Reading Sinusoids Drill v2.00', ...
    'NumberTitle','off', ...
    'PaperPosition',[18 180 576 432], ...
    'PaperUnits','points', ...
    'Position',mat1, ...
    'Tag','SINDRILL');

if MATLABVERSION < 8.4
    set(h0,'DoubleBuffer','on');
end
set(h0,'ResizeFcn','sindrill ResizeFcn');

h1 = uimenu('Parent',h0, ...
	'Label','&Answers', ...
	'Tag','Answers');
h2 = uimenu('Parent',h1, ...
	'Label','A = 1', ...
	'Tag','AnswerAmplitude');
h2 = uimenu('Parent',h1, ...
	'Label','f_0 = 1000', ...
	'Tag','AnswerFrequency');
h2 = uimenu('Parent',h1, ...
	'Label','phi = 0', ...
	'Tag','AnswerPhase');
h1 = uimenu('Parent',h0, ...
   'Label','&Options', ...
   'Tag','OptionMenu');
h2 = uimenu('Parent',h1, ...
	'Label','&Level', ...
	'Tag','Level');
h3 = uimenu('Parent',h2, ...
	'Callback','sindrill SelectLevel', ...
	'Checked','on', ...
	'Label','&Novice', ...
	'Tag','Novice');
h3 = uimenu('Parent',h2, ...
	'Callback','sindrill SelectLevel', ...
	'Label','&Pro', ...
	'Tag','Pro');
h2 = uimenu('Parent',h1, ...
   'Callback','sindrill LineWidth', ...
   'Label','&Set Line Width...', ...
   'Separator','on', ...
   'Tag','SetLineWidth');
h3 = uimenu('Parent',h1, ...
   'Callback','sindrill Screenshot', ...
   'Label','&Take Screen-shot...', ...
   'Separator','on', ...
   'Tag','Screenshot');
h4 = uimenu('Parent',h1, ...
   'Callback','sindrill ShowMenu', ...
   'Label','&Show Menu', ...
   'Separator','on', ...
   'Tag','ShowMenu');
h1 = uimenu('Parent',h0, ...
	'Label','&Help', ...
	'Tag','Help');
h2 = uimenu('Parent',h1, ...
	'Callback','sindrill Help', ...
	'Label','&Contents', ...
	'Tag','HelpContents');
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'ListboxTop',0, ...
	'Position',mat4, ...
	'Style','frame', ...
	'Tag','Frame');
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[0.25 0.25 0.25], ...
	'FontWeight','bold', ...
	'ForegroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[39.99999999999999 30.76923076923077 46 1.538461538461539], ...
	'String','YOUR GUESS', ...
	'Style','text', ...
	'Tag','YourGuessLabel');
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[20 27.53846153846154 8.6 1.538461538461539], ...
	'String','A = ', ...
	'Style','text', ...
	'Tag','AmplitudeLabel');
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
   'Callback','sindrill(''ChangeValue'')', ...
   'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','center', ...
	'ListboxTop',0, ...
	'Position',mat5, ...
	'String','0', ...
	'Style','edit', ...
	'Tag','Amplitude', ...
	'UserData',1);
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[49.99999999999999 27.53846153846154 8.6 1.538461538461539], ...
	'String','f_0 = ', ...
	'Style','text', ...
	'Tag','FrequencyLabel');
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'Callback','sindrill(''ChangeValue'')', ...
    'BackgroundColor',[1 1 1], ...
	'HorizontalAlignment','center', ...
	'ListboxTop',0, ...
	'Position',mat6, ...
	'String','0', ...
	'Style','edit', ...
	'Tag','Frequency', ...
	'UserData',500);
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[80 27.53846153846154 8.6 1.538461538461539], ...
	'String','phi = ', ...
	'Style','text', ...
	'Tag','PhaseLabel');
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','sindrill ChangeValue', ...
	'HorizontalAlignment','center', ...
	'ListboxTop',0, ...
	'Position',mat7, ...
	'String','pi/2', ...
	'Style','edit', ...
	'Tag','Phase', ...
	'UserData',mat8);
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[59 26 23 1.461538461538462], ...
	'String','Period = Inf', ...
	'Style','text', ...
	'Tag','Period');
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','sindrill  NewQuiz', ...
	'ListboxTop',0, ...
	'Position',[56.40000000000001 22.69230769230769 19.6 2.230769230769231], ...
	'String','New Quiz', ...
	'Tag','NewQuiz');
h1 = uicontrol('Parent',h0, ...
	'Units','characters', ...
	'BackgroundColor',[0.7 0.7 0.7], ...
	'Callback','sindrill ShowGuess', ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[82.66666666666667 23.58974358974359 22 1.538461538461538], ...
	'String',' Show Guess', ...
	'Style','checkbox', ...
	'Tag','ShowGuess');
h1 = axes('Parent',h0, ...
	'Units','characters', ...
	'Box','on', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat9, ...
   'FontSize',18, ...
   'NextPlot','ReplaceChildren', ...
	'Position',mat10, ...
	'Tag','PlotAxis', ...
	'XGrid','on', ...
	'XLim',[0 0.001], ...
	'XLimMode','manual', ...
	'YGrid','on', ...
	'YLim',[-1 1], ...
	'YLimMode','manual', ...
	'ZGrid','on');
h2 = text('Parent',h1, ...
	'FontSize',18, ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.0004990176817288802 -1.429530201342282 17.32050807568877], ...
	'String','Time  (sec)', ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-6.286836935166994e-005 -0.02013422818791977 17.32050807568877], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',mat11, ...
	'Tag','Axes1Text2', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[1 1 0], ...
	'FontSize',18, ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat12, ...
	'String','0', ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom', ...
	'Visible','off');
set(get(h2,'Parent'),'Title',h2);
if nargout > 0, fig = h0; end
