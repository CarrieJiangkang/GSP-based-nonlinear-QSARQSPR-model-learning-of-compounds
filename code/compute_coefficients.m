% N=size(A,1);
% C=full(A);C=max(C,C');
% labels = cellstr(int2str((1:N)'));
% G = graph(C,labels);
% plot(G,'XData',position(:,1),'YData',position(:,2),'ZData',position(:,3))


% 
% p=which('F:\Dataset0512\Dataset\Dataset\txt_data\c8\C8_01.mat');
% filelist=dir([fileparts(p) filesep 'C8_*.mat']);
% p=which('G:\Dataset0512\Dataset\Dataset\txt_data\pah\PAH-L001.mat');
% filelist=dir([fileparts(p) filesep 'PAH-*.mat']);
% p=which('F:\Dataset0512\Dataset\Dataset\txt_data\pcb\PCB_001.mat');
% filelist=dir([fileparts(p) filesep 'PCB_*.mat']);
p=which('F:\Dataset0512\Dataset\Dataset\txt_data\phenet\PHENET-01.mat');
filelist=dir([fileparts(p) filesep 'PHENET-*.mat']);

% clear merge
filenames={filelist.name}';
K=length(filenames);
all_sc_eigen_value = [];
all_SC_energy = [];
all_eigen_value = [];
for h=1:K
    W = W_all(h);
    A = A_all(h);
%     sc = cell2mat(sc_all(h));
    load(filenames{h});
    name = filenames{h};
    
%     %% 0¡¢compute distance matrix
%     Distance_Matrix = all_shortest_paths(W);
%     
%     %% 1¡¢compute degree
% %     A=max(A,A');
% %     adj=full(A);
% %     Degree=diag(sum(adj,1));
%     
%     %% 2¡¢compute Stress centrality
%     % It is used to descibe the number of geodesic paths that pass through the ith node.
%     Stress_Centrality = my_stress_centrality(W);
%     
%     %% 3¡¢compute betweenness_centrality
%     % it is used to describe the ratio of paths that pass through the ith node.
%     % High betweenness node can serve as a broker similar to stress centrality.
%     % [bc,E] = betweenness_centrality(A,struct('edge_weight',edge_weight_vector(As,A)))
%     % [bc,E] = betweenness_centrality(A,struct('undirected',1))   %ÎÞÏòÍ¼
%     Betweenness_Centrality = betweenness_centrality(W);
%     
%     %% 4¡¢compute clustering coefficients
%     % it desceibes how well a node is connected with its neighbors.If it is
%     % fully connected to its neighbors, the clustering coefficient is 1. It was
%     % used to describe hierarchical properties of networks.
%     Clustering_Coefficients = clustering_coefficients(W);
%     
%     %% 5¡¢compute global efficiency and vulnerability
%     % It measures the effect of node i on the system performance if node i and
%     % all associated links are removed.
%     Vulnerability = my_vulnerability_efficiency(W);
    
    %% complete eigen-decomposition
    A=max(A,A');
    adj=full(A);
    D=diag(sum(adj,1));
    L=D-adj;
    [eigen_vector,eigen_value]=eig(L);
    eigen_value = diag(eigen_value);
    all_eigen_value{h} = eigen_value;
    
    [sc_eigen_vector,sc_eigen_value]=eig(sc_all{h});
    sc_eigen_value = diag(sc_eigen_value);
    all_sc_eigen_value{h} = sc_eigen_value;
    SC_energy = sum(abs(sc_eigen_value));
    all_SC_energy{h} = SC_energy;

%     Lnorm=D^(-0.5)*L*D^(-0.5);
%     [norm_eigen_vector,norm_eigen_value]=eig(Lnorm);
%     norm_eigen_value = diag(norm_eigen_value);
    
%     %% merge 4 coefficients, Clustering_Coefficients±»ÌÞ³ý
%     merge = [eigen_value,Betweenness_Centrality,Stress_Centrality,Vulnerability];
    
%     Laplacian_energy = sum(abs(eigen_value-mean(eigen_value)));
%     norm_Laplacian_energy = sum(abs(norm_eigen_value-mean(norm_eigen_value)));
%     BC = sum(max(Betweenness_Centrality)-Betweenness_Centrality);
%     SC = sum(max(Stress_Centrality)-Stress_Centrality);
%     AV = mean(Vulnerability);
%     CC = mean(Clustering_Coefficients);
%     merge = [merge; Laplacian_energy,norm_Laplacian_energy,BC,SC,AV,CC];
    
    
%     save(name,'Distance_Matrix','Stress_Centrality','Betweenness_Centrality','Clustering_Coefficients',...
%         'Vulnerability','eigen_value','eigen_vector','all_sc_eigen_value','merge','-append')
%     save('eigen_value','eigen_vector')
end
all_SC_energy = cell2mat(all_SC_energy);
all_SC_energy = all_SC_energy';
% all_SC_energy(id,:)=[];