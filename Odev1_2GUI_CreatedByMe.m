function varargout = Odev1_2GUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Odev1_2GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Odev1_2GUI_OutputFcn, ...
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

function Odev1_2GUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = Odev1_2GUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function slidera_Callback(hObject, eventdata, handles)

set(handles.slidera,'SliderStep',[0.025 0.1]);

a=get(handles.slidera,'Value');
set(handles.adeger,'string',a);

function slidera_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function sliderb_Callback(hObject, eventdata, handles)

set(handles.sliderb,'SliderStep',[0.025 0.1]);

b=get(handles.sliderb,'Value');
set(handles.bdeger,'string',b);
    
function sliderb_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function sliderc_Callback(hObject, eventdata, handles)

set(handles.sliderc,'SliderStep',[0.025 0.1]);

c=get(handles.sliderc,'Value');
set(handles.cdeger,'string',c);

function sliderc_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function sliderd_Callback(hObject, eventdata, handles)

set(handles.sliderd,'SliderStep',[0.025 0.1]);

d=get(handles.sliderd,'Value');
set(handles.ddeger,'string',d);

function sliderd_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function eigenValues_Callback(hObject, eventdata, handles)


function eigenValues_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function adeger_Callback(hObject, eventdata, handles)

function adeger_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function bdeger_Callback(hObject, eventdata, handles)

function bdeger_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cdeger_Callback(hObject, eventdata, handles)

function cdeger_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ddeger_Callback(hObject, eventdata, handles)

function ddeger_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function axes_CreateFcn(hObject, eventdata, handles)

function butonHesapla_Callback(hObject, eventdata, handles)

%��leme ba�lamadan �nce herhangi bir kar���kl�k olmamas� i�in grafi�i temizliyorum.
cla(handles.axes);

%Slider taraf�ndan al�nan de�erleri de�i�kenlere at�yorum ayn� zamanda
%hangi de�eri ald���m� anlamak i�in edit text'e yazd�r�yorum.
a=get(handles.slidera,'Value');     
set(handles.adeger,'string',a);     

b=get(handles.sliderb,'Value');
set(handles.bdeger,'string',b);

c=get(handles.sliderc,'Value');
set(handles.cdeger,'string',c);

d=get(handles.sliderd,'Value');
set(handles.ddeger,'string',d);

%Trapez methodu ile dairelerin alan�n� hesaplamak i�in kullan�lacak olan
%aral�k say�s�n� slider yard�m� ile kullan�c�dan al�n�yor.

n=get(handles.slidern,'Value');
set(handles.ndeger,'string',n);

%Sistem i�in bana verilen matrisi tan�ml�yorum ve al�nan de�i�kenler i�ine tan�mlan�yor.
m=[a -1 2 -0.45; 2.01 b -4 1; -2 0.55 c -2; -3 0.41 3 d];

%Gershgorin teoremi i�in olu�turulacak �emberlerin yar��aplar�n� hesaplad�m.
r1=abs(m(1,2))+abs(m(1,3))+abs(m(1,4));
r2=abs(m(2,1))+abs(m(2,3))+abs(m(2,4));
r3=abs(m(3,1))+abs(m(3,2))+abs(m(3,4));
r4=abs(m(4,1))+abs(m(4,2))+abs(m(4,3));

%Matlab ortam�nda �ember �izdirmek i�in a�a��daki ba��nt�lar� kulland�m.
t=0:pi/50:2*pi;

xa=r1*cos(t)+m(1,1);
ya=r1*sin(t);

xb=r2*cos(t)+m(2,2);
yb=r2*sin(t);

xc=r3*cos(t)+m(3,3);
yc=r3*sin(t);

xd=r4*cos(t)+m(4,4);
yd=r4*sin(t);

%Trapez methodu ile Gershgorin �emberleri alt�nda kalan alan hesab�
%yapt�rd�m.

adda=r1/n;
addb=r2/n;
addc=r3/n;
addd=r4/n;

toplama=0;
toplamb=0;
toplamc=0;
toplamd=0;

alanA=0;
alanB=0;
alanC=0;
alanD=0;

%i� i�e �ember denk geldi�i takdirde en d��takinin alan�n� hesaplamak i�in
%if ko�ulu olu�turdum.

