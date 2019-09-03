function varargout = tela(varargin)
% TELA MATLAB code for tela.fig
%      TELA, by itself, creates a new TELA or raises the existing
%      singleton*.
%
%      H = TELA returns the handle to a new TELA or the handle to
%      the existing singleton*.
%
%      TELA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TELA.M with the given input arguments.
%
%      TELA('Property','Value',...) creates a new TELA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tela_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tela_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tela

% Last Modified by GUIDE v2.5 11-Dec-2016 03:46:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tela_OpeningFcn, ...
                   'gui_OutputFcn',  @tela_OutputFcn, ...
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


% --- Executes just before tela is made visible.
function tela_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tela (see VARARGIN)

% Choose default command line output for tela
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tela wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tela_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function local_text_Callback(hObject, eventdata, handles)
% hObject    handle to local_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of local_text as text
%        str2double(get(hObject,'String')) returns contents of local_text as a double


% --- Executes during object creation, after setting all properties.
function local_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to local_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_text_Callback(hObject, eventdata, handles)
% hObject    handle to freq_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_text as text
%        str2double(get(hObject,'String')) returns contents of freq_text as a double


% --- Executes during object creation, after setting all properties.
function freq_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ganho_text_Callback(hObject, eventdata, handles)
% hObject    handle to ganho_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ganho_text as text
%        str2double(get(hObject,'String')) returns contents of ganho_text as a double


% --- Executes during object creation, after setting all properties.
function ganho_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ganho_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function base_text_Callback(hObject, eventdata, handles)
% hObject    handle to base_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of base_text as text
%        str2double(get(hObject,'String')) returns contents of base_text as a double


% --- Executes during object creation, after setting all properties.
function base_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to base_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ecg_menu.
function ecg_menu_Callback(hObject, eventdata, handles)
% hObject    handle to ecg_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




options = get(handles.ecg_menu,'String');
selected = options{get(handles.ecg_menu,'Value')};
file = matfile(fullfile('database_QRS', selected), 'Writable', false);

Fs = str2double(get(handles.freq_text, 'String'));
base = str2double(get(handles.base_text, 'String'));
gain = str2double(get(handles.ganho_text, 'String'));
ecg = (file.val(1, :) - base)/gain;


time_axis = (0:length(ecg)-1)/Fs;
plot(handles.ecg_plot, time_axis(1:Fs*5), ecg(1:Fs*5));
xlabel('Tempo (s)'); ylabel('Tensão (mV)');


ordem = 4;
freq_corte = 0.0055;
[b,a] = butter(ordem,freq_corte,'high');
ecg_fil = filter(b,a,ecg);


[C,L] = wavedec(ecg_fil,4,'db6'); 
[d1,d2,d3,d4] = detcoef(C,L,[1,2,3,4]); 
sinal = d4.^2; 

threshold = 0.15*max(sinal);

val_PicoR = 1:length(sinal);
[~, indiceR] = findpeaks(sinal, 'MinPeakHeight', threshold);
val_PicoR(indiceR) = [];
sinal(val_PicoR) = 0;

intervalo_Tempo_R = 16*diff(indiceR);
FreqCard = conv(intervalo_Tempo_R, ones(1, 5)/5, 'valid');

minima = ceil(min(60*Fs./FreqCard));
maxima = ceil(max(60*Fs./FreqCard));
media = ceil(mean(60*Fs./FreqCard));

%set(handles.bpmmin_text, 'String', sprintf('%.2f BPM', minima));
%set(handles.bpmmax_text, 'String', sprintf('%.2f BPM', maxima));
set(handles.bpmmedia_text, 'String', sprintf('%.2f BPM', media));

if media > 90
    estado = 'Taquicardia';
elseif media >= 60 && media <= 90
	estado = 'Saudável';
elseif media < 60
	estado = 'Bradicardia';
end
set(handles.estado_text, 'String', estado);

time_axis = (0:length(sinal)-1)/Fs;
%hold on;
plot(handles.ecg_peak, time_axis(1:Fs), sinal(1:Fs));xlabel('Tempo (s)'); ylabel('Magnitude (mV)');
%stem(handles.ecg_peak, time_axis(1:Fs*5), sinal(1:Fs*5),'*');
% xlabel('Tempo (s)');
% ylabel('Magnitude (mV)');

% Hints: contents = cellstr(get(hObject,'String')) returns ecg_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ecg_menu


% --- Executes during object creation, after setting all properties.
function ecg_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ecg_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to base_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
