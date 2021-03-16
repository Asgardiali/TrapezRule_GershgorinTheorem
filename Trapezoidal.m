%**************************************************%
%Oluþturulan algoritmaya gereken deðerleri kullanýcý tarafýndan atamak için
%input fonksiyonu yardýmýyla kullanýcýdan veri girdisini aldým.
n=input('Traperzodial kural için istenen aralýk = ');
a=input('a*x^2 denkleminde a katsayýsýný giriniz = ');
b=input('b-c*x^2 denkleminde b katsayýsýný giriniz = ');
c=input('b-c*x^2 denkleminde c katsayýsýný giriniz = ');
%Plot çizdirmek için s=-1'den baþlattým
%add diye ifade edilen deðiþken [-1,1] aralýðýný istenilen deðere bölümü
%sonucunda elde edilir. Bunu adým deðeri olarak aldým.
add=2/n;
%Her iþlem sonucunda elde edilen deðerleri toplayarak gitmek için balangýç
%deðeri olarak 0 verdiðim deðiþkenler.
toplamfcn1=0;
toplamfcn2=0;
%for döngüsü ile her bir adým için altýnda kalan alan hesapladým ve çýkan
%sonuçlarý topladým."myfcn1" ve "myfcn2" diye iki fonksiyon yazdým.
for x=-1:add:0.99
    
    I1=((x+add)-x)*((myfcn1((x+add),a)+myfcn1(x,a))/2);
    toplamfcn1=toplamfcn1+I1;
    
    I2=((x+add)-x)*((myfcn2((x+add),b,c)+myfcn2(x,b,c))/2);
    toplamfcn2=toplamfcn2+I2;
    
    x=x+add;    
end
%Her iki fonksiyonun grafiðini çizdirmek için oluþtuduðum for döngüsü.
for k=-2:0.01:2
    
    y1=myfcn1(k,a);
    y2=myfcn2(k,b,c);
    
    plot(k,y1,'o',k,y2,'*')
    hold on
end
%Arada kalan bölgenin nümerik integral alýnarak elde edilen sonucu.
Rnum=toplamfcn2-toplamfcn1

Rint=myfcnfi2(b,c,-1,1)-myfcnfi1(a,-1,1)

bagilHata=abs(Rnum-Rint)/abs(Rnum)

