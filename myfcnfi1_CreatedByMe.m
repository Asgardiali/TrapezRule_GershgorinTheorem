function fi1=myfcnfi1(akatsayi,a,b)
fun=@(x)akatsayi.*x.^2;
fi1=integral(@(x)fun(x),a,b);