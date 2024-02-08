% init 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [nprob,n,m,x0]=initf(nprob)
% This function sets n,m, and the standard starting    
% point based on the nprob and returns it to initpt     
% function.                                                                                                    
% Created on 10/30/94 by Madhu Lamba                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [nprob,n] = init(NO)

%global FIRSTIME

switch NO
    %% nprob='problem1'; cuter
      case 1
        nprob='problem1';
        n=1000;
%         x0=ones(n,1);
    
    %% nprob='problem1'; cuter
      case 2
        nprob='problem1';
        n=3000;
%         x0=ones(n,1);

    %% nprob='problem1'; cuter
      case 3
        nprob='problem1';
        n=5000;
%         x0=0.1*ones(n,1);
        
    %% nprob='problem1'; cuter
      case 4
        nprob='problem1';
        n=8000;
%         x0=ones(n,1);
%         x0(1)=0.5;
%         for i=1:n-1
%             x0(i+1)=0.5*x0(i);
%         end
        
    %% nprob='problem1'; cuter
      case 5
        nprob='problem1';
        n=10000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=(i-1)/n;
%         end
    
    %% nprob='problem1'; cuter
      case 6
        nprob='problem1';
        n=30000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=1/i;
%         end
        
    %% nprob='problem1'; cuter
      case 7
        nprob='problem1';
        n=50000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=i/n;
% %         end
%         
%     %% nprob='problem1'; cuter
%       case 7
%         nprob='problem1';
%         n=50000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=1-i/n;
% %         end
%     
    %% nprob='problem1'; cuter
      case 8
        nprob='problem1';
        n=80000;
% %         x0=ones(n,1);
%     
    %% nprob='problem1'; cuter
      case 9
        nprob='problem1';
        n=100000;
% %         x0=0.1*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 10
        nprob='problem2';
        n=1000;
%         x0=ones(n,1);
    
    %% nprob='problem2'; cuter
      case 11
        nprob='problem2';
        n=3000;
%         x0=0.1*ones(n,1);
        
    %% nprob='problem2'; cuter
      case 12
        nprob='problem2';
        n=5000;
%         x0=ones(n,1);
%         x0(1)=0.5;
%         for i=1:n-1
%             x0(i+1)=0.5*x0(i);
%         end
        
    %% nprob='problem2'; cuter
      case 13
        nprob='problem2';
        n=8000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=(i-1)/n;
%         end
    
    %% nprob='problem2'; cuter
      case 14
        nprob='problem2';
        n=10000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=1/i;
%         end
        
    %% nprob='problem2'; cuter
      case 15
        nprob='problem2';
        n=30000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=i/n;
% %         end
%         
    %% nprob='problem2'; cuter
      case 16
        nprob='problem2';
        n=50000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=1-i/n;
% %         end
%     
    %% nprob='problem2'; cuter
      case 17
        nprob='problem2';
        n=80000;
% %         x0=ones(n,1);
%     
    %% nprob='problem2'; cuter
      case 18
        nprob='problem2';
        n=100000;
% %         x0=0.1*ones(n,1);

    %% nprob='problem3'; cuter
      case 19
        nprob='problem3';
        n=1000;
%         x0=ones(n,1);
    
    %% nprob='problem3'; cuter
      case 20
        nprob='problem3';
        n=3000;
%         x0=0.1*ones(n,1);
        
    %% nprob='problem3'; cuter
      case 21
        nprob='problem3';
        n=5000;
%         x0=ones(n,1);
%         x0(1)=0.5;
%         for i=1:n-1
%             x0(i+1)=0.5*x0(i);
%         end
        
    %% nprob='problem3'; cuter
      case 22
        nprob='problem3';
        n=8000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=(i-1)/n;
%         end
    
    %% nprob='problem3'; cuter
      case 23
        nprob='problem3';
        n=10000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=1/i;
%         end
        
    %% nprob='problem3'; cuter
      case 24
        nprob='problem3';
        n=30000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=i/n;
% %         end
%         
    %% nprob='problem3'; cuter
      case 25
        nprob='problem3';
        n=50000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=1-i/n;
% %         end
%     
    %% nprob='problem3'; cuter
      case 26
        nprob='problem3';
        n=80000;
% %         x0=ones(n,1);
%     
    %% nprob='problem3'; cuter
      case 27
        nprob='problem3';
        n=100000;
