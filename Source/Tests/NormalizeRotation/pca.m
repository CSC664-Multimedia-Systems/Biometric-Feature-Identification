function [reduce_t, reduce_s, reduce_d] = pca(matrix, k)    
    [T, S, D] = svd(matrix, 'econ');
    
    reduce_t = T(:,1:k);
    reduce_s = S(1:k,1:k);
    reduce_d = D(:,1:k);
    reduce_d = transpose(reduce_d);
    
%     ts = T*S;
%     reconstruction = reduce_t * reduce_s * reduce_d;
end
