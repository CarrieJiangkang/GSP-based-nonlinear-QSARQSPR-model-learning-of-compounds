function sc = sc_matrix(X)
    Degree=diag(sum(X));
    sc = zeros(size(X));
    [m, n] = size(X);
    for i = 1:m
        for j = 1:n
            if(X(i, j))
                sc(i,j ) = 1 / sqrt(Degree(i, i) + Degree(j, j));
            end
        end
    end
end