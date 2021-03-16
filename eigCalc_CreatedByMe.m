function [eigVal,eigVec]=eigCalc(A)
s = size(A);
if s(1)~=s(2)
  error('Error: Input must be square.')
end
I = eye(length(A));
syms x
eq1 = det(A-I*x) == 0 ;
eigVal = double(solve(eq1,x));
eigVec = zeros(s);
for i = 1:length(A)
  syms y
  eq2 = (A-eigVal(i)*I)*y == 0;
  eigVec(:,i) = double(solve(eq2,y));
end

end