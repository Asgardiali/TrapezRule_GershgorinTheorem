clear all
clc
a=input('a= ');
b=input('b= ');
c=input('c= ');
d=input('d= ');
n=input('n= ');

m=[a -1 2 -0.45; 2.01 b -4 1;
    -2 0.55 c -2; -3 0.41 3 d];

    
r1=abs(m(1,2))+abs(m(1,3))+abs(m(1,4));
r2=abs(m(2,1))+abs(m(2,3))+abs(m(2,4));
r3=abs(m(3,1))+abs(m(3,2))+abs(m(3,4));
r4=abs(m(4,1))+abs(m(4,2))+abs(m(4,3));

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

if(a==b||b==c||b==d||a==d||c==d||a==c)
    
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





% adda=r1/n;
% addb=r2/n;
% addc=r3/n;
% addd=r4/n;
% 
% toplama=0;
% toplamb=0;
% toplamc=0;
% toplamd=0;
% 
% for t=a:adda:a+r1-adda
%     Ia=((t+adda)-t)*((fcn(a,r1,(t+adda))+fcn(a,r1,t))/2);
%     toplama=toplama+Ia;
% end
% 
% for t=b:addb:b+r2-addb
%     Ib=((t+addb)-t)*((fcn(b,r2,(t+addb))+fcn(b,r2,t))/2);
%     toplamb=toplamb+Ib;
% end
% 
% for t=c:addc:c+r2-addc
%     Ic=((t+addc)-t)*((fcn(c,r3,(t+addc))+fcn(c,r3,t))/2);
%     toplamc=toplamc+Ic;
% end
% 
% for t=d:addd:d+r2-addd
%     Id=((t+addd)-t)*((fcn(d,r4,(t+addd))+fcn(d,r4,t))/2);
%     toplamd=toplamd+Id;
% end
% 
% alanA=4*toplama;
% alanB=4*toplamb;
% alanC=4*toplamc;
% alanD=4*toplamd;




% t=0:pi/20:2*pi;
% 
% xa=r1*cos(t)+m(1,1);
% ya=r1*sin(t);
% 
% xb=r2*cos(t)+m(2,2);
% yb=r2*sin(t);
% 
% xc=r3*cos(t)+m(3,3);
% yc=r3*sin(t);
% 
% xd=r4*cos(t)+m(4,4);
% yd=r4*sin(t);




% plot(eigCalc(m),'*')
% hold on;
% plot(xa,ya,xb,yb,xc,yc,xd,yd)
% legend('Eig1','Eig2','Eig3','Eig4');
% xlim([-10 10]);
% ylim([-10 10]);
% grid on

