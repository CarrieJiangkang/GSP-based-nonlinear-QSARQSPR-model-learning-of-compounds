% %①性质-S
% P = which('C8_Properties.xls');  %性质
% [num_C8,tx_C8,raw_S] = xlsread(P);
% raw_c8 = raw_S;  %保持原来的
% raw_S(1,:) = [];
% % C8_BP = raw_S(:,3);%取BP的值
% % C8_BP = cell2mat(C8_BP);
% C8_S = raw_S(:,7);%取S的值
% % C8_S = raw_S(:,end);%MV
% C8_S = cell2mat(C8_S);
% % % C8_S = sort(C8_S);
% % % C8_TSA = raw_S(:,16);%取TSA的值
% % % C8_TSA = cell2mat(C8_TSA);
% %②关于C8的描述符数量
% P_des = which('C8_Descriptors.xls');
% [des_num,des_txt,raw_des] = xlsread(P_des);
% des_C8 = raw_des;
% des_C8(:,1:3) = [];
% des_C8([1,20,21],:) = [];  %18*102的描述符
% des_C8 = cell2mat(des_C8);
%% **************************************************************
% % Phenet数据集
% P = which('Phenet_Properties.xls');
% [phenet_num,phenet_txt,phenet_2] = xlsread(P);
% raw_act = phenet_2;  %保持原来的
% phenet_2(1,:) = [];
% phenet_act = phenet_2(:,4);%取活性值
% phenet_act = cell2mat(phenet_act);
% % 关于Phenet的描述符数量
% P_des = which('Phenet_Descriptors.xls');
% [num_des,txt_des,raw_des] = xlsread(P_des);
% des_Phenet = raw_des;
% des_Phenet(:,1:3) = [];
% des_Phenet(1,:) = [];  
% des_Phenet = cell2mat(des_Phenet);
% x_x = des_Phenet(:,[15,53]);
% %由于后期要运用MSD描述符和S3K描述符，所以在110个化合物中先删除
% des_Phenet(:,[15,53]) = [];
%% **************************************************************
%% PCB数据集
P = which('PCB_Properties.xls');  %性质
[num_LogP,txt_LogP,raw_LogP] = xlsread(P);
raw_LogP = raw_LogP;  %保持原来的
raw_LogP(1,:) = [];
PCB_logP = raw_LogP(:,6);%取LogP的值   6    TSA  7
PCB_logP = cell2mat(PCB_logP);
% 关于PCB的  描述符数量
P_des = which('PCB_Descriptors.xls');  %描述符
[num_PCB,txt_PCB,raw_PCB] = xlsread(P_des);
des_PCB = raw_PCB;
des_PCB(:,1:3) = [];
des_PCB(1,:) = [];  
des_PCB = cell2mat(des_PCB);
% 删除性质中没有的化合物且和对应的描述符 -999
id = find(PCB_logP == -999);  
PCB_logP(id,:) = [];   
des_PCB(id,:) = [];  
%添加新的特征
new_fea = des_PCB(:,[47,15,20,50,104]);
des_PCB(:,[10,11,15,20,21,23,29,31,34,42,47,50,51,104])=[];
