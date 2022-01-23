function varargout = ProjektAO(varargin)
% PROJEKTAO MATLAB code for ProjektAO.fig
%      PROJEKTAO, by itself, creates a new PROJEKTAO or raises the existing
%      singleton*.
%
%      H = PROJEKTAO returns the handle to a new PROJEKTAO or the handle to
%      the existing singleton*.
%
%      PROJEKTAO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJEKTAO.M with the given input arguments.
%
%      PROJEKTAO('Property','Value',...) creates a new PROJEKTAO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjektAO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjektAO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjektAO

% Last Modified by GUIDE v2.5 08-Jan-2018 20:36:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjektAO_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjektAO_OutputFcn, ...
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


% --- Executes just before ProjektAO is made visible.
function ProjektAO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjektAO (see VARARGIN)

% Choose default command line output for ProjektAO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjektAO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjektAO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear;
%clc;

[filename pathname] = uigetfile({'*.png';'*.jpg'},'File Selector');
fullpathname = strcat(pathname, filename);
myImg = imread(fullpathname);

imshow(myImg);
%Kod

%codeDefinition
global codeLen;
global code;
codeLen = 52;
% codeLen = 26;
code = ['A' 'a' 'B' 'b' 'C' 'c' 'D' 'd' 'E' 'e' 'F' 'f' 'G' 'g' 'H' 'h' 'I' 'i' 'J' 'j' 'K' 'k' 'L' 'l' 'M' 'm' 'N' 'n' 'O' 'o' 'P' 'p' 'R' 'r' 'S' 's' 'T' 't' 'U' 'u' 'V' 'v' 'W' 'w' 'X' 'x' 'Y' 'y' 'Z' 'z' ',' '.'];
% code = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' ',' '.'];

%W macierzy o takich wymiarach zostanie zapisany ka�dy region
global regionHeight;
global regionWidth;
regionHeight = 14;
regionWidth = 14;
%Nazwa pliku kt�ry b�dzie dekodowany
%toDecrypt = 'singleLine.png';
% toDecrypt = 'multiLine.png';
% toDecrypt = 'text_Calibri_32.png';
toDecrypt = fullpathname;%'text_Calibri_72.png';

%Reading code pattern
codeImage = readImage('code_Calibri_72.png');
codeNormalized = getNormalizedLettersFromImage(codeImage);


textImage = readImage(toDecrypt);
lettersToRead = getNormalizedLettersFromImage(codeImage);

text = decryptText(codeNormalized, textImage);

set(handles.text2,'String', fullpathname);
set(handles.text3,'String', text);
