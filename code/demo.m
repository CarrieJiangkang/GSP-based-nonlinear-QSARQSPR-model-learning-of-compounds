X = y';
Y = MDS_LogP(:,end); 
[beta,resnorm] = fit_nonlinear_data(X,Y);


% beta = zeros(1,37);
% beta(0) = zeros(1,37);
% for s=1:37
%      beta_s = beta(s);
%      beta = [beta beta_s];
% end
