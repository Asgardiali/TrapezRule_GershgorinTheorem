n=input('Hesaplanacak alan� ka� par�aya b�lmek istersin= ')
r=input('�emberinin yar��ap� ka�= ')
m=input('�ember merkezi nerededir= ')


t=0:pi/50:pi;



plot(r*cos(t)+m,r*sin(t))
% hold on
% plot(1+cos(t),1+sin(t))

axis equal %�l�ek �arpanlar�n� her iki eksen i�in de e�it k�lar.
% title('x^2+y^2=4 and (x-1)^2+(y-1)^2=1 daireleri')




%%
n=input('Traperzodial kural i�in istenen aral�k = ');



a=input('a*x^2 denkleminde a katsay�s�n� giriniz = ');
b=input('b-c*x^2 denkleminde b katsay�s�n� giriniz = ');
c=input('b-c*x^2 denkleminde c katsay�s�n� giriniz = ');

add=2/n;
toplamfcn1=0;
toplamfcn2=0;


for x=-1:add:0.99
    
    I1=((x+add)-x)*((myfcn1((x+add),a)+myfcn1(x,a))/2);
    toplamfcn1=toplamfcn1+I1;
    
    I2=((x+add)-x)*((myfcn2((x+add),b,c)+myfcn2(x,b,c))/2);
    toplamfcn2=toplamfcn2+I2;
    
    x=x+add;    
end
%Her iki fonksiyonun grafi�ini �izdirmek i�in olu�tudu�um for d�ng�s�.
for k=-2:0.01:2
    
    y1=myfcn1(k,a);
    y2=myfcn2(k,b,c);
    
    plot(k,y1,'o',k,y2,'*')
    hold on
end
%Arada kalan b�lgenin n�merik integral al�narak elde edilen sonucu.
Rnum=toplamfcn2-toplamfcn1

Rint=myfcnfi2(b,c,-1,1)-myfcnfi1(a,-1,1)

bagilHata=abs(Rnum-Rint)/abs(Rnum)

