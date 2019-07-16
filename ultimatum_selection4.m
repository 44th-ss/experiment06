function varargout = ultimatum_selection4(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ultimatum_selection4_OpeningFcn, ...
                   'gui_OutputFcn',  @ultimatum_selection4_OutputFcn, ...
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


% --- Executes just before ultimatum_selection4 is made visible.
function ultimatum_selection4_OpeningFcn(hObject, eventdata, handles, varargin)
set(gcf,'Position',get(0,'ScreenSize'))

timePeriod = 0.01;
t_s = timer('timerFcn',{@timerCallbakcFcn_s, handles}, 'ExecutionMode','fixedDelay', 'Period',timePeriod, 'StartDelay',0.6);
t_g = timer('timerFcn',{@timerCallbakcFcn_g, handles}, 'ExecutionMode','fixedDelay', 'Period',timePeriod, 'StartDelay',0.6);


handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ultimatum_selection4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
load ultimatum_selection4

number = length(data);
init = game_init(data(number).game);
times = init.times;
data(number).answer = zeros(times,8);
game_get = 0;
remaining_times = times;

set(handles.figure1,'KeyPressFcn',{@figure1_KeyPressFcn,handles});

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
set(handles.text1,'String',initial_position)
setappdata(handles.figure1,'height_back',position_back(4))


%tobii
if (init.eyetracker_flag == 1)
    addpath(genpath('TobiiPro.SDK.Matlab_1.5.0.28'))
    Tobii = EyeTrackingOperations();
    eyetracker_address = 'tet-tcp://127.0.0.1';
    eyetracker = Tobii.get_eyetracker(eyetracker_address);

    pause(1)
end


    set(handles.figure1,'Visible','on')
    imshow(imread('back.png'));
    set(handles.text14,'Visible','off')
    set(handles.pushbutton1,'cdata',init.sample(init.datasets(1)).picture,'Visible','off')
    set(handles.pushbutton2,'cdata',init.sample(init.datasets(2)).picture,'Visible','off')
    set(handles.pushbutton3,'cdata',init.sample(init.datasets(3)).picture,'Visible','off')
    set(handles.pushbutton4,'cdata',init.sample(init.datasets(4)).picture,'Visible','off')
    
    set(handles.fore,'Visible','off')
    set(handles.back,'Visible','off')
    set(handles.text1,'Visible','off')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    set(handles.text7,'Visible','off')
    set(handles.text8,'Visible','off')
    set(handles.text9,'Visible','off')
    set(handles.text10,'Visible','off')
    set(handles.text12,'Visible','off')
    set(handles.text13,'Visible','off')
    set(handles.text19,'Visible','on')
    set(handles.text2,'Visible','off')
    set(handles.edit1,'Visible','off')

    %time_s
    set(handles.text15,'Visible','off')
    set(handles.text18,'Visible','off')
    
    %time_g
    set(handles.text17,'Visible','off')
    
    set(handles.text21,'Visible','off')
    set(handles.text20,'Visible','off')
    set(handles.text22,'Visible','off')
    set(handles.text23,'Visible','off')
    
    pause(4)

for i = 1:times
    
    setappdata(handles.figure1,'selection',0)
    setappdata(handles.figure1,'flag',0)
    setappdata(handles.figure1,'timeoff_s',0)
    setappdata(handles.figure1,'timeoff_g',0)
    setappdata(handles.figure1,'time_sl',0)
    setappdata(handles.figure1,'time_gl',0)
    
    
    set(handles.figure1,'Visible','on')
    imshow(imread('back.png'));
    
    set(handles.text14,'Visible','on')
    set(handles.pushbutton1,'cdata',init.sample(init.datasets(1)).picture,'Visible','on')
    set(handles.pushbutton2,'cdata',init.sample(init.datasets(2)).picture,'Visible','on')
    set(handles.pushbutton3,'cdata',init.sample(init.datasets(3)).picture,'Visible','on')
    set(handles.pushbutton4,'cdata',init.sample(init.datasets(4)).picture,'Visible','on')
    
    set(handles.fore,'Visible','off')
    set(handles.back,'Visible','off')
    set(handles.text1,'Visible','off')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    set(handles.text7,'Visible','off')
    set(handles.text8,'Visible','off')
    set(handles.text9,'Visible','off')
    set(handles.text10,'Visible','off')
    set(handles.text12,'Visible','off')
    set(handles.text13,'Visible','off')
    set(handles.text19,'Visible','off')
    
    set(handles.text2,'Visible','off')
    set(handles.edit1,'Visible','off')

    %time_s
    set(handles.text18, 'String','5.00');
    set(handles.text15,'Visible','on')
    set(handles.text18,'Visible','on')
    
    %time_g
    set(handles.text17, 'String','10.00');
    set(handles.text17,'Visible','off')
    
    set(handles.text21,'Visible','on')
    set(handles.text20,'Visible','on')
    set(handles.text22,'Visible','on')
    set(handles.text23,'Visible','on')
    
    
    if (init.eyetracker_flag == 1)
        eyetracker.get_gaze_data();
    end
    
    sound(init.snd)
    start(t_s)

    remaining_times = remaining_times - 1;
    set(handles.text22,'string',remaining_times)
    
    while(1)
        selection = getappdata(handles.figure1,'selection');
        timeoff_s = getappdata(handles.figure1,'timeoff_s');
        
        if(selection == 0)
            pause(0.4)
            continue
        else
            data(number).answer(i,1) = selection;
            data(number).answer(i,3) = timeoff_s;
            
            time_sl = getappdata(handles.figure1,'time_sl');
            data(number).answer(i,5) = 5 - time_sl;
            
            set(handles.text14,'Visible','off')
            set(handles.pushbutton1,'cdata',init.sample(init.datasets(1)).picture,'Visible','off')
            set(handles.pushbutton2,'cdata',init.sample(init.datasets(2)).picture,'Visible','off')
            set(handles.pushbutton3,'cdata',init.sample(init.datasets(3)).picture,'Visible','off')
            set(handles.pushbutton4,'cdata',init.sample(init.datasets(4)).picture,'Visible','off')
    
            set(handles.fore,'Visible','on')
            set(handles.back,'Visible','on')
            set(handles.text1,'Visible','on')
            set(handles.text5,'Visible','on')
            set(handles.text6,'Visible','on')
            set(handles.text7,'Visible','on')
            set(handles.text8,'Visible','on')
            set(handles.text9,'Visible','on')
            set(handles.text10,'Visible','on')
            set(handles.text12,'Visible','on')
            set(handles.text13,'Visible','on')
            
            %time_s
            set(handles.text18,'Visible','off')
            stop(t_s);
            pause(0.6)
            
            if (init.eyetracker_flag == 1)
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
           
            if(selection == 1)
                imshow(init.sample(init.datasets(1)).picture);
                elseif(selection ==2)
                    imshow(init.sample(init.datasets(2)).picture);
                elseif(selection ==3)
                    imshow(init.sample(init.datasets(3)).picture);
                elseif(selection ==4)
                    imshow(init.sample(init.datasets(4)).picture);
            end
        end
        break
    end
    
    %time_g
    set(handles.text17,'Visible','on')
    
    
    if (init.eyetracker_flag == 1)
        eyetracker.get_gaze_data();
    end
    
    sound(init.snd)
    start(t_g)
    
    while(1)
        flag = getappdata(handles.figure1,'flag');
        timeoff_g = getappdata(handles.figure1,'timeoff_g');
        
        if(flag == 0)
            pause(0.4)
            continue
        else
            player_g = str2double(get(handles.text1,'String'));
            data(number).answer(i,2) = player_g;
            data(number).answer(i,4) = timeoff_g;
            
            time_gl = getappdata(handles.figure1,'time_gl');
            data(number).answer(i,6) = 10 - time_gl;
        end
        break
    end
    stop(t_g)
    
    if (init.eyetracker_flag == 1)
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
     
     
    
    
    set(handles.fore,'Visible','off')
    set(handles.back,'Visible','off')
    set(handles.text1,'Visible','off')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    set(handles.text7,'Visible','off')
    set(handles.text8,'Visible','off')
    set(handles.text9,'Visible','off')
    set(handles.text10,'Visible','off')
    set(handles.text12,'Visible','off')
    set(handles.text13,'Visible','off')
    
    set(handles.text17,'Visible','off')
    set(handles.text15,'Visible','off')
    
    set(handles.text2,'Visible','on')
    
    opponent = rand;
    for k = 1:11
        if((opponent < sum(init.sample(init.datasets(selection)).prob_ultimatum(1,1:k)))&&(data(number).answer(i,7) == 0))
            npc_want = randi([10*(k-1)-5,10*(k-1)+5],1);
            if npc_want > 100
                npc_want = 100;
            end
            if npc_want < 0
                npc_want = 0;
            end
            data(number).answer(i,7) = npc_want;
        end
    end
    
    
    if player_g >= data(number).answer(i,7)
        set(handles.edit1,'Visible','on')
        set(handles.edit1,'string',(100 - player_g) * 100)
        data(number).answer(i,8) = 1;
        game_get = game_get +  ((100 - player_g) * 100);
        set(handles.text20,'String',game_get)
    else
        set(handles.edit1,'Visible','on')
        set(handles.edit1,'string','0 !')
        data(number).answer(i,8) = 0;
    end
    pause(2.4)
    
    imshow(imread('back.png'));
end

% 1 player_selection
% 2 player_give
% 3 selection timeoff
% 4 game timeoff
% 5 selection reaction time
% 6 game reaction time
% 7 npc_wanted
% 8 yes or no
data(number).answer(i,9) = game_get;
data(number).init = init;
save('ultimatum_selection4','data')
close('ultimatum_selection4')
end


function figure1_KeyPressFcn(hObject, eventdata, handles)

scale_unit = 1;

height_back = getappdata(handles.figure1,'height_back');
height_fore = getappdata(handles.figure1,'height_fore');

position_fore = get(handles.fore,'Position');

curr_money = str2double(get(handles.text1,'String'));

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
set(handles.text1,'String',curr_money)
setappdata(handles.figure1,'height_fore',height_fore)
end

function timerCallbakcFcn_s(~, ~, handles)

tmpStr = get(handles.text18,'String');
tmpNumber = str2double(tmpStr);
if tmpNumber < 0.01
    setappdata(handles.figure1,'selection',randi(4,1))
    setappdata(handles.figure1,'timeoff_s',1)
    setappdata(handles.figure1,'time_sl',0)
    stop(t_s);
else
    tmpNumber = tmpNumber - 0.01;
    tmpDigitString = num2str(tmpNumber);
    setappdata(handles.figure1,'time_sl',tmpNumber)
    set(handles.text18,'String',tmpDigitString);
    
end
end

function timerCallbakcFcn_g(~, ~, handles)

tmpStr = get(handles.text17,'String');
tmpNumber = str2double(tmpStr);
if tmpNumber < 0.01
    disp(tmpNumber)
    setappdata(handles.figure1,'flag',1)
    setappdata(handles.figure1,'timeoff_g',1)
    setappdata(handles.figure1,'time_gl',0)
    stop(t_g);
else
    tmpNumber = tmpNumber - 0.01;
    tmpDigitString = num2str(tmpNumber);
    setappdata(handles.figure1,'time_gl',tmpNumber)
    set(handles.text17,'String',tmpDigitString);
    
end
end


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(t);
delete(t);
end


% --- Outputs from this function are returned to the command line.
function varargout = ultimatum_selection4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
end


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',1)
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',2)
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',3)
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'selection',4)
end
