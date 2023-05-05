function buffer = regions(image)
    [image_height, image_width] = size(image);
    buffer = zeros(image_height, image_width);


    equivalence_table = containers.Map('KeyType', 'int32', 'ValueType', 'int32');

    count = 1;

    for row = 2:image_height
        for col = 2:image_width
            % TODO: Add edge case when row = 1 or col = 1
    
            center = image(row, col);
            left = image(row-1, col);
            up = image(row, col-1);
            b_left = buffer(row-1, col);
            b_up = buffer(row, col-1);
    
            if center == 0
                continue;
            end
    
            if left ~= 0 && up ~= 0
                if b_left ~= b_up
                    larger_label = max(b_left, b_up);
                    smaller_label = min(b_left, b_up);
                    if(smaller_label == 0) % Edge case
                        buffer(row,col) = b_up;
%                         count = count + 1;
                        continue;
                    end
                    equivalence_table(larger_label) = smaller_label;
                end
                buffer(row,col) = min(b_up, b_left);
            elseif left ~=0 && up == 0
                buffer(row,col) = b_left;
            elseif left == 0 && up ~= 0
                buffer(row,col) = b_up;
            else
                buffer(row,col) = count;
                count = count + 1;
            end
        end
    end


    for row = 2:image_height
        for col = 2:image_width
            center = buffer(row, col);
            if isKey(equivalence_table, center)
                new_label = equivalence_table(center);
                while isKey(equivalence_table, new_label)
                    new_label = equivalence_table(new_label);
                end
                buffer(row, col) = new_label;
            end
        end
    end
    % Loop over the arrays and print out the keys and values
    keys_arr = keys(equivalence_table);
    values_arr = values(equivalence_table);
    for i = 1:length(keys_arr)
        key = keys_arr{i};
        value = values_arr{i};
        fprintf('%d: %d\n', key, value);
    end
end