function perf(T,logplot)
%PERF    Performace profiles
%
% PERF(T,logplot)-- produces a performace profile as described in
%   Benchmarking optimization software with performance profiles,
%   E.D. Dolan and J.J. More', 
%   Mathematical Programming, 91 (2002), 201--213.
% Each column of the matrix T defines the performance data for a solver.
%%% Failures on a given problem are represented by a NaN.   ���ܹؼ���
% The optional argument logplot is used to produce a 
% log (base 2) performance plot.
%
% This function is based on the perl script of Liz Dolan.
%
% Jorge J. More', June 2004
% clear all
% clc
% T=rand(50,4)
% nargin=2
% logplot=1;
if (nargin < 2) logplot = 0; end

%plot LineSpec����
colors  = ['r' 'b' 'c' 'g' 'k' 'm' 'y'];% 'm'Ʒ��ɫ 'w'Ϊ��ɫû����
%lines   = [':' '-' {'-.'} {'--'}];%�����������������������޸ģ�����4����������
lines   = [':' '-' {'-.'} {'--'} ':'];
markers = ['x' '*' 's' 'd' 'v' '^' 'o'];% �ο�http://wiki.ilovematlab.cn/doc-view-54.html

[np,ns] = size(T);

% Minimal performance per solver

minperf = min(T,[],2);%ÿ���е���С�����һ��

% Compute ratios and divide by smallest element in each row.

r = zeros(np,ns);
for p = 1: np
  r(p,:) = T(p,:)/minperf(p);
end

if (logplot) r = log2(r); end

max_ratio = max(max(r));%ȡ��r��������Ԫ���е������ֵ

% Replace all NaN's with twice the max_ratio and sort.

r(find(isnan(r))) = 2*max_ratio;%������r�е�NaN�ֵΪ���r�������ֵ��2��
r = sort(r); %For matrices, sort(X) sorts each column of X in ascending order.

% Plot stair graphs with markers.

%clf;
for s = 1: ns
 [xs,ys] = stairs(r(:,s),[1:np]/np);
 option = [lines(s) colors(s) markers(s)];
 plot(xs,ys,cell2mat(option),'MarkerSize',3);
 hold on;
end

% Axis properties are set so that failures are not shown,
% but with the max_ratio data points shown. This highlights
% the "flatline" effect.
%set(gca,'xlim',[0,3]) ���� x�� �ķ�Χ

axis([ 0 1.1*max_ratio 0 1 ]);

% Legends and title should be added.



