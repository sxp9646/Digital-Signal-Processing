function handlesout = initialize_pez(handles_main,filename)
%----------------------------------------------%
% Globals
%----------------------------------------------%
handles_main.LineWidth  = 2;
showgphhandles          = showgph;
%----------------------------------------------%
% Formula string
%----------------------------------------------%
if isunix
    formula_fn = 'clean';       % find possibilities with: listfonts
    formula_fs = 16;
else
    formula_fn = 'Helvetica';
    formula_fs = 9;
end
handles_main.formula_text = text('parent',handles_main.formula,'pos',[0.5 0.5],'interpreter','latex','str', ...
    '$$H(z)=1$$','horiz','center','units','norm','fontsize',formula_fs, ...
    'fontweight','bold','fontname',formula_fn); %'edgecolor','k'
%----------------------------------------------%
% Zoom In/Out buttons
%----------------------------------------------%
bkcol = [0.831373 0.815686 0.784314];
frcol = [0 0 0];
set(handles_main.axes_pzplot,'ActivePositionProperty','position');
apos = get(handles_main.axes_pzplot,'pos');

handles_main.zoomout = uicontrol('parent',handles_main.figure_pez, ...
    'fontunits','norm','fontsize',0.8,'fontweight','bold',...
    'units','norm','string','+','fontweight','bold','tooltipstring','Zoom Out', ...
    'backg',bkcol,'foreg',frcol, ...
    'pos',[apos(1) apos(2) 0.02 0.02], ...
    'callback','pezdemo(''zoombuttons_Callback'',gcbo,[],guidata(gcbo))');
handles_main.zoomin = uicontrol('parent',handles_main.figure_pez, ...
    'fontunits','norm','fontsize',0.8,'fontweight','bold',...
    'tooltipstring','Zoom In', ...
    'units','norm','string','-','backg',bkcol,'foreg',frcol, ...
    'pos',[apos(1) apos(2) 0.02 0.02], ...
    'callback','pezdemo(''zoombuttons_Callback'',gcbo,[],guidata(gcbo))');
