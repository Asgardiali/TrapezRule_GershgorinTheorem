function fi2=myfcnfi2(bkatsayi,ckatsayi,a,b)
fun=@(x)bkatsayi-ckatsayi.*x.^2;
fi2=integral(@(x)fun(x),a,b);