function varargout = game_given(varargin)
% GAME_GIVEN MATLAB code for game_given.fig
%      GAME_GIVEN, by itself, creates a new GAME_GIVEN or raises the existing
%      singleton*.
%
%      H = GAME_GIVEN returns the handle to a new GAME_GIVEN or the handle to
%      the existing singleton*.
%
%      GAME_GIVEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME_GIVEN.M with the given input arguments.
%
%      GAME_GIVEN('Property','Value',...) creates a new GAME_GIVEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game_given_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to game_given_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game_given

% Last Modified by GUIDE v2.5 21-Jun-2019 11:07:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game_given_OpeningFcn, ...
                   'gui_OutputFcn',  @game_given_OutputFcn, ...
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


% --- Executes just before game_given is made visible.
function game_given_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game_given (see VARARGIN)

timePeriod = 0.01;
t_g = timer('timerFcn',{@timerCallbakcFcn_g, handles}, 'ExecutionMode','fixedDelay', 'Period',timePeriod, 'StartDelay',0.6);

% Choose default command line output for game_given
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

load coordination_given
number = length(data);
%?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ読み搾ｿｽ?ｿｽ?ｿｽ
init = game_init(data(number).game);

%?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ狽ﾌ確?ｿｽF
times = length(init.datasets);
%?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ保托ｿｽ?ｿｽ齒奇ｿｽ?成(1?ｿｽ?ｿｽ?ｿｽ:?ｿｽ甯ｱ?ｿｽﾒの選?ｿｽ?ｿｽ 2?ｿｽ?ｿｽ?ｿｽ:?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ選?ｿｽ?ｿｽ 3?ｿｽ?ｿｽ?ｿｽ:reaction time 4?ｿｽ?ｿｽ?ｿｽ:?ｿｽ?ｿｽ?ｿｽﾔ切ゑｿｽﾌとゑｿｽ1)
data(number).answer = zeros(times,4);
game_get = 0;
%main
set(handles.figure1,'Visible','on')
set(handles.text13,'Visible','on')
set(handles.pushbutton1,'Visible','off')
set(handles.pushbutton2,'Visible','off')
set(handles.text2,'Visible','off')
set(handles.text3,'Visible','off')
set(handles.text4,'Visible','off')
set(handles.text5,'Visible','off')
set(handles.text6,'Visible','off')
set(handles.text7,'Visible','off')
set(handles.text8,'Visible','off')
set(handles.text10,'Visible','off')
set(handles.text11,'Visible','off')
set(handles.text12,'Visible','off')
set(handles.text15,'Visible','off')
set(handles.text14,'Visible','off')
set(handles.axes1,'Visible','off')
pause(5)

for i = 1:times
    strategy = 0;
    setappdata(handles.figure1,'strategy',0)
    setappdata(handles.figure1,'timeoff_g',0)
    setappdata(handles.figure1,'time_gl',0)
    %?ｿｽz?ｿｽu
    set(handles.pushbutton1,'Visible','on')
    set(handles.pushbutton2,'Visible','on')
    set(handles.text2,'Visible','on')
    set(handles.text3,'Visible','on')
    set(handles.text4,'String',{'(5000,5000)'},'ForegroundColor','black','FontWeight','normal','Visible','on')
    set(handles.text5,'String',{'(0,0)'},'ForegroundColor','black','FontWeight','normal','Visible','on')
    set(handles.text6,'String',{'(0,0)'},'ForegroundColor','black','FontWeight','normal','Visible','on')
    set(handles.text7,'String',{'(2500,2500)'},'ForegroundColor','black','FontWeight','normal','Visible','on')
    set(handles.text8,'Visible','on')
    set(handles.text10,'Visible','on')
    set(handles.text11,'String',init.limit5,'Visible','on')
    set(handles.text12,'Visible','on')
    set(handles.text13,'Visible','off')
    set(handles.text15,'Visible','on')
    set(handles.text14,'Visible','on')
    axes(handles.axes1)
    imshow(init.sample(init.datasets(i)).picture)
    set(handles.axes1,'Xtick',[],'Ytick',[],'Visible','on')
    
    %?ｿｽ甯ｱ?ｿｽﾒの戦略?ｿｽ?ｿｽ?ｿｽ?ｿｽ
