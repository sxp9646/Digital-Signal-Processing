function screenshotdlg(action)
% SCREENSHOTDLG Screen-shot dialog box.
%  w = SCREENSHOTDLG creates a modal dialog box that enables screen-shot
%  capture.

% Greg Krudysz 12/1/2015

if nargin == 1 & isstr(action)
    %------------------------%
    switch action
        case 'SetPath'
            %------------------------%
            hDir = findobj(gcbf,'tag','Path');
            dirStr = uigetdir;
            if dirStr
                set(hDir,'string',dirStr);
            end
            %------------------------%
        case 'OK'
            %------------------------%
            set(gcbo,'string','Please Wait ...','ForegroundColor',[0 0 1]);
            
            hGUI = get(gcbo,'Userdata');
            formats = {'png','pdf'};
            
            %--- Get resolution (dpi)
            hRez = findobj(gcbf,'tag','Resolution');
            rezArr = get(hRez,'string');
            rezIdx = get(hRez,'value');
            rez =  num2str(rezArr{rezIdx});
            
            %--- Get path
            path = get(findobj(gcbf,'tag','Path'),'string');
            
            %--- Get file name
            fname = get(findobj(gcbf,'tag','Name'),'string');
            
            figpos = getpixelposition(hGUI);
            resolution = get(0,'ScreenPixelsPerInch');
            set(hGUI,'PaperPositionMode','auto');
            set(hGUI,'InvertHardcopy','off','paperunits','inches','papersize',figpos(3:4)/resolution,'paperposition',[0 0 figpos(3:4)/resolution]);
            
            for n=1:length(formats)
                name=[fname '.' formats{n}];
                print(hGUI,fullfile(path,name),['-d' formats{n}],['-r',rez],'-painters')  % opengl | zbuffer
            end
            set(gcbf,'UserData',1);
            %------------------------%
        case 'Cancel'
            %------------------------%
            set(gcbf,'UserData',1);
            %------------------------%
        otherwise
            error('Illegal action');
    end
else
    hGUI = action;
    %------------------------%
    % Setup Dialog
    %------------------------%
    OldUnits = get(0, 'Units');
    set(0, 'Units','pixels');
    ScreenSize = get(0,'ScreenSize');
    set(0, 'Units', OldUnits);
    DlgPos = [0.35*ScreenSize(3), 0.325*ScreenSize(4), 0.3*ScreenSize(3), 0.35*ScreenSize(4)];
    dlg_color = get(gcbf,'color');
    hDlg = dialog( ...
        'Color',dlg_color, ...
        'Name','Screen-Shot', ...
        'CloseRequestFcn','screenshotdlg Cancel', ...
        'Position',DlgPos, ...
        'UserData',0);
    %------------------------%
    % Setup Buttons
    %------------------------%
    uicontrol('Parent',hDlg, ...
        'Units','normalized', ...
        'FontWeight','Bold', ...
        'Position',[0.05 0.8 0.15 0.1], ...
        'String', 'File:',...
        'Style','text');
    uicontrol('Parent',hDlg, ...
        'Units','normalized', ...
        'FontWeight','Bold', ...
        'Position',[0.25 0.8 0.7 0.1], ...
        'String',get(hGUI,'Tag'), ...
        'Style','edit',...
        'Tag','Name');
    
    uicontrol('Parent',hDlg, ...
        'Units','normalized', ...
        'FontWeight','Bold', ...
        'Position',[0.05 0.6 0.15 0.1], ...
        'String', 'Path:',...
        'Style','text');
    uicontrol('Parent',hDlg, ...
        'Units','normalized', ...
        'Callback','screenshotdlg SetPath', ...
        'FontWeight','Bold', ...
        'Position',[0.25 0.6 0.7 0.1], ...
        'String',pwd, ...
        'Style','pushbutton',...
        'Tag','Path');
    
    uicontrol('Parent',hDlg, ...
        'Units','normalized', ...
        'FontWeight','Bold', ...
        'Position',[0.05 0.4 0.15 0.1], ...
        'String', 'Resolution (dpi):',...
        'Style','text');
    uicontrol('Parent',hDlg, ...
        'Units','normalized', ...
        'FontWeight','Bold', ...
        'Position',[0.25 0.4 0.2 0.1], ...
        'String', {'1200','600'},...
        'Style','popup', ...
        'Tag','Resolution');
    
    uicontrol('Parent',hDlg, ...
        'Units','normalized', ...
        'Callback','screenshotdlg Cancel', ...
        'FontWeight','Bold', ...
        'Position',[0.2 0.04 0.25 0.1], ...
        'String','Cancel', ...
        'Style','pushbutton');
    uicontrol('Parent',hDlg, ...
        'Units','normalized', ...
        'Callback','screenshotdlg OK', ...
        'FontWeight','Bold', ...
        'Position',[0.55 0.04 0.25 0.1], ...
        'String','OK', ...
        'Style','pushbutton', ...
        'Userdata',hGUI);
    %------------------------%
    % Wait for user to hit OK and return result
    waitfor(hDlg,'UserData');
    delete(hDlg);
end