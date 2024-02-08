% Matlab Model by Jianghua Yin (Dec.,2019,Nanning)
% Copyright (C) 2019 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.

% This is a demo of DFPM for solving the unconstrained nonlinear monotone
% equations of the form
% F(x)=0.

% model=1 means -F(zk)'*dk ≥ sigma*tk*norm(dk)^2
% model=2 means -F(zk)'*dk ≥ sigma*tk*norm(F(zk))*norm(dk)^2
% model=3 means -F(zk)'*dk ≥ sigma*tk*norm(F(zk))/(1+norm(F(zk)))*norm(dk)^2

% model=5 means -F(zk)'*dk ≥ sigma*tk*min(nu,norm(Fz_new,2))*norm(dk)^2

clc;
clear all
close all


ITR_max = 2000;
% setup TXT document
fid_tex=fopen('mytext10.txt','w');
np = 182;
ns = 4;   % the number of the test algorithms
T = zeros(np,ns);
F = zeros(np,ns);
N = zeros(np,ns);

% ********   需要注意 此处的 168 的问题背后所对应的 具体的8个问题 **
% *********
%% 1
% parameters for  ZW
para1.Itr_max = ITR_max;

para1.gamma = 1;
para1.sigma = 0.01;             % the coefficient of line search
% para1.tau = 0.618;                  % the compression ratio 0.5
para1.tau = 0.555;                  % the compression ratio 0.5
para1.alpha = 0.1;              % the coefficient of inertial step 原本0.2
para1.rho = 1.8;                    % the relaxation factor
%% 3
% % parameters for MITTCGP   5 ***********************
para3.Itr_max = ITR_max;
para3.gamma = 0.4;         % the initial guess
para3.sigma = 0.01;      % the coefficient of line search
para3.tau = 0.6;         % the compression ratio
para3.rho = 1.8;      % the relaxation factor
para3.alpha = 0.1;       % the coefficient of inertial step

%% 4

% parameters for ISTCP 1 ******************************************
para4.Itr_max = ITR_max;
para4.gamma = 1;         % the initial guess
para4.sigma = 0.0001;      % the coefficient of line search
para4.tau = 0.7;         % the compression ratio
para4.rho = 1;           % the relaxation factor
para4.alpha = 0.8;       % the coefficient of inertial step
%% run
%此处数值最高可到 1:168 对应着固定初始点的8个数值算例
% 106-127求解时间久
% 127+21=149
for index=1:182
    [name,n,a,b] = init2(index);
    [T1,NFF1,NI1,G1] = DFPM1(index,'ZW',3,4,para1); % acceleration
    [T2,NFF2,NI2,G2] = DFPM1(index,'ZW',2,4,para1); % acceleration
    [T3,NFF3,NI3,G3] = DFPM(index,'MITTCGP',5,para3);
    [T4,NFF4,NI4,G4] = DFPM(index,'ISTCP',1,para4);
    
    T(index,:) = [T1,T2,T3,T4];%,T5,T6
    F(index,:) = [NFF1,NFF2,NFF3,NFF4]; %,NFF5,NFF6
    N(index,:) = [NI1,NI2,NI3,NI4]; %,NI5,NI6
    
    fprintf(fid_tex,'%s %d & %d/%d/%.3f/%.2e & %d/%d/%.3f/%.2e & %d/%d/%.3f/%.2e & %d/%d/%.3f/%.2e\n',...
        name,n,NI1,NFF1,T1,G1,NI2,NFF2,T2,G2,NI3,NFF3,T3,G3,NI4,NFF4,T4,G4);%,NI5,NFF5,T5,G5,NI6,NFF6,NGG6,T6,NI7,NFF7,NGG7,T7);
    
end
%% 关闭文件
fclose(fid_tex);

%% 画图
clf;   %clf删除当前图形窗口中、
%%句柄未被隐藏(即它们的HandleVisibility属性为on)的图形对象
figure(1);
%subplot(2,2,1);
perf(T,'logplot');
%title('时间性能');
%set(gca,'ylim',[0.3,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
legend('HA-DFPM+-','HA-DFPM-','MITTCGP','ISTCP');%,'DY+','HZ','location','best');%% 'CG\_descent'



figure(2);
perf(F,'logplot');
%title('目标函数计算性能');
% set(gca,'ylim',[0.1,1]);
xlabel('\tau','Interpreter','tex');                     %% 给x轴加注
ylabel('\rho(\tau)','Interpreter','tex');               %% 给y轴加注
legend('HA-DFPM+-','HA-DFPM-','MITTCGP','ISTCP');%,'DY+','HZ','location','best');%% 线分类说明'JHS','DHS','VHS','JPRP','DPRP','JHS','DHS',



figure(3);
perf(N,'logplot');
%title('迭代次数性能');
%set(gca,'ylim',[0.5,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
legend('HA-DFPM+-','HA-DFPM-','MITTCGP','ISTCP');%,'DY+','HZ','location','best'); %'JFR','PRP',