%     if(init.processing == 1)%?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾔゑｿｽ?ｿｽ?ｿｽ
%         pause(1)
%         %sound(init.snd)
%         for j = 1:init.limit5
%             pause(1)
%             rem_time = init.limit5 - j;
%             set(handles.text11,'String',rem_time)
%             sound(init.snd)
%         end
%         strategy = getappdata(handles.figure1,'strategy');
%         if(strategy == 0)
%             strategy = randi([1 2],1,1);
%             data(number).answer(i,3) = 1;
%         end
%         data(number).answer(i,1) = strategy;
%     else %?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾔなゑｿｽ
    start(t_g)
    while(1)
        timeoff_g = getappdata(handles.figure1,'timeoff_g');
        strategy = getappdata(handles.figure1,'strategy');
        if(strategy == 0)
            pause(0.5)
            continue
        else
            data(number).answer(i,1) = strategy;
            data(number).answer(i,3) = init.limit5 - getappdata(handles.figure1,'time_gl');
            data(number).answer(i,4) = timeoff_g;
            break
        end
    end
    stop(t_g)
    
    %?ｿｽ?ｿｽ?ｿｽﾊの表?ｿｽ?ｿｽ
    %?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ戦略?ｿｽﾌ鯉ｿｽ?ｿｽ?ｿｽ
    opponent = rand;
    if(opponent <= init.sample(init.datasets(i)).prob_coordination)%?ｿｽ?ｿｽ?ｿｽ閧ｪ?ｿｽ?ｿｽ?ｿｽ?ｿｽ
        data(number).answer(i,2) = 1;
        if(strategy == 1)
            set(handles.pushbutton2,'Visible','off')
            set(handles.text3,'Visible','off')
            set(handles.text5,'Visible','off')
            set(handles.text6,'Visible','off')
            set(handles.text7,'Visible','off')
            set(handles.text8,'Visible','off')
            set(handles.text4,'ForegroundColor','red','FontWeight','bold')
            game_get = game_get + 5000;
        else
            set(handles.pushbutton1,'Visible','off')
            set(handles.text3,'Visible','off')
            set(handles.text4,'Visible','off')
            set(handles.text5,'Visible','off')
            set(handles.text7,'Visible','off')
            set(handles.text8,'Visible','off')
            set(handles.text6,'ForegroundColor','red','FontWeight','bold')
        end
    else %?ｿｽ?ｿｽ?ｿｽ閧ｪ?ｿｽ?ｿｽ?ｿｽﾘゑｿｽ
        data(number).answer(i,2) = 2;
        if(strategy == 1)
            set(handles.pushbutton2,'Visible','off')
            set(handles.text2,'Visible','off')
            set(handles.text4,'Visible','off')
            set(handles.text6,'Visible','off')
            set(handles.text7,'Visible','off')
            set(handles.text8,'Visible','off')
            set(handles.text5,'ForegroundColor','red','FontWeight','bold')
        else
            set(handles.pushbutton1,'Visible','off')
            set(handles.text2,'Visible','off')
            set(handles.text4,'Visible','off')
            set(handles.text5,'Visible','off')
            set(handles.text6,'Visible','off')
            set(handles.text8,'Visible','off')
            set(handles.text7,'ForegroundColor','red','FontWeight','bold')
            game_get = game_get + 2500;
        end
    end
    set(handles.text14,'String',game_get)
    pause(2.5)
end
data(number).answer(i,5) = game_get;
data(number).init = init;
save('coordination_given','data')
close('game_given')
end
% UIWAIT makes game_given wait for user response (see UIRESUME)
% uiwait(handles.figure1);
function timerCallbakcFcn_g(~, ~, handles)
tmpStr = get(handles.text11,'String');
tmpNumber = str2double(tmpStr);
    if tmpNumber < 0.01
        disp(tmpNumber)
        setappdata(handles.figure1,'timeoff_g',1)
        setappdata(handles.figure1,'time_gl',0)
        setappdata(handles.figure1,'strategy',randi(2,1))
        stop(t_g);
    else
        tmpNumber = tmpNumber - 0.01;
        tmpDigitString = num2str(tmpNumber);
        setappdata(handles.figure1,'time_gl',tmpNumber)
        set(handles.text11,'String',tmpDigitString);
    end
end


% --- Outputs from this function are returned to the command line.
function varargout = game_given_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'strategy',1)
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.figure1,'strategy',2)
end