% %         x0=0.1*ones(n,1);

    %% nprob='problem4'; cuter
      case 28
        nprob='problem4';
        n=1000;
%         x0=ones(n,1);
    
    %% nprob='problem4'; cuter
      case 29
        nprob='problem4';
        n=3000;
%         x0=0.1*ones(n,1);
        
    %% nprob='problem4'; cuter
      case 30
        nprob='problem4';
        n=5000;
%         x0=ones(n,1);
%         x0(1)=0.5;
%         for i=1:n-1
%             x0(i+1)=0.5*x0(i);
%         end
        
    %% nprob='problem4'; cuter
      case 31
        nprob='problem4';
        n=8000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=(i-1)/n;
%         end
    
    %% nprob='problem4'; cuter
      case 32
        nprob='problem4';
        n=10000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=1/i;
%         end
        
    %% nprob='problem4'; cuter
      case 33
        nprob='problem4';
        n=30000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=i/n;
% %         end
%         
    %% nprob='problem4'; cuter
      case 34
        nprob='problem4';
        n=50000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=1-i/n;
% %         end
%     
    %% nprob='problem4'; cuter
      case 35
        nprob='problem4';
        n=80000;
% %         x0=ones(n,1);
%     
    %% nprob='problem4'; cuter
      case 36
        nprob='problem4';
        n=100000;
% %         x0=0.1*ones(n,1);

    %% nprob='problem5'; cuter
      case 37
        nprob='problem5';
        n=1000;
%         x0=ones(n,1);
    
    %% nprob='problem5'; cuter
      case 38
        nprob='problem5';
        n=3000;
%         x0=0.1*ones(n,1);
        
    %% nprob='problem5'; cuter
      case 39
        nprob='problem5';
        n=5000;
%         x0=ones(n,1);
%         x0(1)=0.5;
%         for i=1:n-1
%             x0(i+1)=0.5*x0(i);
%         end
        
    %% nprob='problem5'; cuter
      case 40
        nprob='problem5';
        n=8000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=(i-1)/n;
%         end
    
    %% nprob='problem5'; cuter
      case 41
        nprob='problem5';
        n=10000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=1/i;
%         end
        
    %% nprob='problem5'; cuter
      case 42
        nprob='problem5';
        n=30000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=i/n;
% %         end
%         
    %% nprob='problem5'; cuter
      case 43
        nprob='problem5';
        n=50000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=1-i/n;
% %         end
%     
    %% nprob='problem5'; cuter
      case 44
        nprob='problem5';
        n=80000;
% %         x0=ones(n,1);
%     
    %% nprob='problem5'; cuter
      case 45
        nprob='problem5';
        n=100000;
% %         x0=0.1*ones(n,1);

    %% nprob='problem6'; cuter
      case 46
        nprob='problem6';
        n=1000;
%         x0=ones(n,1);
    
    %% nprob='problem6'; cuter
      case 47
        nprob='problem6';
        n=3000;
%         x0=0.1*ones(n,1);
        
    %% nprob='problem6'; cuter
      case 48
        nprob='problem6';
        n=5000;
%         x0=ones(n,1);
%         x0(1)=0.5;
%         for i=1:n-1
%             x0(i+1)=0.5*x0(i);
%         end
        
    %% nprob='problem6'; cuter
      case 49
        nprob='problem6';
        n=8000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=(i-1)/n;
%         end
    
    %% nprob='problem6'; cuter
      case 50
        nprob='problem6';
        n=10000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=1/i;
%         end
        
    %% nprob='problem6'; cuter
      case 51
        nprob='problem6';
        n=30000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=i/n;
% %         end
%         
    %% nprob='problem6'; cuter
      case 52
        nprob='problem6';
        n=50000;
% %         x0=ones(n,1);
% %         for i=1:n
% %             x0(i)=1-i/n;
% %         end
%     
    %% nprob='problem6'; cuter
      case 53
        nprob='problem6';
        n=80000;
% %         x0=ones(n,1);
%     
    %% nprob='problem6'; cuter
      case 54
        nprob='problem6';
        n=100000;
% %         x0=0.1*ones(n,1);

    %% nprob='problem7'; cuter
      case 55
        nprob='problem7';
        n=1000;
