% %%��ȡPAH����BP����
% P = which('PAH_Properties.xls');
% [num,txt,raw_2] = xlsread(P);
% raw_BP = raw_2;  %����ԭ����
% raw_2(1,:) = [];
% PAH_Log_P = raw_2(:,5);%ȡLog_P��ֵ 6
% % PAH_BP([14,19,22,23,28,32,33,35,42,43,44,45,46,47,51,52,53,54,55,56,57,58,59,60,61,71,72,81,82],:) = [];
% PAH_Log_P = cell2mat(PAH_Log_P);
% %����BP������������
% P_des = which('PAH_Descriptors.xls');
% [des_num,des_txt,raw_des] = xlsread(P_des);
% Des_Log_P = raw_des;
% Des_Log_P(:,1:3) = [];
% Des_Log_P(1,:) = []; 
% Des_Log_P = cell2mat(Des_Log_P);
% % ɾ��������û�еĻ������ҺͶ�Ӧ�������� -999
% id = find(PAH_Log_P == -999);
% PAH_Log_P(id,:) = [];  
% Des_Log_P(id,:) = [];  

% % Des_BP([14,19,22,23,28,32,33,35,42,43,44,45,46,47,51,52,53,54,55,56,57,58,59,60,61,71,72,81,82],:) = [];

%%**************************************************************
% %%����PAH����������Ч�����ã����Ի�C8���ݼ�
% %������-S
% P = which('C8_Properties.xls');  %����
% [num_C8,tx_C8,raw_S] = xlsread(P);
% raw_c8 = raw_S;  %����ԭ����
% raw_S(1,:) = [];
% % C8_BP = raw_S(:,3);%ȡBP��ֵ
% % C8_BP = cell2mat(C8_BP);
% C8_S = raw_S(:,7);%ȡS��ֵ
% % C8_S = raw_S(:,end);%MV
% C8_S = cell2mat(C8_S);
% % % C8_S = sort(C8_S);
% % % C8_TSA = raw_S(:,16);%ȡTSA��ֵ
% % % C8_TSA = cell2mat(C8_TSA);
% %�ڹ���C8������������
% P_des = which('C8_Descriptors.xls');
% [des_num,des_txt,raw_des] = xlsread(P_des);
% des_C8 = raw_des;
% des_C8(:,1:3) = [];
% des_C8([1,20,21],:) = [];  %18*102��������
% des_C8 = cell2mat(des_C8);
%% **************************************************************
% % Phenet���ݼ�
% P = which('Phenet_Properties.xls');
% [phenet_num,phenet_txt,phenet_2] = xlsread(P);
% raw_act = phenet_2;  %����ԭ����
% phenet_2(1,:) = [];
% phenet_act = phenet_2(:,4);%ȡ����ֵ
% phenet_act = cell2mat(phenet_act);
% % ����Phenet������������
% P_des = which('Phenet_Descriptors.xls');
% [num_des,txt_des,raw_des] = xlsread(P_des);
% des_Phenet = raw_des;
% des_Phenet(:,1:3) = [];
% des_Phenet(1,:) = [];  
% des_Phenet = cell2mat(des_Phenet);
% x_x = des_Phenet(:,[15,53]);
% %���ں���Ҫ����MSD��������S3K��������������110������������ɾ��
% des_Phenet(:,[15,53]) = [];
%% **************************************************************
%% PCB���ݼ�
P = which('PCB_Properties.xls');  %����
[num_LogP,txt_LogP,raw_LogP] = xlsread(P);
raw_LogP = raw_LogP;  %����ԭ����
raw_LogP(1,:) = [];
PCB_logP = raw_LogP(:,6);%ȡLogP��ֵ   6    TSA  7
PCB_logP = cell2mat(PCB_logP);
% ����PCB��  ����������
P_des = which('PCB_Descriptors.xls');  %������
[num_PCB,txt_PCB,raw_PCB] = xlsread(P_des);
des_PCB = raw_PCB;
des_PCB(:,1:3) = [];
des_PCB(1,:) = [];  
des_PCB = cell2mat(des_PCB);
% ɾ��������û�еĻ������ҺͶ�Ӧ�������� -999
id = find(PCB_logP == -999);  
PCB_logP(id,:) = [];   
des_PCB(id,:) = [];  
%����µ�����
new_fea = des_PCB(:,[47,15,20,50,104]);
des_PCB(:,[10,11,15,20,21,23,29,31,34,42,47,50,51,104])=[];