if(a==b||b==c||b==d||a==d||c==d||a==c)
    
    % Trapez methodu i�in yazd���m k�s�mlar.
    
    if(a==b || b==c || b==d)

        for t=b:addb:b+r2-addb
        Ib=((t+addb)-t)*((fcn(b,r2,(t+addb))+fcn(b,r2,t))/2);
        toplamb=toplamb+Ib;
        end
        alanB=4*toplamb;
    end


    if(a==d || c==d)

        for t=d:addd:d+r4-addd
         Id=((t+addd)-t)*((fcn(d,r4,(t+addd))+fcn(d,r4,t))/2);
         toplamd=toplamd+Id;
        end
        alanD=4*toplamd;
    end

    if(a==c)

       for t=c:addc:c+r3-addc
        Ic=((t+addc)-t)*((fcn(c,r3,(t+addc))+fcn(c,r3,t))/2);
        toplamc=toplamc+Ic;
       end
       alanC=4*toplamc;
    end
    
    alanA=4*toplama;
    alanB=4*toplamb;
    alanC=4*toplamc;
    alanD=4*toplamd;


    ToplamAlan=alanA+alanB+alanC+alanD

   
    
else
    
for t=a:adda:a+r1-adda
    Ia=((t+adda)-t)*((fcn(a,r1,(t+adda))+fcn(a,r1,t))/2);
    toplama=toplama+Ia;
end

for t=b:addb:b+r2-addb
    Ib=((t+addb)-t)*((fcn(b,r2,(t+addb))+fcn(b,r2,t))/2);
    toplamb=toplamb+Ib;
end

for t=c:addc:c+r3-addc
    Ic=((t+addc)-t)*((fcn(c,r3,(t+addc))+fcn(c,r3,t))/2);
    toplamc=toplamc+Ic;
end

for t=d:addd:d+r4-addd
    Id=((t+addd)-t)*((fcn(d,r4,(t+addd))+fcn(d,r4,t))/2);
    toplamd=toplamd+Id;
end

alanA=4*toplama;
alanB=4*toplamb;
alanC=4*toplamc;
alanD=4*toplamd;


ToplamAlan=alanA+alanB+alanC+alanD

end

%Heaplanan toplam alan� ekrana edittext'e yazd�rd�m.

set(handles.alanToplam,'string',ToplamAlan);

%Olu�turudu�um eigCalc fonksiyonu yard�m�yla ger�ek �z de�erler ile
%Gershgorin teoremi sonucu elde etti�im t�m �embberleri ortak bir plot
%i�erisinde �izdirdim.
z=eigCalc(m);
%�zde�erleri grafi�e �izdirirken karma��k �zde�er ��kt���ndan 
%d�zg�n �izmedi�i i�in �zde�erleri if ko�ulu ile kontrol ettim.

if(imag(z(1))==0 && imag(z(2))==0 && imag(z(3))==0 && imag(z(4))==0)
    
    plot(handles.axes,z,0,'*')
    datacursormode on
    hold on
    plot(handles.axes,xa,ya,xb,yb,xc,yc,xd,yd)
    ylim(handles.axes,[-20 20]);
    xlim(handles.axes,[-20 20]);
    grid on

    r1=0;r2=0;
    r3=0;r4=0;

    xa=0;ya=0;
    xb=0;yb=0;
    xc=0;yc=0;
    xd=0;yd=0;

    a=0;b=0;c=0;d=0;
else
    plot(handles.axes,z,'*')
    datacursormode on
    hold on
    plot(handles.axes,xa,ya,xb,yb,xc,yc,xd,yd)
    ylim(handles.axes,[-20 20]);
    xlim(handles.axes,[-20 20]);
    grid on
    legend('Eigenvalues','Eig1','Eig2','Eig3','Eig4')

    r1=0;r2=0;
    r3=0;r4=0;

    xa=0;ya=0;
    xb=0;yb=0;
    xc=0;yc=0;
    xd=0;yd=0;

    a=0;b=0;c=0;d=0;
end
    




function alanToplam_Callback(hObject, eventdata, handles)

function alanToplam_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nSayisi_Callback(hObject, eventdata, handles)

function nSayisi_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function slidern_Callback(hObject, eventdata, handles)

set(handles.slidern,'Sliderstep',[0.001,0.01]);
n=get(handles.slidern,'Value');
set(handles.ndeger,'string',n);



function slidern_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ndeger_Callback(hObject, eventdata, handles)

function ndeger_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
