% Matlab Model by Jianghua Yin (Nov.,2017,Laibin)
% Copyright (C) 2017 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem1(x,mode)
% Raydan, M.: The Barzilai and Borwein gradient method for the large scale unconstrained minimization
% problem. SIAM J. Optim. 7(1), 26¨C33 (1997)
n = length(x);
if mode==1               % compute F(x)
  Fx=ones(n,1);
  for i=1:n
    Fx(i)=exp(x(i))-1;
  end
  out=Fx;
elseif  mode==2          % compute the projection
    out=max(x,0);
end
% out = exp(x)-1;
% out = ones(n,1);
% for i=1:n
%     out(i) = exp(x(i))-1;
% end
%out=Fx;


