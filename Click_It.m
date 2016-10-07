function varargout = Click_It(varargin)
% CLICK_IT MATLAB code for Click_It.fig
%      CLICK_IT, by itself, creates a new CLICK_IT or raises the existing
%      singleton*.
%
%      H = CLICK_IT returns the handle to a new CLICK_IT or the handle to
%      the existing singleton*.
%
%      CLICK_IT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLICK_IT.M with the given input arguments.
%
%      CLICK_IT('Property','Value',...) creates a new CLICK_IT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Click_It_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Click_It_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Click_It

% Last Modified by GUIDE v2.5 04-Oct-2015 12:11:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Click_It_OpeningFcn, ...
                   'gui_OutputFcn',  @Click_It_OutputFcn, ...
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


% --- Executes just before Click_It is made visible.
function Click_It_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Click_It (see VARARGIN)

% Choose default command line output for Click_It
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Click_It wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Click_It_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Frame_Rate_Callback(hObject, eventdata, handles)
% hObject    handle to Frame_Rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Frame_Rate as text
%        str2double(get(hObject,'String')) returns contents of Frame_Rate as a double
handles = guidata(hObject);
handles.framerate=str2num(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function Frame_Rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frame_Rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function browse_edit_Callback(hObject, eventdata, handles)
% hObject    handle to browse_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of browse_edit as text
%        str2double(get(hObject,'String')) returns contents of browse_edit as a double


% --- Executes during object creation, after setting all properties.
function browse_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to browse_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
%Path Change for Brad
[FileName,PathName,FilterIndex] = uigetfile('*.avi','Select Video');
handles.ExPath = [PathName FileName];
handles.FileName = FileName;
handles.PathName = PathName;
%set(handles.edit12,'String',ExPath);
set( handles.browse_edit , 'String', handles.ExPath);
guidata(hObject, handles);

% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
video=handles.ExPath;
video_handle = VideoReader(video);

%% Getting handles to the figure
%num_of_frames=video_handle.NumberOfFrames/handles.framerate;

j=1;
%stn=1;
%ind=1;
%rep=1;
figure(1)
frame_num=handles.Start_frame;
Object_Info=[];
while (frame_num<handles.Stop_frame)
    test_frame=read(video_handle,frame_num);
    imshow(test_frame);
    text(10,10,['Frame=',num2str(frame_num)],'FontSize',20,'Color','black')
    [x,y,button] = ginput;
    for n=1:length(x)
        hold on
        plot(x(n),y(n),'r.','MarkerSize',20)
        
        if(button(n)==1 )
        
            text(x(n),y(n),'M1','HorizontalAlignment','right','FontSize',10,'Color','blue')
        
        elseif(button(n)==2 )
             text(x(n),y(n),'M2','HorizontalAlignment','right','FontSize',10,'Color','blue')
        elseif(button(n)==3 )
             text(x(n),y(n),'M3','HorizontalAlignment','right','FontSize',10,'Color','blue')
        else
             text(x(n),y(n),char(button(n)),'HorizontalAlignment','right','FontSize',10,'Color','green')
        end
    end
    hold off
    
    % waiting for (y/n) to determine correctness
    prompt='Continue to next frame?';
    str = questdlg(prompt);
    %% writing xy coordinates to csv file
    [row,col]=size(x);
    if strcmp(str,'Yes')
        for t=1:row
            Object_Info(j,:)=[j,frame_num,button(t),x(t),y(t)];
            j=j+1;
        end
        frame_num=frame_num+handles.framerate;
    end
end
path=handles.PathName;
filename=strcat(path,handles.FileName(1:(end-4)),'_Objects.csv');
addpath(path);
dlmwrite(filename,'Index,Frame_ID,ascii_code,X,Y','')
dlmwrite(filename,Object_Info,'-append')




function Stop_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Stop_edit as text
%        str2double(get(hObject,'String')) returns contents of Stop_edit as a double
handles = guidata(hObject);
handles.Stop_frame=str2num(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Stop_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Stop_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Start_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Start_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Start_edit as text
%        str2double(get(hObject,'String')) returns contents of Start_edit as a double
handles = guidata(hObject);
handles.Start_frame=str2num(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Start_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Start_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
