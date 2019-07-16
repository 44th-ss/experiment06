function varargout = dictator_given(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dictator_given_OpeningFcn, ...
                   'gui_OutputFcn',  @dictator_given_OutputFcn, ...
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


% --- Executes just before dictator_given is made visible.
function dictator_given_OpeningFcn(hObject, eventdata, handles, varargin)

timePeriod = 0.01;
t_g = timer('timerFcn',{@timerCallbakcFcn_g, handles}, 'ExecutionMode','fixedDelay', 'Period',timePeriod, 'StartDelay',0.6);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

load dictator_given

number = length(data);
init = game_init(data(number).game);
disp(init)
times = length(init.datasets);
data(number).answer = zeros(times,5);
game_get = 0;

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
set(handles.text2,'String',initial_position)
setappdata(handles.figure1,'height_back',position_back(4))

set(handles.figure1,'Visible','on')
set(handles.fore,'Visible','off')
set(handles.back,'Visible','off')
set(handles.text2,'Visible','off')
set(handles.text3,'Visible','off')
set(handles.text4,'Visible','off')
set(handles.text5,'Visible','off')
set(handles.text6,'Visible','off')
set(handles.text7,'Visible','off')
set(handles.text8,'Visible','off')
set(handles.text9,'Visible','off')
set(handles.text1,'Visible','off')
set(handles.text15,'Visible','off')
set(handles.text16,'Visible','off')
set(handles.text17,'Visible','off')
set(handles.text18,'Visible','on')
set(handles.text1,'Visible','off')
set(handles.edit2,'Visible','off')
set(handles.axes1,'Visible','off')
set(handles.text19,'Visible','off')
set(handles.text20,'Visible','off')
pause(4)

for i = 1:times
    setappdata(handles.figure1,'flag',0)
    setappdata(handles.figure1,'timeoff_g',0)
    setappdata(handles.figure1,'time_gl',0)
    
    set(handles.figure1,'Visible','on')
    set(handles.fore,'Visible','on')
    set(handles.back,'Visible','on')
    set(handles.text2,'Visible','on')
    set(handles.text3,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','on')
    set(handles.text7,'Visible','on')
    set(handles.text8,'Visible','on')
    set(handles.text9,'Visible','on')
    imshow(init.sample(init.datasets(i)).picture)
    set(handles.text1,'Visible','off')
    set(handles.text15,'Visible','on')
    set(handles.edit2,'Visible','off')
    set(handles.text18,'Visible','off')
    
    set(handles.text17, 'String','10.00');
   
    set(handles.text16,'Visible','on')
    set(handles.text17,'Visible','on')
    set(handles.text19,'Visible','on')
    set(handles.text20,'Visible','on')

    sound(init.snd)
    start(t_g)
    
    while(1)
        flag = getappdata(handles.figure1,'flag');
        timeoff_g = getappdata(handles.figure1,'timeoff_g');
        
        if(flag == 0)
            pause(0.4)
            continue
        else
            player_g = str2double(get(handles.text2,'String'));
            data(number).answer(i,1) = player_g;
            data(number).answer(i,3) = timeoff_g;
            time_gl = getappdata(handles.figure1,'time_gl');
            data(number).answer(i,4) = 10 - time_gl;
            
            break
        end
    end
    stop(t_g)
    
    set(handles.fore,'Visible','off')
    set(handles.back,'Visible','off')
    set(handles.text2,'Visible','off')
    set(handles.text3,'Visible','off')
    set(handles.text4,'Visible','off')
    set(handles.text5,'Visible','off')
    set(handles.text6,'Visible','off')
    set(handles.text7,'Visible','off')
    set(handles.text8,'Visible','off')
    set(handles.text9,'Visible','off')
    set(handles.text1,'Visible','on')
    set(handles.text16,'Visible','off')
    set(handles.text17,'Visible','off')
    
  
    set(handles.edit2,'Visible','on')
    set(handles.edit2,'string',(100 - player_g) * 100)
    game_get = game_get +  ((100 - player_g) * 100);
    set(handles.text19,'String',game_get)
    
    pause(2.4)
        
end

% 1 player_give
% 2 total get
% 3 game timeoff
% 4 game reaction time


data(number).answer(i,2) = game_get;
data(number).init = init;
save('dictator_given','data')
close('dictator_given')
end

function figure1_KeyPressFcn(hObject, eventdata, handles)

scale_unit = 1;

height_back = getappdata(handles.figure1,'height_back');
height_fore = getappdata(handles.figure1,'height_fore');

position_fore = get(handles.fore,'Position');

curr_money = str2double(get(handles.text2,'String'));

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
set(handles.text2,'String',curr_money)
setappdata(handles.figure1,'height_fore',height_fore)
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

% --- Outputs from this function are returned to the command line.
function varargout = dictator_given_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
