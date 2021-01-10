%---------------------------------------------------------------------%
%  Salp Swarm Algorithm (SSA) source codes demo version               %
%---------------------------------------------------------------------%


%---Inputs-----------------------------------------------------------
% feat     : feature vector ( Instances x Features )
% label    : label vector ( Instances x 1 )
% N        : Number of salps
% max_Iter : Maximum number of iterations

%---Output-----------------------------------------------------------
% sFeat    : Selected features (instances x features)
% Sf       : Selected feature index
% Nf       : Number of selected features
% curve    : Convergence curve
%--------------------------------------------------------------------


%% Salp Swarm Algorithm
clc, clear, close; 
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho);

% Parameter setting
N        = 10;
max_Iter = 100; 

% Salp Swarm Algorithm
[sFeat,Sf,Nf,curve] = jSSA(feat,label,N,max_Iter,HO);

% Plot convergence curve
plot(1:max_Iter,curve);
xlabel('Number of iterations');
ylabel('Fitness Value');
title('SSA'); grid on;