set(handles_main.slider,'tooltipstring','Zoom','vis','off');
%----------------------------------------------%
% Update Show Plot colors
%----------------------------------------------%
set(showgphhandles,'color',get(handles_main.figure_pez,'color'));
set(findobj(showgphhandles,'style','text')','back',get(handles_main.figure_pez,'color'));
handles_showplot = guihandles(showgphhandles);

%------------------------------
handles_main.linemag     = line(0,0,'LineWidth',handles_main.LineWidth,'Parent',handles_main.axes_mag);
handles_main.linephase   = line(0,0,'LineWidth',handles_main.LineWidth,'Parent',handles_main.axes_phase);

handles_main.lineimpimg_cir = line (0,0,...
    'Parent',handles_main.axes_imp,...
    'LineStyle','None',...
    'Marker','o',...
    'Color',[1,0,1],...
    'LineWidth',handles_main.LineWidth,...
    'Visible', 'off');
handles_main.lineimpimg_lin = line (0,0,...
    'Parent',handles_main.axes_imp,...
    'LineStyle','-',...
    'Color',[1,0,1],...
    'LineWidth',handles_main.LineWidth,...
    'Visible', 'off');
handles_main.lineimp_cir = line (0,0,...
    'Parent',handles_main.axes_imp,...
    'LineStyle','None',...
    'Marker','o',...
    'Color',[0,0,1],...
    'LineWidth',handles_main.LineWidth,...
    'MarkerFaceColor',[0,0,1]);
handles_main.lineimp_lin = line (0,0,...
    'Parent',handles_main.axes_imp,...
    'LineStyle','-',...
    'LineWidth',handles_main.LineWidth,...
    'Color',[0,0,1]);
%----------------------------------------------%
%------- Plot Pole Zero plot background -------%
handles_main.linepezx   = line (zeros(1,length(-3:0.5:3)),-3:0.5:3,...
    'Parent',handles_main.axes_pzplot,...
    'Color',[0,0,0],...
    'LineStyle',':');
handles_main.linepezy   = line (-3:0.5:3,zeros(1,length(-3:0.5:3)),...
    'Parent',handles_main.axes_pzplot,...
    'Color',[0,0,0],...
    'LineStyle',':');
handles_main.linepezuc  = line (sin(0:2*pi/40:2*pi),cos(0:2*pi/40:2*pi),...
    'Parent',handles_main.axes_pzplot,...
    'Color',[0,0,0],...
    'LineStyle',':');
if handles_main.MATLABVER<8.4
    set([handles_main.linepezx,handles_main.linepezy,handles_main.linepezuc],'EraseMode', 'Xor','HitTest','off');
else
    set([handles_main.linepezx,handles_main.linepezy,handles_main.linepezuc],'PickableParts','none');
end

handles_main.pzpatch = patch([5,5,-5,-5],[5,-5,-5,5],[1,0.6,0.6],...
    'Visible','off',...
    'Parent', handles_main.axes_pzplot);
handles_main.ucpatch = patch(sin(0:2*pi/20:2*pi),cos(0:2*pi/20:2*pi), 'w',...
    'Visible','off',...
    'Parent', handles_main.axes_pzplot);

if handles_main.MATLABVER<8.4
    set([handles_main.pzpatch,handles_main.ucpatch],'EraseMode','background','HitTest','off');
else
    set([handles_main.pzpatch,handles_main.ucpatch],'PickableParts','none');
end
%----------------------------------------------%
handles_main.linepezpole = line ( 0,0,...
    'Parent',handles_main.axes_pzplot,...
    'Marker','x',...
    'MarkerSize',10,...
    'LineStyle','none',...
    'LineWidth',handles_main.LineWidth);
handles_main.linepezzero = line ( 0,0,...
    'Parent',handles_main.axes_pzplot,...
    'Marker','o',...
    'MarkerSize',8,...
    'LineStyle','none',...
    'LineWidth',handles_main.LineWidth);

handles_main.selectedpole = line ( 0,0,...
    'Parent',handles_main.axes_pzplot,...
    'Marker','x',...
    'MarkerSize',10,...
    'Color',[1,0,1],...
    'LineStyle','none',...
    'LineWidth',handles_main.LineWidth);
handles_main.selectedzero = line ( 0,0,...
    'Parent',handles_main.axes_pzplot,...
    'Marker','o',...
    'MarkerSize',8,...
    'Color',[1,0,1],...
    'LineStyle','none',...
    'LineWidth',handles_main.LineWidth);

if handles_main.MATLABVER<8.4
    set([handles_main.linepezpole,handles_main.linepezzero,handles_main.selectedpole,handles_main.selectedzero],'EraseMode','normal','HitTest','off');
else
    set([handles_main.linepezpole,handles_main.linepezzero,handles_main.selectedpole,handles_main.selectedzero],'PickableParts','none');
end

set(handles_main.linepezpole,'XData',[],'YData',[]);
set(handles_main.linepezzero,'XData',[],'YData',[]);

set(handles_main.selectedpole,'XData',[],'YData',[]);
set(handles_main.selectedzero,'XData',[],'YData',[]);
%----------------------------------------------%
% Showplot %
%----------------------------------------------%
handles_showplot.linemag     = line (0,0,'LineWidth',handles_main.LineWidth,'Parent',handles_showplot.axes_mag);
handles_showplot.linephase   = line (0,0,'LineWidth',handles_main.LineWidth,'Parent',handles_showplot.axes_phase);

handles_showplot.lineimpimg_cir = line (0,0,...
    'Parent',handles_showplot.axes_imp,...
    'LineStyle','None',...
    'Marker','o',...
    'Color',[1,0,1],...
    'LineWidth',handles_main.LineWidth,...
    'Visible','off');
handles_showplot.lineimpimg_lin = line (0,0,...
    'Parent',handles_showplot.axes_imp,...
    'LineStyle','-',...
    'Color',[1,0,1],...
    'LineWidth',handles_main.LineWidth,...
    'Visible','off');
handles_showplot.lineimp_cir = line (0,0,...
    'Parent',handles_showplot.axes_imp,...
    'LineStyle','None',...
    'Marker','o',...
    'Color',[0,0,1],...
    'LineWidth',handles_main.LineWidth,...
    'MarkerFaceColor',[0,0,1]);
handles_showplot.lineimp_lin = line (0,0,...
    'Parent',handles_showplot.axes_imp,...
    'LineStyle','-',...
    'LineWidth',handles_main.LineWidth,...
    'Color',[0,0,1]);

%------- Plot Pole Zero plot background -------%
handles_showplot.linepezx   = line (zeros(1,length(-3:0.5:3)),-3:0.5:3,...
    'Parent',handles_showplot.axes_pzplot,...
    'Color',[0,0,0],...
    'LineStyle',':');
handles_showplot.linepezy   = line (-3:0.5:3,zeros(1,length(-3:0.5:3)),...
    'Parent',handles_showplot.axes_pzplot,...
    'Color',[0,0,0],...
    'LineStyle',':');
handles_showplot.linepezuc  = line (sin(0:2*pi/20:2*pi),cos(0:2*pi/20:2*pi),...
    'Parent',handles_showplot.axes_pzplot,...
    'Color',[0,0,0],...
    'LineStyle',':');
handles_showplot.pzpatch = patch([5,5,-5,-5],[5,-5,-5,5],[1,0.6,0.6],...
    'Visible','off',...
    'Parent', handles_showplot.axes_pzplot);
handles_showplot.ucpatch = patch(sin(0:2*pi/20:2*pi),cos(0:2*pi/20:2*pi), 'w',...
    'Visible','off',...
    'Parent', handles_showplot.axes_pzplot);
%----------------------------------------------%
handles_showplot.linepezpole = line (0,0,...
    'Parent',handles_showplot.axes_pzplot,...
    'Marker','x',...
    'MarkerSize',10,...
    'LineStyle','none',...
    'LineWidth',handles_main.LineWidth);
handles_showplot.linepezzero = line (0,0,...
    'Parent',handles_showplot.axes_pzplot,...
    'Marker','o',...
    'MarkerSize',8,...
    'LineStyle','none',...
    'LineWidth',handles_main.LineWidth);
handles_showplot.selectedpole = line ( 0,0,...
    'Parent',handles_showplot.axes_pzplot,...
    'Marker','x',...
    'MarkerSize',10,...
    'Color',[1,0,1],...
    'LineStyle','none',...
    'LineWidth',handles_main.LineWidth);
handles_showplot.selectedzero = line ( 0,0,...
    'Parent',handles_showplot.axes_pzplot,...
    'Marker','o',...
    'MarkerSize',8,...
    'Color',[1,0,1],...
    'LineStyle','none',...
    'LineWidth',handles_main.LineWidth);

if handles_main.MATLABVER<8.4
    set([handles_showplot.linepezx,handles_showplot.linepezy,handles_showplot.linepezuc],'EraseMode', 'Xor','HitTest','off');
    set([handles_showplot.pzpatch,handles_showplot.ucpatch],'EraseMode', 'background','HitTest','off');
    set([handles_showplot.linepezpole,handles_showplot.linepezzero,handles_showplot.selectedpole,handles_showplot.selectedzero],'EraseMode', 'normal','HitTest','off');
else
    set([handles_showplot.linepezx,handles_showplot.linepezy,handles_showplot.linepezuc],'PickableParts','none');
    set([handles_showplot.pzpatch,handles_showplot.ucpatch],'PickableParts','none');
    set([handles_showplot.linepezpole,handles_showplot.linepezzero,handles_showplot.selectedpole,handles_showplot.selectedzero],'PickableParts','none');
end

set([handles_showplot.linepezpole,handles_showplot.linepezzero,handles_showplot.selectedpole, ...
    handles_showplot.selectedzero],'XData',[],'YData',[]);
%----------------------------------------------%
% Circular Motion line
%----------------------------------------------%
r = 0.9;
handles_main.linerc  = line(r*sin(0:2*pi/20:2*pi),r*cos(0:2*pi/20:2*pi),...
    'Parent',handles_main.axes_pzplot,...
    'Color',[1,0,1],'visible','off',...
    'LineStyle',':');
%----------------------------------------------%
% Radial Motion line
%----------------------------------------------%
r = 0.9;
handles_main.linerr  = line([0 1/sqrt(2)],[0 1/sqrt(2)],...
    'Parent',handles_main.axes_pzplot,...
    'Color',[1,0,1],'visible','off',...
    'LineStyle',':');

if handles_main.MATLABVER<8.4
    set([handles_main.linerc,handles_main.linerr],'EraseMode', 'Xor','HitTest','off');
else
    set([handles_main.linerc,handles_main.linerr],'PickableParts','none');
end
%----------------------------------------------%
% Set Ray Lines
%----------------------------------------------%
handles_main.lineray.main  = line([0 1/sqrt(2)],[0 1/sqrt(2)], ...
    'parent',handles_main.axes_pzplot,'tag','main_ray',...
    'ButtonDownFcn',[filename,'(''startdrag_RAY'',[],[],guidata(gcbo))'], ...
    'color','r','LineWidth',handles_main.LineWidth,'vis','on');
handles_main.lineray.mag   =  line([pi/4 pi/4],[-2 4],'parent',handles_main.axes_mag, ...
    'ButtonDownFcn',[filename,'(''startdrag_RAY'',[],[],guidata(gcbo))'], ...
    'color','r','LineWidth',handles_main.LineWidth,'vis','on','tag','mag_ray');
handles_main.lineray.phase = line([pi/4 pi/4],[-4 4],'parent',handles_main.axes_phase, ...
    'ButtonDownFcn',[filename,'(''startdrag_RAY'',[],[],guidata(gcbo))'], ...
    'color','r','LineWidth',handles_main.LineWidth,'vis','on','tag','phase_ray');
handles_main.lineray.text = text('interpreter','latex','string','\textbf{$$\frac{\pi}{4}$$}', ...
    'pos',[1.2/(sqrt(2)) 1.2/(sqrt(2))],'parent',handles_main.axes_pzplot,'color','b','horiz','center');
%----------------------------------------------%
handles_main.k          = 1;
handles_main.a          = [];
handles_main.b          = [];
handles_main.hz         = [];
handles_main.hn         = [];
handles_main.poleloc    = [];
handles_main.zeroloc    = [];
handles_main.showplot_h = handles_showplot;
handles_main.connection = [];
handles_main.connecttype= [];
handles_main.tempvalue  = [];
handles_main.repeatedadd= 'off';
handles_main.changed    = 'off';
handles_main.text       = [];

handles_main.pole0      = [];
handles_main.zero0      = [];

handles_main.textcolor = findobj(handles_main.figure_pez,'tag','realtxtcolor');

handles_main.outparm             = [];
handles_main.outparm.poleconnect = [];
handles_main.outparm.zeroconnect = [];
handles_main.outparm.type        = [];

handles_main.pezpb = [findall(0,'tag','pb_pp'), findall(0,'tag','pb_zz'), findall(0,'tag','pb_pz'),...
    findall(0,'tag','pb_-p'), findall(0,'tag','pb_-z'), findall(0,'tag','pb_-a')];

set(handles_main.figure_pez,'HandleVisibility','on', ...
    'WindowButtonMotionFcn',[filename,'(''WindowButtonMotion'',[],[],guidata(gcbo))'], ...
    'WindowButtonUpFcn',[filename, '(''resetclickpt'', [],[],guidata(gcbo))']);
handles_main.grp_zoomtag    = [findobj(handles_main.figure_pez,'Tag','zoom25');...
    findobj(handles_main.figure_pez,'Tag','zoom50');...
    findobj(handles_main.figure_pez,'Tag','zoom100');...
    findobj(handles_main.figure_pez,'Tag','zoom200')];
handles_main.grp_widthtag   = [findobj(handles_main.figure_pez,'Tag','width1');...
    findobj(handles_main.figure_pez,'Tag','width2');...
    findobj(handles_main.figure_pez,'Tag','width3');...
    findobj(handles_main.figure_pez,'Tag','width4')];
handles_main.grp_colortag   = [findobj(handles_main.figure_pez,'Tag','colorblack');...
    findobj(handles_main.figure_pez,'Tag','colorblue');...
    findobj(handles_main.figure_pez,'Tag','colorred');...
    findobj(handles_main.figure_pez,'Tag','colorgreen');...
    findobj(handles_main.figure_pez,'Tag','coloryellow')];
set(handles_main.figure_pez,'HandleVisibility','off');

handles_main = recal(handles_main, 'pole_to_poly');
handles_main = plot_gph(handles_main);

set(findall(0,'tag','tb_addconjugate'), 'Value', 1);
set(handles_main.pb_pz,'tooltipstring','Add pole(s) and zero(s)');
handlesout = handles_main;