sc_all = cell(22,1);


for i_22 = 1:22
    A = A_all{i_22};
    adj=full(A);
    sc = sc_matrix(adj);
    sc_all{i_22} = sc;
end




