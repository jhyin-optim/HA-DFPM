% init
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [nprob,n,m,x0]=initf(nprob)
% This function sets n,m, and the standard starting
% point based on the nprob and returns it to initpt
% function.
% Created on 10/30/94 by Madhu Lamba
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [nprob,n,x2,x0] = init2(NO)

%global FIRSTIME

switch NO
    %% nprob='problem1'; cuter
    case 1
        nprob='problem1';
        n=10000;
        %         x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        
        %% nprob='problem1'; cuter
    case 2
        nprob='problem1';
        n=10000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        
        %% nprob='problem1'; cuter
    case 3
        nprob='problem1';
        n=10000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        
        %% nprob='problem1'; cuter
    case 4
        nprob='problem1';
        n=10000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        
        %% nprob='problem1'; cuter
    case 5
        nprob='problem1';
        n=10000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        
        %% nprob='problem1'; cuter
    case 6
        nprob='problem1';
        n=10000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        
        %% nprob='problem1'; cuter
    case 7
        nprob='problem1';
        n=10000;
        %         x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        
        %% nprob='problem1'; cuter
    case 8
        nprob='problem1';
        n=50000;
        %         x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %x0=ones(n,1);
        
        %% nprob='problem1'; cuter
    case 9
        nprob='problem1';
        n=50000;
        %          x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        
        %% nprob='problem1'; cuter
    case 10
        nprob='problem1';
        n=50000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        
        %% nprob='problem1'; cuter
    case 11
        nprob='problem1';
        n=50000;
        %       x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        
        %% nprob='problem1'; cuter
    case 12
        nprob='problem1';
        n=50000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        
        %% nprob='problem1'; cuter
    case 13
        nprob='problem1';
        n=50000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        
        %% nprob='problem1'; cuter
    case 14
        nprob='problem1';
        n=50000;
        %         x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        
        %% nprob='problem1'; cuter
    case 15
        nprob='problem1';
        n=100000;
        %         x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %x0=ones(n,1);
        
        %% nprob='problem1'; cuter
    case 16
        nprob='problem1';
        n=100000;
        %          x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        
        %% nprob='problem1'; cuter
    case 17
        nprob='problem1';
        n=100000;
        %        x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        
        %% nprob='problem1'; cuter
    case 18
        nprob='problem1';
        n=100000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        
        %% nprob='problem1'; cuter
    case 19
        nprob='problem1';
        n=100000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        
        %% nprob='problem1'; cuter
    case 20
        nprob='problem1';
        n=100000;
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        
        %% nprob='problem1'; cuter
    case 21
        nprob='problem1';
        n=100000;
        %         x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        
        %% nprob='problem2'; cuter
    case 22
        nprob='problem2';
        n=10000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 23
        nprob='problem2';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 24
        nprob='problem2';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 25
        nprob='problem2';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 26
        nprob='problem2';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 27
        nprob='problem2';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 28
        nprob='problem2';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem2'; cuter
    case 29
        nprob='problem2';
        n=50000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 30
        nprob='problem2';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 31
        nprob='problem2';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 32
        nprob='problem2';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 33
        nprob='problem2';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 34
        nprob='problem2';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 35
        nprob='problem2';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        % x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem2'; cuter
    case 36
        nprob='problem2';
        n=100000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 37
        nprob='problem2';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 38
        nprob='problem2';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 39
        nprob='problem2';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 40
        nprob='problem2';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 41
        nprob='problem2';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem2'; cuter
    case 42
        nprob='problem2';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem3'; cuter
    case 43
        nprob='problem3';
        n=10000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 44
        nprob='problem3';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 45
        nprob='problem3';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 46
        nprob='problem3';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 47
        nprob='problem3';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 48
        nprob='problem3';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 49
        nprob='problem3';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem3'; cuter
    case 50
        nprob='problem3';
        n=50000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 51
        nprob='problem3';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 52
        nprob='problem3';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 53
        nprob='problem3';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 54
        nprob='problem3';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 55
        nprob='problem3';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 56
        nprob='problem3';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %  x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem3'; cuter
    case 57
        nprob='problem3';
        n=100000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 58
        nprob='problem3';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 59
        nprob='problem3';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 60
        nprob='problem3';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 61
        nprob='problem3';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 62
        nprob='problem3';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem3'; cuter
    case 63
        nprob='problem3';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        % x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %     %% nprob='problem4'; cuter
    case 64
        nprob='problem4';
        n=10000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 65
        nprob='problem4';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 66
        nprob='problem4';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 67
        nprob='problem4';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 68
        nprob='problem4';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 69
        nprob='problem4';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 70
        nprob='problem4';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem4'; cuter
    case 71
        nprob='problem4';
        n=50000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 72
        nprob='problem4';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 73
        nprob='problem4';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 74
        nprob='problem4';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 75
        nprob='problem4';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 76
        nprob='problem4';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 77
        nprob='problem4';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        % x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem4'; cuter
    case 78
        nprob='problem4';
        n=100000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 79
        nprob='problem4';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 80
        nprob='problem4';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 81
        nprob='problem4';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 82
        nprob='problem4';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 83
        nprob='problem4';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem4'; cuter
    case 84
        nprob='problem4';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem5'; cuter
    case 85
        nprob='problem5';
        n=10000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 86
        nprob='problem5';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 87
        nprob='problem5';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 88
        nprob='problem5';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 89
        nprob='problem5';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 90
        nprob='problem5';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 91
        nprob='problem5';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem5'; cuter
    case 92
        nprob='problem5';
        n=50000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 93
        nprob='problem5';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 94
        nprob='problem5';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 95
        nprob='problem5';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 96
        nprob='problem5';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 97
        nprob='problem5';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 98
        nprob='problem5';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        % x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem5'; cuter
    case 99
        nprob='problem5';
        n=100000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 100
        nprob='problem5';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 101
        nprob='problem5';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 102
        nprob='problem5';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 103
        nprob='problem5';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 104
        nprob='problem5';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem5'; cuter
    case 105
        nprob='problem5';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem6'; cuter
    case 106%64%
        nprob='problem6';
        n=10000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 107%65
        nprob='problem6';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 108%66%
        nprob='problem6';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 109%67%
        nprob='problem6';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 110%68%
        nprob='problem6';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 111%69%
        nprob='problem6';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 112%70%
        nprob='problem6';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem6'; cuter
    case 113%71%
        nprob='problem6';
        n=50000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 114%72%
        nprob='problem6';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 115%73%
        nprob='problem6';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 116%74%
        nprob='problem6';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 117%75%
        nprob='problem6';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 118%76%
        nprob='problem6';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 119%77%
        nprob='problem6';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        % x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem6'; cuter
    case 120%78%
        nprob='problem6';
        n=100000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 121%79%
        nprob='problem6';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 122%80%
        nprob='problem6';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 123%81%
        nprob='problem6';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 124%82%
        nprob='problem6';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 125%83%
        nprob='problem6';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem6'; cuter
    case 126%84%
        nprob='problem6';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        % x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem7'; cuter
    case 127%85%64%
        nprob='problem7';
        n=10000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 128%86%65%
        nprob='problem7';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 129%87%66%
        nprob='problem7';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 130%88%67%
        nprob='problem7';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 131%89%68%
        nprob='problem7';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 132%90%69%
        nprob='problem7';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 133%91%70%
        nprob='problem7';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem7'; cuter
    case 134%92%71%
        nprob='problem7';
        n=50000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 135%93%72%
        nprob='problem7';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 136%94%73%
        nprob='problem7';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 137%95%74%
        nprob='problem7';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 138%96%75%
        nprob='problem7';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 139%97%76%
        nprob='problem7';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 140%98%77%
        nprob='problem7';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        % x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem7'; cuter
    case 141%99%78%
        nprob='problem7';
        n=100000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 142%100%79%
        nprob='problem7';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 143%101%80%
        nprob='problem7';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 144%102%81%
        nprob='problem7';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 145%103%82%
        nprob='problem7';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 146%104%83%
        nprob='problem7';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem7'; cuter
    case 147%105%84%
        nprob='problem7';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem8'; cuter
    case 148%106%85
        nprob='problem8';
        n=10000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 149%107%86
        nprob='problem8';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 150%108%87%
        nprob='problem8';
        n=10000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 151%109%88%
        nprob='problem8';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 152%110%89%
        nprob='problem8';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 153%111%90%
        nprob='problem8';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 154%112%91%
        nprob='problem8';
        n=10000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem8'; cuter
    case 155%113%92%
        nprob='problem8';
        n=50000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 156%114%93%
        nprob='problem8';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 157%115%94%
        nprob='problem8';
        n=50000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 158%116%95%
        nprob='problem8';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 159%117%96%
        nprob='problem8';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 160%118%97%
        nprob='problem8';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 161%119%98%
        nprob='problem8';
        n=50000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1-i/n;
        %         end
        % x0=ones(n,1)./10;
        x2=rand(n,1);
        x0 = x2;
        %% nprob='problem8'; cuter
    case 162%120%99%
        nprob='problem8';
        n=100000;
        %         x0=ones(n,1);
        %     x0=ones(n,1)./5;
        x2=ones(n,1)./10;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 163%121%100%
        nprob='problem8';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=1/3;
        %         for i=1:n-1
        %             x0(i+1)=1/3*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./5;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 164%122%101%
        nprob='problem8';
        n=100000;
        %         x0=ones(n,1);
        %         x0(1)=0.5;
        %         for i=1:n-1
        %             x0(i+1)=0.5*x0(i);
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1)./2;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 165%123%102%
        nprob='problem8';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=(i-1)/n;
        %         end
        %     x0=ones(n,1)./10;
        x2=ones(n,1).*1;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 166%124%103%
        nprob='problem8';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=1/i;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*1.5;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 167%125%104%
        nprob='problem8';
        n=100000;
        %         x0=ones(n,1);
        %         for i=1:n
        %             x0(i)=i/n;
        %         end
        %         x0=ones(n,1)./10;
        x2=ones(n,1).*2;
        x0 = x2;
        %% nprob='problem8'; cuter
    case 168%126%105%
        nprob='problem8';
        n=100000;
        x2=rand(n,1);
        x0 = x2;
        %% 以下是伪单调算例
    case 169
        nprob='problem9';
        
        x0 = [10;10];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem9';
    case 170
        nprob='problem9';
        x0 = [-10;-10];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem9';
    case 171
        nprob='problem9';
        x0 = [1;1];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem9';
    case 172
        nprob='problem9';
        x0 = [-1;-1];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem9';
    case 173
        nprob='problem9';
        x0 = [0.1;0.1];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem9';
    case 174
        nprob='problem9';
        x0 = [1;0.5];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem9';
    case 175
        nprob='problem9';
        x0 = [0.5;1];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem9';
    case 176
        nprob='problem9';
        x0 = [0.5;0];
        x2= x0;
        [n,~] = size(x0) ;
        
    case 177
        nprob='problem11';
        x0 = [1;1;1];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem11';
    case 178
        nprob='problem11';
        x0 = [-1;-1;-1];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem11';
    case 179
        nprob='problem11';
        x0 = [0.1;0.1;0.1];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem11';
    case 180
        nprob='problem11';
        x0 = [1;0.5;1/3];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem11';
    case 181
        nprob='problem11';
        x0 = [1/3;2/3;1];
        x2= x0;
        [n,~] = size(x0) ;
        %% nprob='problem11';
    case 182
        nprob='problem11';
        x0 = [2/3;1/3;0];
        x2= x0;
        [n,~] = size(x0) ;
        
end