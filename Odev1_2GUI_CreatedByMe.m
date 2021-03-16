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

%Ýþleme baþlamadan önce herhangi bir karýþýklýk olmamasý için grafiði temizliyorum.
cla(handles.axes);

%Slider tarafýndan alýnan deðerleri deðiþkenlere atýyorum ayný zamanda
%hangi deðeri aldýðýmý anlamak için edit text'e yazdýrýyorum.
a=get(handles.slidera,'Value');     
set(handles.adeger,'string',a);     

b=get(handles.sliderb,'Value');
set(handles.bdeger,'string',b);

c=get(handles.sliderc,'Value');
set(handles.cdeger,'string',c);

d=get(handles.sliderd,'Value');
set(handles.ddeger,'string',d);

%Trapez methodu ile dairelerin alanýný hesaplamak için kullanýlacak olan
%aralýk sayýsýný slider yardýmý ile kullanýcýdan alýnýyor.

n=get(handles.slidern,'Value');
set(handles.ndeger,'string',n);

%Sistem için bana verilen matrisi tanýmlýyorum ve alýnan deðiþkenler içine tanýmlanýyor.
m=[a -1 2 -0.45; 2.01 b -4 1; -2 0.55 c -2; -3 0.41 3 d];

%Gershgorin teoremi için oluþturulacak çemberlerin yarýçaplarýný hesapladým.
r1=abs(m(1,2))+abs(m(1,3))+abs(m(1,4));
r2=abs(m(2,1))+abs(m(2,3))+abs(m(2,4));
r3=abs(m(3,1))+abs(m(3,2))+abs(m(3,4));
r4=abs(m(4,1))+abs(m(4,2))+abs(m(4,3));

%Matlab ortamýnda çember çizdirmek için aþaðýdaki baðýntýlarý kullandým.
t=0:pi/50:2*pi;

xa=r1*cos(t)+m(1,1);
ya=r1*sin(t);

xb=r2*cos(t)+m(2,2);
yb=r2*sin(t);

xc=r3*cos(t)+m(3,3);
yc=r3*sin(t);

xd=r4*cos(t)+m(4,4);
yd=r4*sin(t);

%Trapez methodu ile Gershgorin çemberleri altýnda kalan alan hesabý
%yaptýrdým.

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

%iç içe çember denk geldiði takdirde en dýþtakinin alanýný hesaplamak için
%if koþulu oluþturdum.

if(a==b||b==c||b==d||a==d||c==d||a==c)
    
    % Trapez methodu için yazdýðým kýsýmlar.
    
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

%Heaplanan toplam alaný ekrana edittext'e yazdýrdým.

set(handles.alanToplam,'string',ToplamAlan);

%Oluþturuduðum eigCalc fonksiyonu yardýmýyla gerçek öz deðerler ile
%Gershgorin teoremi sonucu elde ettiðim tüm çembberleri ortak bir plot
%içerisinde çizdirdim.
z=eigCalc(m);
%Özdeðerleri grafiðe çizdirirken karmaþýk özdeðer çýktýðýndan 
%düzgün çizmediði için özdeðerleri if koþulu ile kontrol ettim.

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
