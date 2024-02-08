

%% 结果格式化输出
% 1.放入执行程序的相同目录下
% 2.需要根据修改 mytext 文件名称，适用于方程组数值实验第一部分
% 3.运行主程序后运行一次check1
% 注：按照比较参数格式打开或者注释
%% 3 个参数的格式
% clc
% clear
% [a,b,c,d,e,f,g,h,i,j,k,l] = textread('.\mytextcheck.txt','%s%f%f%f & %f%f%f%f & %f%f%f%f  %*[^\n]','delimiter','/');
% format short
% data = [c,g,k]


%% 4个参数的格式
clc
clear
[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p] = textread('.\mytext2.txt','%s%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f %*[^\n]','delimiter','/');
format short
data = [c,g,k,o];

%% 5个参数的格式
% clc
% clear
% [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t] = textread('.\mytextcheck.txt','%s%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f %*[^\n]','delimiter','/');
% format short
% data = [c,g,k,o,s]

%% 6个参数的格式
% clc
% clear
% [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x] = textread('.\mytext1.txt','%s%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f %*[^\n]','delimiter','/');
% format short
% data = [c,g,k,o,s,w]