function varargout = negotiation_selection30(varargin)
% NEGOTIATION_SELECTION30 MATLAB code for negotiation_selection30.fig
%      NEGOTIATION_SELECTION30, by itself, creates a new NEGOTIATION_SELECTION30 or raises the existing
%      singleton*.
%
%      H = NEGOTIATION_SELECTION30 returns the handle to a new NEGOTIATION_SELECTION30 or the handle to
%      the existing singleton*.
%
%      NEGOTIATION_SELECTION30('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEGOTIATION_SELECTION30.M with the given input arguments.
%
%      NEGOTIATION_SELECTION30('Property','Value',...) creates a new NEGOTIATION_SELECTION30 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before negotiation_selection30_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to negotiation_selection30_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help negotiation_selection30

% Last Modified by GUIDE v2.5 21-Jun-2019 19:16:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @negotiation_selection30_OpeningFcn, ...
                   'gui_OutputFcn',  @negotiation_selection30_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end


% --- Executes just before negotiation_selection30 is made visible.
function negotiation_selection30_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to negotiation_selection30 (see VARARGIN)
set(gcf,'Position',get(0,'ScreenSize'))

timePeriod = 0.01;
t_s = timer('timerFcn',{@timerCallbakcFcn_s, handles}, 'ExecutionMode','fixedDelay', 'Period',timePeriod, 'StartDelay',0.6);
t_g = timer('timerFcn',{@timerCallbakcFcn_g, handles}, 'ExecutionMode','fixedDelay', 'Period',timePeriod, 'StartDelay',0.6);

% Choose default command line output for negotiation_selection30
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

load negotiation_selection30
number = length(data);
%?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ読み搾ｿｽ?ｿｽ?ｿｽ
init = game_init(data(number).game);

%?ｿｽL?ｿｽ[?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾆゑｿｽ?ｿｽﾌコ?ｿｽ[?ｿｽ?ｿｽ?ｿｽo?ｿｽb?ｿｽN?ｿｽﾖ撰ｿｽ?ｿｽ?ｿｽ?ｿｽw?ｿｽ?ｿｽ
set(handles.figure1,'KeyPressFcn',{@figure1_KeyPressFcn,handles});
%?ｿｽ?ｿｽ?ｿｽ[?ｿｽ^?ｿｽ[?ｿｽﾌ擾ｿｽ?ｿｽ?ｿｽ?ｿｽﾝ抵ｿｽ
initial_position = 50;
position_back = get(handles.back,'Position');
position_fore = position_back;
position_fore(4) = position_back(4)*(initial_position/100);
if(position_fore(4) == 0)
    setappdata(handles.figure1,'height_fore',position_fore(4))
    position_fore(4) = 0.00001;
else
    setappdata(handles.figure1,'height_fore',position_fore(4))
end
set(handles.fore,'Position',position_fore)
set(handles.text10,'String',initial_position)
setappdata(handles.figure1,'height_back',position_back(4))

%eyetracker?ｿｽﾖ連
if(init.eyetracker_flag == 1)
    addpath(genpath('TobiiPro.SDK.Matlab_1.5.0.28'))
    Tobii = EyeTrackingOperations();
    eyetracker_address = 'tet-tcp://127.0.0.1';
    eyetracker = Tobii.get_eyetracker(eyetracker_address);
end

%main
times = init.times;
data(number).answer = zeros(times,7);
%1?ｿｽ?ｿｽ?ｿｽselection?ｿｽﾌ鯉ｿｽ?ｿｽﾊ、2?ｿｽ?ｿｽﾚ被験?ｿｽﾒの具ｿｽ?ｿｽz?ｿｽﾌ鯉ｿｽ?ｿｽﾊ、3?ｿｽ?ｿｽﾚ托ｿｽ?ｿｽ?ｿｽﾌ具ｿｽ?ｿｽz?ｿｽﾌ鯉ｿｽ?ｿｽﾊ、4?ｿｽ?ｿｽ?ｿｽselection?ｿｽ?ｿｽrectiontime 5?ｿｽ?ｿｽ?ｿｽselection?ｿｽ?ｿｽ?ｿｽﾔ切ゑｿｽﾌ趣ｿｽ1
%6?ｿｽ?ｿｽ?ｿｽgame?ｿｽ?ｿｽrectiontime 7?ｿｽ?ｿｽ?ｿｽgame?ｿｽ?ｿｽ?ｿｽﾔ切ゑｿｽﾌ趣ｿｽ1
game_get = 0;
remaining_times = times;

set(handles.figure1,'Visible','on')
set(handles.pushbutton3,'Visible','off')
set(handles.pushbutton4,'Visible','off')
set(handles.pushbutton5,'Visible','off')
set(handles.pushbutton6,'Visible','off')
set(handles.pushbutton7,'Visible','off')
set(handles.pushbutton8,'Visible','off')
set(handles.pushbutton9,'Visible','off')
set(handles.pushbutton10,'Visible','off')
set(handles.pushbutton11,'Visible','off')
set(handles.pushbutton12,'Visible','off')
set(handles.pushbutton13,'Visible','off')
set(handles.pushbutton14,'Visible','off')
set(handles.pushbutton15,'Visible','off')
set(handles.pushbutton16,'Visible','off')
set(handles.pushbutton17,'Visible','off')
set(handles.pushbutton18,'Visible','off')
set(handles.pushbutton19,'Visible','off')
set(handles.pushbutton20,'Visible','off')
set(handles.pushbutton21,'Visible','off')
set(handles.pushbutton22,'Visible','off')
set(handles.pushbutton23,'Visible','off')
set(handles.pushbutton24,'Visible','off')
set(handles.pushbutton25,'Visible','off')
set(handles.pushbutton26,'Visible','off')
set(handles.pushbutton27,'Visible','off')
set(handles.pushbutton28,'Visible','off')
set(handles.pushbutton29,'Visible','off')
set(handles.pushbutton30,'Visible','off')
set(handles.pushbutton31,'Visible','off')
set(handles.pushbutton32,'Visible','off')
set(handles.text1,'Visible','off')
set(handles.text2,'Visible','off')
set(handles.text3,'Visible','off')
set(handles.text4,'Visible','off')
set(handles.text5,'Visible','off')
set(handles.text6,'Visible','off')
set(handles.text10,'Visible','off')
set(handles.text24,'Visible','off')
set(handles.text25,'Visible','off')
set(handles.text26,'Visible','off')
set(handles.text27,'Visible','off')
set(handles.text28,'Visible','off')
set(handles.text29,'Visible','off')
set(handles.text30,'Visible','off')
set(handles.text31,'Visible','on')
set(handles.text21,'Visible','off')
set(handles.text22,'Visible','off')
set(handles.text23,'Visible','off')
set(handles.fore,'Visible','off')
set(handles.back,'Visible','off')
set(handles.axes1,'Visible','off')
set(handles.text36,'Visible','off')
set(handles.text37,'Visible','off')
set(handles.text38,'Visible','off')
set(handles.text39,'Visible','off')
set(handles.text41,'Visible','off')
pause(5)

for i = 1:times
    %selection part
    setappdata(handles.figure1,'selection',0)
    setappdata(handles.figure1,'flag',0)
    setappdata(handles.figure1,'timeoff_s',0)
    setappdata(handles.figure1,'timeoff_g',0)
    setappdata(handles.figure1,'time_sl',0)
    setappdata(handles.figure1,'time_gl',0)
    %?ｿｽK?ｿｽv?ｿｽﾈコ?ｿｽ?ｿｽ?ｿｽ|?ｿｽ[?ｿｽl?ｿｽ?ｿｽ?ｿｽg?ｿｽﾌセ?ｿｽb?ｿｽg
    set(handles.figure1,'Visible','on')
    set(handles.pushbutton3,'cdata',init.sample(init.datasets(1)).picture,'Visible','on')
    set(handles.pushbutton4,'cdata',init.sample(init.datasets(2)).picture,'Visible','on')
    set(handles.pushbutton5,'cdata',init.sample(init.datasets(3)).picture,'Visible','on')
    set(handles.pushbutton6,'cdata',init.sample(init.datasets(4)).picture,'Visible','on')
    set(handles.pushbutton7,'cdata',init.sample(init.datasets(5)).picture,'Visible','on')
    set(handles.pushbutton8,'cdata',init.sample(init.datasets(6)).picture,'Visible','on')
    set(handles.pushbutton9,'cdata',init.sample(init.datasets(7)).picture,'Visible','on')
    set(handles.pushbutton10,'cdata',init.sample(init.datasets(8)).picture,'Visible','on')
    set(handles.pushbutton11,'cdata',init.sample(init.datasets(9)).picture,'Visible','on')
    set(handles.pushbutton12,'cdata',init.sample(init.datasets(10)).picture,'Visible','on')
    set(handles.pushbutton13,'cdata',init.sample(init.datasets(11)).picture,'Visible','on')
    set(handles.pushbutton14,'cdata',init.sample(init.datasets(12)).picture,'Visible','on')
    set(handles.pushbutton15,'cdata',init.sample(init.datasets(13)).picture,'Visible','on')
    set(handles.pushbutton16,'cdata',init.sample(init.datasets(14)).picture,'Visible','on')
    set(handles.pushbutton17,'cdata',init.sample(init.datasets(15)).picture,'Visible','on')
    set(handles.pushbutton18,'cdata',init.sample(init.datasets(16)).picture,'Visible','on')
    set(handles.pushbutton19,'cdata',init.sample(init.datasets(17)).picture,'Visible','on')
    set(handles.pushbutton20,'cdata',init.sample(init.datasets(18)).picture,'Visible','on')
    set(handles.pushbutton21,'cdata',init.sample(init.datasets(19)).picture,'Visible','on')
    set(handles.pushbutton22,'cdata',init.sample(init.datasets(20)).picture,'Visible','on')
    set(handles.pushbutton23,'cdata',init.sample(init.datasets(21)).picture,'Visible','on')
    set(handles.pushbutton24,'cdata',init.sample(init.datasets(22)).picture,'Visible','on')
    set(handles.pushbutton25,'cdata',init.sample(init.datasets(23)).picture,'Visible','on')
    set(handles.pushbutton26,'cdata',init.sample(init.datasets(24)).picture,'Visible','on')
    set(handles.pushbutton27,'cdata',init.sample(init.datasets(25)).picture,'Visible','on')
    set(handles.pushbutton28,'cdata',init.sample(init.datasets(26)).picture,'Visible','on')
    set(handles.pushbutton29,'cdata',init.sample(init.datasets(27)).picture,'Visible','on')
    set(handles.pushbutton30,'cdata',init.sample(init.datasets(28)).picture,'Visible','on')
    set(handles.pushbutton31,'cdata',init.sample(init.datasets(29)).picture,'Visible','on')
    set(handles.pushbutton32,'cdata',init.sample(init.datasets(30)).picture,'Visible','on')
    set(handles.text1,'Visible','off')
    set(handles.text2,'Visible','on')
    set(handles.text3,'Visible','off')
    set(handles.text4,'Visible','off')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    set(handles.text10,'Visible','off')
    set(handles.text24,'Visible','off')
    set(handles.text25,'Visible','off')
    set(handles.text26,'Visible','off')
    set(handles.text27,'Visible','off')
    set(handles.text28,'Visible','off')
    set(handles.text29,'Visible','off')
    set(handles.text30,'Visible','off')
    set(handles.text31,'Visible','off')
    set(handles.text21,'Visible','on')
    set(handles.text22,'String',init.limit15,'Visible','on')
    set(handles.text23,'Visible','on')
    set(handles.text36,'Visible','on')
    set(handles.text37,'Visible','on')
    set(handles.text38,'Visible','on')
    set(handles.text39,'Visible','on')
    set(handles.text41,'Visible','on')
    set(handles.fore,'Visible','off')
    set(handles.back,'Visible','off')
    set(handles.axes1,'Xtick',[],'Ytick',[],'Visible','off')
    
    if(init.eyetracker_flag == 1)
        eyetracker.get_gaze_data();
    end
    
    %?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ選?ｿｽ?ｿｽ
    sound(init.snd)
    start(t_s)
    
    remaining_times = remaining_times - 1;
    set(handles.text36,'string',remaining_times)
    
    while(1)
        selection = getappdata(handles.figure1,'selection');
        timeoff_s = getappdata(handles.figure1,'timeoff_s');
        if(selection == 0)
            pause(0.01)
            continue
        else
            data(number).answer(i,1) = selection;
            data(number).answer(i,4) = init.limit15 - getappdata(handles.figure1,'time_sl');
            data(number).answer(i,5) = timeoff_s;
            break
        end
    end
    stop(t_s)
    
    if(init.eyetracker_flag == 1)
        gaze_data = eyetracker.get_gaze_data();
                for h = (1:length(gaze_data))
                     gaze_data_n = gaze_data(h);
                     %data(number).eyedata_selection(i,h) = gaze_data(h);
                     
                     %time
                     data(number).eyedata_selection(i).SystemRequestTimeStamp(h) = gaze_data_n.SystemTimeStamp;
                     data(number).eyedata_selection(i).DeviceTimeStamp(h) = gaze_data_n.DeviceTimeStamp;
                     %left eye
                     data(number).eyedata_selection(i).L_GazePoint_OnDisplayArea(1:2,h) = gaze_data_n.LeftEye.GazePoint.OnDisplayArea;
                     data(number).eyedata_selection(i).L_GazePoint_InUserCoordinateSystem(1:3,h) = gaze_data_n.LeftEye.GazePoint.InUserCoordinateSystem;
                     data(number).eyedata_selection(i).L_GazePoint_Validity(h) = {gaze_data_n.LeftEye.GazePoint.Validity};
                     data(number).eyedata_selection(i).L_GazeOrigin_InUserCoordinateSystem(1:3,h) = gaze_data_n.LeftEye.GazeOrigin.InUserCoordinateSystem;
                     data(number).eyedata_selection(i).L_GazeOrigin_InTrackBoxCoordinateSystem(1:3,h) = gaze_data_n.LeftEye.GazeOrigin.InTrackBoxCoordinateSystem;
                     data(number).eyedata_selection(i).L_GazeOrigin_Validity(h) = {gaze_data_n.LeftEye.GazeOrigin.Validity};
                     data(number).eyedata_selection(i).L_Pupil.Diameter(h) = gaze_data_n.LeftEye.Pupil.Diameter;
                     data(number).eyedata_selection(i).L_Pupil.Validity(h) = {gaze_data_n.LeftEye.Pupil.Validity};
                     %right eye
                     data(number).eyedata_selection(i).R_GazePoint_OnDisplayArea(1:2,h) = gaze_data_n.RightEye.GazePoint.OnDisplayArea;
                     data(number).eyedata_selection(i).R_GazePoint_InUserCoordinateSystem(1:3,h) = gaze_data_n.RightEye.GazePoint.InUserCoordinateSystem;
                     data(number).eyedata_selection(i).R_GazePoint_Validity(h) = {gaze_data_n.RightEye.GazePoint.Validity};
                     data(number).eyedata_selection(i).R_GazeOrigin_InUserCoordinateSystem(1:3,h) = gaze_data_n.RightEye.GazeOrigin.InUserCoordinateSystem;
                     data(number).eyedata_selection(i).R_GazeOrigin_InTrackBoxCoordinateSystem(1:3,h) = gaze_data_n.RightEye.GazeOrigin.InTrackBoxCoordinateSystem;
                     data(number).eyedata_selection(i).R_GazeOrigin_Validity(h) = {gaze_data_n.RightEye.GazeOrigin.Validity};
                     data(number).eyedata_selection(i).R_Pupil.Diameter(h) = gaze_data_n.RightEye.Pupil.Diameter;
                     data(number).eyedata_selection(i).R_Pupil.Validity(h) = {gaze_data_n.RightEye.Pupil.Validity};
                     
                end
                eyetracker.stop_gaze_data()
                clear eyetracker.get_gaze_data()
                clear gaze_data
                clear gaze_data_n
    end
    
    %game?ｿｽ?ｿｽﾊへの遷?ｿｽ?ｿｽ
    set(handles.pushbutton3,'Visible','off')
    set(handles.pushbutton4,'Visible','off')
    set(handles.pushbutton5,'Visible','off')
    set(handles.pushbutton6,'Visible','off')
    set(handles.pushbutton7,'Visible','off')
    set(handles.pushbutton8,'Visible','off')
    set(handles.pushbutton9,'Visible','off')
    set(handles.pushbutton10,'Visible','off')
    set(handles.pushbutton11,'Visible','off')
    set(handles.pushbutton12,'Visible','off')
    set(handles.pushbutton13,'Visible','off')
    set(handles.pushbutton14,'Visible','off')
    set(handles.pushbutton15,'Visible','off')
    set(handles.pushbutton16,'Visible','off')
    set(handles.pushbutton17,'Visible','off')
    set(handles.pushbutton18,'Visible','off')
    set(handles.pushbutton19,'Visible','off')
    set(handles.pushbutton20,'Visible','off')
    set(handles.pushbutton21,'Visible','off')
    set(handles.pushbutton22,'Visible','off')
    set(handles.pushbutton23,'Visible','off')
    set(handles.pushbutton24,'Visible','off')
    set(handles.pushbutton25,'Visible','off')
    set(handles.pushbutton26,'Visible','off')
    set(handles.pushbutton27,'Visible','off')
    set(handles.pushbutton28,'Visible','off')
    set(handles.pushbutton29,'Visible','off')
    set(handles.pushbutton30,'Visible','off')
    set(handles.pushbutton31,'Visible','off')
    set(handles.pushbutton32,'Visible','off')
    set(handles.text1,'Visible','on')
    set(handles.text2,'Visible','off')
    set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','on')
    set(handles.text10,'Visible','on')
    set(handles.text22,'String',init.limit,'Visible','on')
    set(handles.fore,'Visible','on')
    set(handles.back,'Visible','on')
    axes(handles.axes1);
    imshow(init.sample(init.datasets(selection)).picture);
    set(handles.axes1,'Xtick',[],'Ytick',[],'Visible','on')
    
    if(init.eyetracker_flag == 1)
        eyetracker.get_gaze_data();
    end
    
    %?ｿｽ甯ｱ?ｿｽﾒの提示具ｿｽ?ｿｽz?ｿｽ?ｿｽ?ｿｽ?ｿｽ
    sound(init.snd)
    start(t_g)
    while(1)
        timeoff_g = getappdata(handles.figure1,'timeoff_g');
        flag = getappdata(handles.figure1,'flag');
        if(flag == 0)
            pause(0.01)
            continue
        else
            data(number).answer(i,2) = str2num(get(handles.text10,'String'));
            data(number).answer(i,6) = init.limit - getappdata(handles.figure1,'time_gl');
            data(number).answer(i,7) = timeoff_g;
            break
        end
    end
    stop(t_g)
    
    if(init.eyetracker_flag == 1)
        gaze_data = eyetracker.get_gaze_data();
        for j = (1:length(gaze_data))
           gaze_data_n = gaze_data(j);
                     %time
                     data(number).eyedata_game(i).SystemRequestTimeStamp(j) = gaze_data_n.SystemTimeStamp;
                     data(number).eyedata_game(i).DeviceTimeStamp(j) = gaze_data_n.DeviceTimeStamp;
                     %left eye
                     data(number).eyedata_game(i).L_GazePoint_OnDisplayArea(1:2,j) = gaze_data_n.LeftEye.GazePoint.OnDisplayArea;
                     data(number).eyedata_game(i).L_GazePoint_InUserCoordinateSystem(1:3,j) = gaze_data_n.LeftEye.GazePoint.InUserCoordinateSystem;
                     data(number).eyedata_game(i).L_GazePoint_Validity(j) = {gaze_data_n.LeftEye.GazePoint.Validity};
                     data(number).eyedata_game(i).L_GazeOrigin_InUserCoordinateSystem(1:3,j) = gaze_data_n.LeftEye.GazeOrigin.InUserCoordinateSystem;
                     data(number).eyedata_game(i).L_GazeOrigin_InTrackBoxCoordinateSystem(1:3,j) = gaze_data_n.LeftEye.GazeOrigin.InTrackBoxCoordinateSystem;
                     data(number).eyedata_game(i).L_GazeOrigin_Validity(j) = {gaze_data_n.LeftEye.GazeOrigin.Validity};
                     data(number).eyedata_game(i).L_Pupil.Diameter(j) = gaze_data_n.LeftEye.Pupil.Diameter;
                     data(number).eyedata_game(i).L_Pupil.Validity(j) = {gaze_data_n.LeftEye.Pupil.Validity};
                     %rigjt eye
                     data(number).eyedata_game(i).R_GazePoint_OnDisplayArea(1:2,j) = gaze_data_n.RightEye.GazePoint.OnDisplayArea;
                     data(number).eyedata_game(i).R_GazePoint_InUserCoordinateSystem(1:3,j) = gaze_data_n.RightEye.GazePoint.InUserCoordinateSystem;
                     data(number).eyedata_game(i).R_GazePoint_Validity(j) = {gaze_data_n.RightEye.GazePoint.Validity};
                     data(number).eyedata_game(i).R_GazeOrigin_InUserCoordinateSystem(1:3,j) = gaze_data_n.RightEye.GazeOrigin.InUserCoordinateSystem;
                     data(number).eyedata_game(i).R_GazeOrigin_InTrackBoxCoordinateSystem(1:3,j) = gaze_data_n.RightEye.GazeOrigin.InTrackBoxCoordinateSystem;
                     data(number).eyedata_game(i).R_GazeOrigin_Validity(j) = {gaze_data_n.RightEye.GazeOrigin.Validity};
                     data(number).eyedata_game(i).R_Pupil.Diameter(j) = gaze_data_n.RightEye.Pupil.Diameter;
                     data(number).eyedata_game(i).R_Pupil.Validity(j) = {gaze_data_n.RightEye.Pupil.Validity};
                     
        end
        eyetracker.stop_gaze_data()
        clear eyetracker.get_gaze_data()
        clear gaze_data
        clear gaze_data_n
    end
    
    pause(1)
    
    %?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ提示具ｿｽ?ｿｽz?ｿｽ?ｿｽ?ｿｽ?ｿｽ
    opp_pre = rand;
    for j = 1:11
        if(opp_pre < sum(init.sample(init.datasets(selection)).prob_negotiation(1,1:j)))&&(data(number).answer(i,3) == 0)
            npc_want = randi([10*(j-1)-5,10*(j-1)+5],1);
            if npc_want > 100
                npc_want = 100;
            end
            if npc_want < 0
                npc_want = 0;
            end
            data(number).answer(i,3) = npc_want;
        end
    end
    
    %?ｿｽ?ｿｽ?ｿｽﾊの表?ｿｽ?ｿｽ
    goukei = sum(data(number).answer(i,2:3));
    set(handles.text1,'Visible','off')
    set(handles.text6,'Visible','off')
    set(handles.text10,'Visible','off')
    set(handles.text24,'Visible','on')
    set(handles.text25,'String',data(number).answer(i,2),'Visible','on')
    set(handles.text26,'Visible','on')
    set(handles.text27,'Visible','on')
    set(handles.text28,'String',data(number).answer(i,3),'Visible','on')
    set(handles.text29,'Visible','on')
    if(goukei <= 100)
        set(handles.text30,'String','交渉成功','Visible','on')
        game_get = game_get +  data(number).answer(i,2);
        set(handles.text38,'String',game_get)
    else
        set(handles.text30,'String','交渉失敗','Visible','on')
    end
    pause(5)
    
    axes(handles.axes1)
    imshow(imread('back.png'));
end
data(number).answer(i,8) = game_get;
data(number).init = init;
save('negotiation_selection30','data')
close('negotiation_selection30')
end

% UIWAIT makes negotiation_selection30 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function figure1_KeyPressFcn(hObject, eventdata, handles)
%?ｿｽ?ｿｽ?ｿｽﾝの設抵ｿｽ
scale_unit = 1;
%?ｿｽﾇみ搾ｿｽ?ｿｽ?ｿｽ
height_back = getappdata(handles.figure1,'height_back');
height_fore = getappdata(handles.figure1,'height_fore');
%?ｿｽ?ｿｽ?ｿｽﾝのバ?ｿｽ[?ｿｽ?ｿｽPosition?ｿｽﾌ取得
position_fore = get(handles.fore,'Position');
%?ｿｽ?ｿｽ?ｿｽﾝの具ｿｽ?ｿｽz?ｿｽ?ｿｽ?ｿｽ謫ｾ
curr_money = str2num(get(handles.text10,'String'));

%?ｿｽ?ｿｽ?ｿｽz?ｿｽﾌ変更
if(strcmp(eventdata.Key,'uparrow'))
    if(curr_money < 100)
        curr_money = curr_money + scale_unit;
        height_fore = height_fore + (scale_unit*height_back/100);
    end
elseif(strcmp(eventdata.Key,'downarrow'))
    if(curr_money > 0)
        curr_money = curr_money - scale_unit;
        height_fore = height_fore - (scale_unit*height_back/100);
    end
elseif(strcmp(eventdata.Key,'return'))
    setappdata(handles.figure1,'flag',1)
end
%?ｿｽG?ｿｽ?ｿｽ?ｿｽ[?ｿｽh?ｿｽ~
if(height_fore > 0)
    if(height_fore > height_back)
        height_fore = height_back;
    end
    position_fore(4) = height_fore;
else
    height_fore = 0;
    position_fore(4) = 0.00001;
end
set(handles.fore,'Position',position_fore)
set(handles.text10,'String',curr_money)
setappdata(handles.figure1,'height_fore',height_fore)
end
function timerCallbakcFcn_s(~, ~, handles)

tmpStr = get(handles.text22,'String');
tmpNumber = str2double(tmpStr);
if tmpNumber < 0.01
    setappdata(handles.figure1,'selection',randi(30,1))
    setappdata(handles.figure1,'timeoff_s',1)
    setappdata(handles.figure1,'time_sl',0)
    stop(t_s);
else
    tmpNumber = tmpNumber - 0.01;
    tmpDigitString = num2str(tmpNumber);
    setappdata(handles.figure1,'time_sl',tmpNumber)
    set(handles.text22,'String',tmpDigitString);
end
end

function timerCallbakcFcn_g(~, ~, handles)
tmpStr = get(handles.text22,'String');
tmpNumber = str2double(tmpStr);
if tmpNumber < 0.01
    setappdata(handles.figure1,'timeoff_g',1)
    setappdata(handles.figure1,'time_gl',0)
    setappdata(handles.figure1,'flag',1)
    stop(t_g);
else
    tmpNumber = tmpNumber - 0.01;
    tmpDigitString = num2str(tmpNumber);
    setappdata(handles.figure1,'time_gl',tmpNumber)
    set(handles.text22,'String',tmpDigitString);
end
end

% --- Outputs from this function are returned to the command line.
function varargout = negotiation_selection30_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',1)
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',2)
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',3)
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',4)
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',5)
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',6)
end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',7)
end

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',8)
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',9)
end

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',10)
end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',11)
end

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',12)
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',13)
end

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',14)
end

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',15)
end

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',16)
end

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',17)
end

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',18)
end

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',19)
end

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',20)
end

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',21)
end

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',22)
end

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',23)
end

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',24)
end

% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',25)
end

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',26)
end

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',27)
end

% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',28)
end

% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',29)
end

% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',30)
end
