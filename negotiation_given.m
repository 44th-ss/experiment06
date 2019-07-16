function varargout = negotiation_given(varargin)
% negotiation_given MATLAB code for negotiation_given.fig
%      negotiation_given, by itself, creates a new negotiation_given or raises the existing
%      singleton*.
%
%      H = negotiation_given returns the handle to a new negotiation_given or the handle to
%      the existing singleton*.
%
%      negotiation_given('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in negotiation_given.M with the given input arguments.
%
%      negotiation_given('Property','Value',...) creates a new negotiation_given or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before negotiation_given_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to negotiation_given_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help negotiation_given

% Last Modified by GUIDE v2.5 25-Jun-2019 13:54:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @negotiation_given_OpeningFcn, ...
                   'gui_OutputFcn',  @negotiation_given_OutputFcn, ...
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


% --- Executes just before negotiation_given is made visible.
function negotiation_given_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to negotiation_given (see VARARGIN)

timePeriod = 0.01;
t_g = timer('timerFcn',{@timerCallbakcFcn_g, handles}, 'ExecutionMode','fixedDelay', 'Period',timePeriod, 'StartDelay',0.6);

% Choose default command line output for negotiation_given
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes negotiation_given wait for user response (see UIRESUME)
% uiwait(handles.figure1);

load negotiation_given
number = length(data);
%?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ読み搾ｿｽ?ｿｽ?ｿｽ
init = game_init(data(number).game);
%?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽ狽ﾌ確?ｿｽF
times = length(init.datasets);
%?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ保托ｿｽ?ｿｽ齒奇ｿｽ?成
data(number).answer = zeros(times,4);
%1?ｿｽ?ｿｽ?ｿｽ:?ｿｽ?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ提示具ｿｽ?ｿｽz?ｿｽA2?ｿｽ?ｿｽ?ｿｽ:?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ提示具ｿｽ?ｿｽz?ｿｽA3?ｿｽ?ｿｽ?ｿｽ:reationtime 4?ｿｽ?ｿｽ?ｿｽ:?ｿｽ?ｿｽ?ｿｽﾔ切ゑｿｽﾌ趣ｿｽ1
game_get = 0;
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


set(handles.figure1,'Visible','on')
set(handles.fore,'Visible','off')
set(handles.back,'Visible','off')
set(handles.text4,'Visible','off')
set(handles.text5,'Visible','off')
set(handles.text6,'Visible','off')
set(handles.text7,'Visible','off')
set(handles.text8,'Visible','off')
set(handles.text9,'Visible','off')
set(handles.text10,'Visible','off')
set(handles.text11,'Visible','off')
set(handles.text12,'Visible','off')
set(handles.text13,'Visible','off')
set(handles.text14,'Visible','off')
set(handles.text15,'Visible','off')
set(handles.text16,'Visible','off')
set(handles.text17,'Visible','off')
set(handles.text18,'Visible','off')
set(handles.text19,'Visible','off')
set(handles.text20,'Visible','off')
set(handles.text21,'Visible','off')
set(handles.text22,'Visible','off')
set(handles.text23,'Visible','on')
set(handles.axes1,'Visible','off')
set(handles.text24,'Visible','off')
set(handles.text25,'Visible','off')
set(handles.text26,'Visible','off')
pause(5)

%main
for i = 1:times
    %?ｿｽz?ｿｽu
    setappdata(handles.figure1,'flag',0)
    setappdata(handles.figure1,'timeoff_g',0)
    setappdata(handles.figure1,'time_gl',0)
    set(handles.figure1,'Visible','on')
    set(handles.fore,'Visible','on')
    set(handles.back,'Visible','on')
    set(handles.text4,'Visible','on')
    set(handles.text5,'Visible','on')
    set(handles.text6,'Visible','on')
    set(handles.text7,'Visible','on')
    set(handles.text8,'Visible','on')
    set(handles.text9,'Visible','on')
    set(handles.text10,'Visible','on')
    set(handles.text11,'Visible','on')
    set(handles.text12,'Visible','on')
    set(handles.text13,'Visible','off')
    set(handles.text14,'Visible','off')
    set(handles.text15,'Visible','off')
    set(handles.text16,'Visible','off')
    set(handles.text17,'Visible','off')
    set(handles.text18,'Visible','off')
    set(handles.text19,'Visible','off')
    set(handles.text20,'Visible','on')
    set(handles.text21,'String',init.limit,'Visible','on')
    set(handles.text22,'Visible','on')
    set(handles.text23,'Visible','off')
    set(handles.text24,'Visible','on')
    set(handles.text25,'Visible','on')
    set(handles.text26,'Visible','on')
    axes(handles.axes1)
    imshow(init.sample(init.datasets(i)).picture)
    set(handles.axes1,'Xtick',[],'Ytick',[],'Visible','on')
    
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
            data(number).answer(i,1) = str2num(get(handles.text10,'String'));
            data(number).answer(i,3) = init.limit - getappdata(handles.figure1,'time_gl');
            data(number).answer(i,4) = timeoff_g;
            break
        end
    end
    stop(t_g)
    
    %?ｿｽ?ｿｽ?ｿｽ?ｿｽﾌ提示具ｿｽ?ｿｽz?ｿｽﾌ鯉ｿｽ?ｿｽ?ｿｽ
    opponent = rand;
    for j = 1:11
        if((opponent < sum(init.sample(init.datasets(i)).prob_negotiation(1,1:j)))&&(data(number).answer(i,2) == 0))
            npc_want = randi([10*(j-1)-5,10*(j-1)+5],1);
            if npc_want > 100
                npc_want = 100;
            end
            if npc_want < 0
                npc_want = 0;
            end
            data(number).answer(i,2) = npc_want;
        end
    end
    %?ｿｽ?ｿｽ?ｿｽﾊの表?ｿｽ?ｿｽ
    goukei = sum(data(number).answer(i,1:2));
    set(handles.text10,'Visible','off')
    set(handles.text11,'Visible','off')
    set(handles.text12,'Visible','off')
    set(handles.text13,'Visible','on')
    set(handles.text14,'String',data(number).answer(i,1),'Visible','on')
    set(handles.text15,'Visible','on')
    set(handles.text16,'Visible','on')
    set(handles.text17,'String',data(number).answer(i,2),'Visible','on')
    set(handles.text18,'Visible','on')
    if(goukei <= 100)
        set(handles.text19,'String','交渉成功','Visible','on')
        game_get = game_get +  data(number).answer(i,1);
        set(handles.text24,'String',game_get)
    else
        set(handles.text19,'String','交渉失敗','Visible','on')
    end
    pause(4)
end


data(number).answer(i,5) = game_get;
data(number).init = init;
save('negotiation_given','data')
close('negotiation_given')
end

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

function timerCallbakcFcn_g(~, ~, handles)
tmpStr = get(handles.text21,'String');
tmpNumber = str2double(tmpStr);
    if tmpNumber < 0.01
        disp(tmpNumber)
        setappdata(handles.figure1,'timeoff_g',1)
        setappdata(handles.figure1,'time_gl',0)
        setappdata(handles.figure1,'flag',1)
        stop(t_g);
    else
        tmpNumber = tmpNumber - 0.01;
        tmpDigitString = num2str(tmpNumber);
        setappdata(handles.figure1,'time_gl',tmpNumber)
        set(handles.text21,'String',tmpDigitString);
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = negotiation_given_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end
