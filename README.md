# Salp Swarm Algorithm for Feature Selection

[![View Salp Swarm Algorithm for Feature Selection on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/78913-salp-swarm-algorithm-for-feature-selection)
[![License](https://img.shields.io/badge/license-BSD_3-yellow.svg)](https://github.com/JingweiToo/Salp-Swarm-Algorithm-for-Feature-Selection/blob/main/LICENSE)
[![GitHub release](https://img.shields.io/badge/release-1.1-green.svg)](https://github.com/JingweiToo/Salp-Swarm-Algorithm-for-Feature-Selection)

![Wheel](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/130a441a-9a21-4030-b8c1-4d7b75809b1f/84e421c9-2e3f-4c77-af21-3f28f481bcff/images/1596628050.JPG)


## Introduction
* This toolbox offers a Salp Swarm Algorithm ( SSA ) method
* The `Main` script illustrates the example of how SSA can solve the feature selection problem using benchmark dataset.


## Input
* *`feat`*     : feature vector ( Instances *x* Features )
* *`label`*    : label vector ( Instances *x* 1 )
* *`N`*        : number of salps
* *`max_Iter`* : maximum number of iterations

## Output
* *`sFeat`*    : selected features
* *`Sf`*       : selected feature index
* *`Nf`*       : number of selected features
* *`curve`*    : convergence curve


### Example
```code
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
```

## Requirement
* MATLAB 2014 or above
* Statistics and Machine Learning Toolbox

