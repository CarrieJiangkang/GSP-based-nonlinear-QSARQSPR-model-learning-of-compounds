% clear all; clc
p=which('F:\Dataset0512\Dataset\Dataset\txt_data\c8\C8_01.mat');
filelist=dir([fileparts(p) filesep 'C8_*.mat']);
% p=which('G:\Dataset0512\Dataset\Dataset\txt_data\pah\PAH-L001.mat');
% filelist=dir([fileparts(p) filesep 'PAH-*.mat']);
% p=which('F:\Dataset0512\Dataset\Dataset\txt_data\pcb\PCB_001.mat');
% filelist=dir([fileparts(p) filesep 'PCB_*.mat']);
% p=which('G:\Dataset0512\Dataset\Dataset\txt_data\phenet\PHENET-01.mat');
% filelist=dir([fileparts(p) filesep 'PHENET-*.mat']);

filenames={filelist.name}';
K=length(filenames);
% all_para = [];
all_Laplacian_energy = [];


for g=1:K
    load(filenames{g});
    name = filenames{g};
    eigen_value = all_eigen_value{g};
    
    %% graph energy
%     eigen_value=diag(eigen_value);
    graph_energy=sum(eigen_value);
    if eigen_value(1)<1e-10
        eigen_value(1)=0;
    end
    
    Laplacian_energy = sum(abs(eigen_value-mean(eigen_value)));
    all_Laplacian_energy{g} = Laplacian_energy;
    

%     [Ss,ISs,Ps,IPs] = spectra_based_descriptors(eigen_value,2);
%     spectra_descriptor = [Laplacian_energy,Ss,ISs];
%     save(name,'spectra_descriptor','-append')
    
%     %% compute QSPR parameter
%     all_para = [all_para; spectra_descriptor];
   
end
% all_spectra_descriptor = all_para;
% %  save  phenet_all_spectra_descriptor 'all_spectra_descriptor'
%  save  PAH_all_spectra_descriptor 'all_spectra_descriptor'
% %  save  C8_all_spectra_descriptor 'all_spectra_descriptor'
%  
%  % molecular descriptors derived by using the spectra of molecular matrices
% function [Ss,ISs,Ps,IPs] = spectra_based_descriptors(eigen_value,s)
% Ss=sum(eigen_value.^(1/s));
% ISs=1/Ss;
% Ps=prod(eigen_value.^(1/s));
% IPs=1/Ps;
% end
all_Laplacian_energy = cell2mat(all_Laplacian_energy);
all_Laplacian_energy = all_Laplacian_energy';

% all_Laplacian_energy(id,:)=[];
