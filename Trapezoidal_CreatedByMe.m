%**************************************************%
%Olu�turulan algoritmaya gereken de�erleri kullan�c� taraf�ndan atamak i�in
%input fonksiyonu yard�m�yla kullan�c�dan veri girdisini ald�m.
n=input('Traperzodial kural i�in istenen aral�k = ');
a=input('a*x^2 denkleminde a katsay�s�n� giriniz = ');
b=input('b-c*x^2 denkleminde b katsay�s�n� giriniz = ');
c=input('b-c*x^2 denkleminde c katsay�s�n� giriniz = ');
%Plot �izdirmek i�in s=-1'den ba�latt�m
%add diye ifade edilen de�i�ken [-1,1] aral���n� istenilen de�ere b�l�m�
%sonucunda elde edilir. Bunu ad�m de�eri olarak ald�m.
add=2/n;
%Her i�lem sonucunda elde edilen de�erleri toplayarak gitmek i�in balang��
%de�eri olarak 0 verdi�im de�i�kenler.
toplamfcn1=0;
toplamfcn2=0;
%for d�ng�s� ile her bir ad�m i�in alt�nda kalan alan hesaplad�m ve ��kan
%sonu�lar� toplad�m."myfcn1" ve "myfcn2" diye iki fonksiyon yazd�m.
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

