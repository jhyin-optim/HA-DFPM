

%% �����ʽ�����
% 1.����ִ�г������ͬĿ¼��
% 2.��Ҫ�����޸� mytext �ļ����ƣ������ڷ�������ֵʵ���һ����
% 3.���������������һ��check1
% ע�����ձȽϲ�����ʽ�򿪻���ע��
%% 3 �������ĸ�ʽ
% clc
% clear
% [a,b,c,d,e,f,g,h,i,j,k,l] = textread('.\mytextcheck.txt','%s%f%f%f & %f%f%f%f & %f%f%f%f  %*[^\n]','delimiter','/');
% format short
% data = [c,g,k]


%% 4�������ĸ�ʽ
clc
clear
[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p] = textread('.\mytext2.txt','%s%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f %*[^\n]','delimiter','/');
format short
data = [c,g,k,o];

%% 5�������ĸ�ʽ
% clc
% clear
% [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t] = textread('.\mytextcheck.txt','%s%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f %*[^\n]','delimiter','/');
% format short
% data = [c,g,k,o,s]

%% 6�������ĸ�ʽ
% clc
% clear
% [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x] = textread('.\mytext1.txt','%s%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f & %f%f%f%f %*[^\n]','delimiter','/');
% format short
% data = [c,g,k,o,s,w]