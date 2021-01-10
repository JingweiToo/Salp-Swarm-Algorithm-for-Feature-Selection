function [sFeat,Sf,Nf,curve] = jSSA2(feat,label,N,max_Iter,HO)
lb    = 0;
ub    = 1;
thres = 0.5;

fun = @jFitnessFunction;
dim = size(feat,2); 
X   = zeros(N,dim); 
for i = 1:N
	for d = 1:dim
    X(i,d) = lb + (ub - lb) * rand();
  end
end
% Pre
fit   = zeros(1,N);
fitF  = inf;

curve = inf; 
t = 1;  
%---Iteration start----------------------------------------------------
while t <= max_Iter
  for i = 1:N
    fit(i) = fun(feat,label,(X(i,:) > thres),HO);
    if fit(i) < fitF
      Xf   = X(i,:);
      fitF = fit(i); 
    end
  end
  % Additional sort in the first iteration to improve the 
  % initial behavior by divide salps into leader and followers
  if t == 1
    [fit, idx] = sort(fit,'ascend');
    X          = X(idx,:); 
  end
	c1 = 2 * exp(-(4 * t / max_Iter) ^ 2);
	for i = 1:N
    if i == 1
      for d = 1:dim
        c2 = rand(); 
        c3 = rand();
        if c3 >= 0.5 
          X(i,d) = Xf(d) + c1 * ((ub - lb) * c2 + lb);
        else
          X(i,d) = Xf(d) - c1 * ((ub - lb) * c2 + lb);
        end
      end
    else
      for d = 1:dim
        X(i,d) = (X(i,d) + X(i-1,d)) / 2;
      end
    end
    XB = X(i,:);  XB(XB > ub) = ub;  XB(XB < lb) = lb;
    X(i,:) = XB;
  end
  curve(t) = fitF;
  fprintf('\nIteration %d Best (SSA)= %f',t,curve(t))
  t = t + 1;
end
Pos   = 1:dim;
Sf    = Pos((Xf > thres) == 1);
Nf    = length(Sf);
sFeat = feat(:,Sf); 
end