%         x0=ones(n,1);
    
    %% nprob='problem7'; cuter
      case 56
        nprob='problem7';
        n=3000;
%         x0=0.1*ones(n,1);
        
    %% nprob='problem7'; cuter
      case 57
        nprob='problem7';
        n=5000;
%         x0=ones(n,1);
%         x0(1)=0.5;
%         for i=1:n-1
%             x0(i+1)=0.5*x0(i);
%         end
        
    %% nprob='problem7'; cuter
      case 58
        nprob='problem7';
        n=8000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=(i-1)/n;
%         end
    
    %% nprob='problem7'; cuter
      case 59
        nprob='problem7';
        n=10000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=1/i;
%         end
 
    %% nprob='problem7'; cuter
      case 60
        nprob='problem7';
        n=30000;

    %% nprob='problem7'; cuter
      case 61
        nprob='problem7';
        n=50000;
        
    %% nprob='problem7'; cuter
      case 62
        nprob='problem7';
        n=80000;
        
    %% nprob='problem7'; cuter
      case 63
        nprob='problem7';
        n=100000;

%% nprob='problem8'; cuter
      case 64
        nprob='problem8';
        n=1000;
%         x0=ones(n,1);
    
    %% nprob='problem8'; cuter
      case 65
        nprob='problem8';
        n=3000;
%         x0=0.1*ones(n,1);
        
    %% nprob='problem8'; cuter
      case 66
        nprob='problem8';
        n=5000;
%         x0=ones(n,1);
%         x0(1)=0.5;
%         for i=1:n-1
%             x0(i+1)=0.5*x0(i);
%         end
        
    %% nprob='problem8'; cuter
      case 67
        nprob='problem8';
        n=8000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=(i-1)/n;
%         end
    
    %% nprob='problem8'; cuter
      case 68
        nprob='problem8';
        n=10000;
