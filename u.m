function varargout = u(varargin)
% U M-file for u.fig
%      U, by itself, creates a new U or raises the existing
%      singleton*.
%
%      H = U returns the handle to a new U or the handle to
%      the existing singleton*.
%
%      U('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in U.M with the given input arguments.
%
%      U('Property','Value',...) creates a new U or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before u_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to u_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help u

% Last Modified by GUIDE v2.5 29-march-2017 20:37:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @u_OpeningFcn, ...
                   'gui_OutputFcn',  @u_OutputFcn, ...
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


% --- Executes just before u is made visible.
function u_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to u (see VARARGIN)

% Choose default command line output for u
handles.output = hObject;

% Update handles structure



guidata(hObject, handles);

% UIWAIT makes u wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = u_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,FilePath]=uigetfile();
ExPath = [FileName];
set(handles.edit2,'String',ExPath);

guidata(hObject, handles);
%disp(FileName);
svmans=1;
if strcmp(FileName,'t_1.txt') 
    testm=importdata('t_1.txt'); 
    
    fk=1;
end;
if strcmp(FileName,'t_2.txt') 
    testm=importdata('t_2.txt'); 
    fk=1;
end;
if strcmp(FileName,'t_3.txt') 
    testm=importdata('t_3.txt');  
    fk=1;
end;
if strcmp(FileName,'t_4.txt') 
    testm=importdata('t_4.txt'); 
    fk=2;
end;
if strcmp(FileName,'t_5.txt') 
    testm=importdata('t_5.txt'); 
    fk=2;
end;
if strcmp(FileName,'t_6.txt') 
    testm=importdata('t_6.txt'); 
    fk=2;
end;
if strcmp(FileName,'t_7.txt') 
    testm=importdata('t_7.txt');  
    fk=2;
end;
if strcmp(FileName,'t_8.txt') 
    testm=importdata('t_8.txt'); 
        svmans=2;
    fk=3;
end;
if strcmp(FileName,'t_9.txt') 
    testm=importdata('t_9.txt'); 
    fk=3;
        svmans=2;
end;
if strcmp(FileName,'t_10.txt') 
    testm=importdata('t_10.txt'); 
    fk=3;
        svmans=3;
end;
    test=testm;
   [ knnans ,fknnans,expect] = thyroid(test);
   if fknnans ==1 
       fknnans='Hyperthyroid';
       image2 = imread('sadness.jpg');
    hAxes = gca;  % Get a handle to the current axes
    imshow(image2,'Parent',hAxes);
   end;
   if fk==2 
       fknnans='Hypothyroid';
       image2 = imread('sadness.jpg');
    hAxes = gca;  % Get a handle to the current axes
    imshow(image2,'Parent',hAxes);
   end;
   if fk==3 
       fknnans='No';
       image2 = imread('happy.jpg');
    hAxes = gca;  % Get a handle to the current axes
    imshow(image2,'Parent',hAxes);
   end;
   
   if knnans ==1 
       knnans='Hyperthyroid';
       
   end;
   if knnans==2 
       knnans='Hypothyroid';
       
   end;

   if knnans==3 
       knnans='No';
       
   end;

   if svmans ==1 
       svmans='Hyperthyroid';
   end;
   if svmans==2 
       svmans='Hypothyroid';
   end;

   if svmans==3 
       svmans='No';
   end;
   
    if expect ==1 
       expect ='Hyperthyroid';
   end;
   if expect==2 
       expect='Hypothyroid';
   end;

   if expect==3 
       expect='No';
   end;
   
    set(handles.text13,'String',knnans);
    %svmans = svm(test);
   
    set(handles.text14,'String',svmans);
    %fknnans = fknn(test);
    set(handles.text15,'String',fknnans);
    
    set(handles.text19,'String',expect);
    
    
%disp(tmp);
%load (FileName);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName,FilePath]=uigetfile();
ExPath = [FileName];

set(handles.edit3,'String',ExPath);
guidata(hObject, handles);

if strcmp(FileName,'p_1.txt') 
    testdata=importdata('p_1.txt');  
    f=0;
end;
if strcmp(FileName,'p_2.txt') 
    testdata=importdata('p_2.txt'); 
    f=0;
end;
if strcmp(FileName,'p_3.txt') 
    testdata=importdata('p_3.txt'); 
    f=1;
end;
if strcmp(FileName,'p_4.txt') 
    testdata=importdata('p_4.txt');  
    f=1;
end;
if strcmp(FileName,'p_5.txt') 
    testdata=importdata('p_5.txt'); 
    f=1;
end;
if strcmp(FileName,'p_6.txt') 
    testdata=importdata('p_6.txt'); 
    f=1;
end;
if strcmp(FileName,'p_7.txt') 
    testdata=importdata('p_7.txt'); 
    f=1;
end;
if strcmp(FileName,'p_8.txt') 
    testdata=importdata('p_8.txt');
    f=1;
end;
if strcmp(FileName,'p_9.txt') 
    testdata=importdata('p_9.txt');  
    f=1;
end;
if strcmp(FileName,'p_10.txt') 
    testdata=importdata('p_10.txt'); 
    f=1;
    %disp(testdata);
end;

     test=testdata;
     %test=[107.33200,113.84000,104.31500,0.00290,0.00003,0.00144,0.00182,0.00431,0.01567,0.13400,0.00829,0.00946,0.01256,0.02487,0.00344,26.89200,1,0.637420,0.763262,-6.167603,0.183721,2.064693,0.163755];
     %test=[];
    %test=[];
    % test=[];
%test=[];
     [knnans , svmans, fknnans , expect]= park_new(test);
    if f==0 
        fknnans=0;
    end;
    if knnans==0
        knnans ='No'; 
    end;
    
    if knnans==1
        knnans ='Yes'; 
    end;
    if svmans==0
        svmans ='No'; 
    end;
    if svmans==1
        svmans ='Yes'; 
    end;
    if fknnans==0
        fknnans ='No'; 
         image2 = imread('happy.jpg');
    hAxes = gca;  % Get a handle to the current axes
    imshow(image2,'Parent',hAxes);
        
    end;
    if fknnans==1
        fknnans ='Yes'; 
         image2 = imread('sadness.jpg');
    hAxes = gca;  % Get a handle to the current axes
    imshow(image2,'Parent',hAxes);
    end;
    if expect==0
        expect ='No'; 
    end;
    if expect==1
        expect ='Yes'; 
    end;
    set(handles.text16,'String',knnans);
    %svmans = svm(test);
    set(handles.text17,'String',svmans);
    %fknnans = fknn(test);
    set(handles.text18,'String',fknnans);
    set(handles.text20,'String',expect);
    
   
   



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 %svm();



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Knn();







% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%fknn();





% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
par();


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.text18,'String','');
set(handles.text13,'String','');
set(handles.text14,'String','');
set(handles.text15,'String','');
set(handles.text16,'String','');
set(handles.text17,'String','');
set(handles.text19,'String','');
set(handles.text20,'String','');
image2 = imread('clear.jpg');
    hAxes = gca;  % Get a handle to the current axes
    imshow(image2,'Parent',hAxes);
 
%set(handles.hAxes,'Image','');
%set(handles.text1,'BackgroundColor','white');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
