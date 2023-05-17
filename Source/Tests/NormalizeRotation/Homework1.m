test_matrix = [4 12 13; 
                7 14 28;
                1 7 15;
                6 6 12;];

[T, S, D] = svd(test_matrix);

k = 1;

reduce_t = T(:,1:k);
reduce_s = S(1:k,1:k);

% Reduce before transpose
reduce_d_1 = D(:,1:k);
reduce_d_1 = transpose(reduce_d_1);

% Reduce after transpose
reduce_d_2 = transpose(D);
reduce_d_2 = reduce_d_2(1:k, :);

nonreduce_test = T * S * transpose(D);
reduce_test_1 = reduce_t * reduce_s * reduce_d_1;
reduce_test_2 = reduce_t * reduce_s * reduce_d_2;

error_0 = abs(test_matrix - nonreduce_test);
error_1 = abs(test_matrix - reduce_test_1);
error_2 = abs(test_matrix - reduce_test_2);

% Result
% Reduce and then transpose = transpose and then reduce
