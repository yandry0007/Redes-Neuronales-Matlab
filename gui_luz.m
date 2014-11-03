function varargout = gui_luz(varargin)
% GUI_LUZ MATLAB code for gui_luz.fig
%      GUI_LUZ, by itself, creates a new GUI_LUZ or raises the existing
%      singleton*.
%
%      H = GUI_LUZ returns the handle to a new GUI_LUZ or the handle to
%      the existing singleton*.
%
%      GUI_LUZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_LUZ.M with the given input arguments.
%
%      GUI_LUZ('Property','Value',...) creates a new GUI_LUZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_luz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_luz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_luz

% Last Modified by GUIDE v2.5 02-Nov-2014 20:48:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_luz_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_luz_OutputFcn, ...
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


% --- Executes just before gui_luz is made visible.
function gui_luz_OpeningFcn(hObject, eventdata, handles, varargin)
axes(handles.axes5)
a = imread('luna.jpg');
image(a)
axis off
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_luz (see VARARGIN)

% Choose default command line output for gui_luz
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_luz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_luz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function btn_entrenar_Callback(hObject, eventdata, handles)
global sa
global net
e = [0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1; 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1; 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1; 0 1 0 1 0 1 0 1 0 1 0 1 0 0 1 0];
sa = [0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
net = newff([0 1;0 1;-1 1;-1 1],[2 1],{ 'satlin' 'satlins'}, 'trainlm')
net.trainParam.epochs=1000;
net.trainParam.show=5;
net = train(net,e,sa);
bias = net.b{1};
peso = net.iw{1,1};

function btn_luz_Callback(hObject, eventdata, handles)
%Codigo aqui 
global net
global sa
r1 = floor( 2 * rand (1,16));
r2 = floor( 2 * rand (1,16));
r3 = floor( 2 * rand (1,16));
r4 = floor( 2 * rand (1,16));
rn = [r1;r2;r3;r4];
s = sim(net,rn);
r = abs(floor(s));
nuevoValor = r(1:2);
salida = sa(1:2);
bandera = isequal(nuevoValor,salida);
if isequal(bandera,1)
    d = 'ENCENDIDO';
    axes(handles.luz);
    a=imread('focoblanco.jpg','jpg');
    image(a)
    axis off
else
    if isequal(bandera,0)
        axes(handles.luz);
        d = 'APAGADO';
        a = imread('focoluz.jpg');
        image(a)
        axis off
    end
end
datos =[nuevoValor' salida'];
set(handles.tabla,'data',datos)

%set(handles.text_luz, 'String',d);

function edit_A_Callback(hObject, eventdata, handles)

function edit_A_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_B_Callback(hObject, eventdata, handles)

function edit_B_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_C_Callback(hObject, eventdata, handles)


function edit_C_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_D_Callback(hObject, eventdata, handles)


function edit_D_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit6_Callback(hObject, eventdata, handles)
   
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
% Hint: place code in OpeningFcn to populate axes4



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_salida_Callback(hObject, eventdata, handles)
% hObject    handle to edit_salida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_salida as text
%        str2double(get(hObject,'String')) returns contents of edit_salida as a double


% --- Executes during object creation, after setting all properties.
function edit_salida_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_salida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_valor_Callback(hObject, eventdata, handles)
% hObject    handle to edit_valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_valor as text
%        str2double(get(hObject,'String')) returns contents of edit_valor as a double


% --- Executes during object creation, after setting all properties.
function edit_valor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in tabla.
function tabla_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to tabla (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in tabla.
function uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to tabla (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
