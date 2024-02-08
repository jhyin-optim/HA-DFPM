% Matlab Model by Jianghua Yin (Nov.,2017,Laibin)
% Copyright (C) 2017 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem5(x,mode)
% Problem 5 in Abubakar A B, Kumam P. A descent Dai-Liao conjugate gradient method for nonlinear equations[J]. 
% Numerical Algorithms, 2018: 1-14.
n = length(x);
if mode==1
  Fx=ones(n,1);
  Fx(1)=2.5*x(1)+x(2)-1;
  for i=2:n-1
    Fx(i)=x(i-1)+2.5*x(i)+x(i+1)-1;
  end
  Fx(n)=x(n-1)+2.5*x(n)-1;
  out=Fx;
elseif  mode==2
    out=max(x,0);
end
% n = length(x);
% out = zeros(n,1);
% out(1) = 2.5*x(1)+x(2)-1;
% for i=2:n-1
%     out(i) = x(i-1)+2.5*x(i)+x(i+1)-1;
% end
% out(n) = x(n-1)+2.5*x(n)-1;


    
        
    
    


