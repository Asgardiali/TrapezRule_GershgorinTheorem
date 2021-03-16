function varargout = Odev_1_Deneme(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Odev_1_Deneme_OpeningFcn, ...
                   'gui_OutputFcn',  @Odev_1_Deneme_OutputFcn, ...
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

function Odev_1_Deneme_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = Odev_1_Deneme_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function katsayiA_Callback(hObject, eventdata, handles)



function katsayiA_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function katsayiB_Callback(hObject, eventdata, handles)

function katsayiB_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function katsayiC_Callback(hObject, eventdata, handles)

function katsayiC_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)

function pushbutton2_Callback(hObject, eventdata, handles)

function hesaplaButon_Callback(hObject, eventdata, handles)

cla(handles.axes1);

ka=str2double(get(handles.katsayiA,'string'));
kb=str2double(get(handles.katsayiB,'string'));
kc=str2double(get(handles.katsayiC,'string'));
n=str2double(get(handles.nsayisi,'string'));
add=2/n;
toplamfcn1=0;
toplamfcn2=0;

for x=-1:add:0.99
    
    I1=((x+add)-x)*((myfcn1((x+add),ka)+myfcn1(x,ka))/2);
    toplamfcn1=toplamfcn1+I1;
    
    I2=((x+add)-x)*((myfcn2((x+add),kb,kc)+myfcn2(x,kb,kc))/2);
    toplamfcn2=toplamfcn2+I2;
    
    x=x+add;    
end

for k=-2:0.01:2
    
    y1=myfcn1(k,ka);
    y2=myfcn2(k,kb,kc);
    
    plot(k,y1,'o',k,y2,'*')
    hold on
end

Rnum=toplamfcn2-toplamfcn1;
set(handles.sonuc1,'string',Rnum);

Rint=myfcnfi2(kb,kc,-1,1)-myfcnfi1(ka,-1,1);
set(handles.sonuc2,'string',Rint);

bagilHata=abs(Rnum-Rint)/abs(Rnum);
set(handles.sonuc3,'string',bagilHata);


function sonuc1_Callback(hObject, eventdata, handles)

function sonuc1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sonuc2_Callback(hObject, eventdata, handles)

function sonuc2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sonuc3_Callback(hObject, eventdata, handles)

function sonuc3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function nsayisi_Callback(hObject, eventdata, handles)

function nsayisi_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f1=myfcn1(t,a)
f1=a*t^2;

function f2=myfcn2(k,b,c)
f2=b-(c*k^2);

function fi1=myfcnfi1(akatsayi,a,b)
fun=@(x)akatsayi.*x.^2;
fi1=integral(@(x)fun(x),a,b);

function fi2=myfcnfi2(bkatsayi,ckatsayi,a,b)
fun=@(x)bkatsayi-ckatsayi.*x.^2;
fi2=integral(@(x)fun(x),a,b);
