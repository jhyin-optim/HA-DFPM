% Matlab Model by Jianghua Yin (Nov.,2017,Laibin)
% Copyright (C) 2017 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem2(x,mode)
%Example 3 in Zhou W, Li D. Limited memory BFGS method for nonlinearmonotone equations. 
% J.Comput.Math., 2007,25:89¨C96.
n = length(x);
if mode==1
  Fx=ones(n,1);
  for i=1:n
     Fx(i)=2*x(i)-sin(abs(x(i)));
  end
  out=Fx;
elseif  mode==2
    out=max(x,0);
end
%   Fx=ones(n,1);
%   for i=1:n
%     Fx(i)=2*x(i)-sin(abs(x(i)));
%   end
% out = 2*x-sin(abs(x));