%         x0=ones(n,1);
%         for i=1:n
%             x0(i)=1/i;
%         end
 
    %% nprob='problem8'; cuter
      case 69
        nprob='problem8';
        n=30000;
        
    %% nprob='problem8'; cuter
      case 70
        nprob='problem8';
        n=50000;
        
    %% nprob='problem8'; cuter
      case 71
        nprob='problem8';
        n=80000;
        
    %% nprob='problem8'; cuter
      case 72
        nprob='problem8';
        n=100000;

    %% nprob='problem9'; cuter
      case 73
        nprob='problem9';
        n=1000;
    
    %% nprob='problem9'; cuter
      case 74
        nprob='problem9';
        n=3000;
        
    %% nprob='problem9'; cuter
      case 75
        nprob='problem9';
        n=5000;
        
    %% nprob='problem9'; cuter
      case 76
        nprob='problem9';
        n=8000;
    
    %% nprob='problem9'; cuter
      case 77
        nprob='problem9';
        n=10000;
        
    %% nprob='problem9'; cuter
      case 78
        nprob='problem9';
        n=30000;
        
    %% nprob='problem9'; cuter
      case 79
        nprob='problem9';
        n=50000;
        
    %% nprob='problem9'; cuter
      case 80
        nprob='problem9';
        n=80000;
        
    %% nprob='problem9'; cuter
      case 81
        nprob='problem9';
        n=100000;
        
    %% nprob='problem10'; cuter
      case 82
        nprob='problem10';
        n=1000;
    
    %% nprob='problem10'; cuter
      case 83
        nprob='problem10';
        n=3000;
        
    %% nprob='problem10'; cuter
      case 84
        nprob='problem10';
        n=5000;
        
    %% nprob='problem10'; cuter
      case 85
        nprob='problem10';
        n=8000;
    
    %% nprob='problem10'; cuter
      case 86
        nprob='problem10';
        n=10000;
        
    %% nprob='problem10'; cuter
      case 87
        nprob='problem10';
        n=30000;
        
    %% nprob='problem10'; cuter
      case 88
        nprob='problem10';
        n=50000;
        
    %% nprob='problem10'; cuter
      case 89
        nprob='problem10';
        n=80000;
        
    %% nprob='problem10'; cuter
      case 90
        nprob='problem10';
        n=100000;
        
    %% nprob='problem11'; cuter
      case 91
        nprob='problem11';
        n=1000;
    
    %% nprob='problem11'; cuter
      case 92
        nprob='problem11';
        n=3000;
        
    %% nprob='problem11'; cuter
      case 93
        nprob='problem11';
        n=5000;
        
    %% nprob='problem11'; cuter
      case 94
        nprob='problem11';
        n=8000;
    
    %% nprob='problem11'; cuter
      case 95
        nprob='problem11';
        n=10000;
        
    %% nprob='problem11'; cuter
      case 96
        nprob='problem11';
        n=30000;
        
    %% nprob='problem11'; cuter
      case 97
        nprob='problem11';
        n=50000;
        
    %% nprob='problem11'; cuter
      case 98
        nprob='problem11';
        n=80000;
        
    %% nprob='problem11'; cuter
      case 99
        nprob='problem11';
        n=100000;

    %% nprob='problem12'; cuter
      case 100
        nprob='problem12';
        n=1000;
    
    %% nprob='problem12'; cuter
      case 101
        nprob='problem12';
        n=3000;
        
    %% nprob='problem12'; cuter
      case 102
        nprob='problem12';
        n=5000;
        
    %% nprob='problem12'; cuter
      case 103
        nprob='problem12';
        n=8000;
    
    %% nprob='problem12'; cuter
      case 104
        nprob='problem12';
        n=10000;
        
    %% nprob='problem12'; cuter
      case 105
        nprob='problem12';
        n=30000;
        
    %% nprob='problem12'; cuter
      case 106
        nprob='problem12';
        n=50000;
        
    %% nprob='problem12'; cuter
      case 107
        nprob='problem12';
        n=80000;
        
    %% nprob='problem12'; cuter
      case 108
        nprob='problem12';
        n=100000;
        
    %% nprob='problem13'; cuter
      case 109
        nprob='problem13';
        n=1000;
    
    %% nprob='problem13'; cuter
      case 110
        nprob='problem13';
        n=3000;
        
    %% nprob='problem13'; cuter
      case 111
        nprob='problem13';
        n=5000;
        
    %% nprob='problem13'; cuter
      case 112
        nprob='problem13';
        n=8000;
    
    %% nprob='problem13'; cuter
      case 113
        nprob='problem13';
        n=10000;
        
    %% nprob='problem13'; cuter
      case 114
        nprob='problem13';
        n=30000;
        
    %% nprob='problem13'; cuter
      case 115
        nprob='problem13';
        n=50000;
        
    %% nprob='problem13'; cuter
      case 116
        nprob='problem13';
        n=80000;
        
    %% nprob='problem13'; cuter
      case 117
        nprob='problem13';
        n=100000;
        
    %% nprob='problem14'; cuter
      case 118
        nprob='problem14';
        n=1000;
    
    %% nprob='problem14'; cuter
      case 119
        nprob='problem14';
        n=3000;
        
    %% nprob='problem14'; cuter
      case 120
        nprob='problem14';
        n=5000;
        
    %% nprob='problem14'; cuter
      case 121
        nprob='problem14';
        n=8000;
    
    %% nprob='problem14'; cuter
      case 122
        nprob='problem14';
        n=10000;
        
    %% nprob='problem14'; cuter
      case 123
        nprob='problem14';
        n=30000;
        
    %% nprob='problem14'; cuter
      case 124
        nprob='problem14';
        n=50000;
        
    %% nprob='problem14'; cuter
      case 125
        nprob='problem14';
        n=80000;
        
    %% nprob='problem14'; cuter
      case 126
        nprob='problem14';
        n=100000;
        
    %% nprob='problem15'; cuter
      case 127
        nprob='problem15';
        n=1000;
    
    %% nprob='problem15'; cuter
      case 128
        nprob='problem15';
        n=3000;
        
    %% nprob='problem15'; cuter
      case 129
        nprob='problem15';
        n=5000;
        
    %% nprob='problem15'; cuter
      case 130
        nprob='problem15';
        n=8000;
    
    %% nprob='problem15'; cuter
      case 131
        nprob='problem15';
        n=10000;
        
    %% nprob='problem15'; cuter
      case 132
        nprob='problem15';
        n=30000;
        
    %% nprob='problem15'; cuter
      case 133
        nprob='problem15';
        n=50000;
        
    %% nprob='problem15'; cuter
      case 134
        nprob='problem15';
        n=80000;
        
    %% nprob='problem15'; cuter
      case 135
        nprob='problem15';
        n=100000;

end