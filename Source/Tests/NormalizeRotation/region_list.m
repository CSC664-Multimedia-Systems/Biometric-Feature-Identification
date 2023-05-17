function regions = region_list(BW)
    [rows,cols] = size(BW);
    
    region_labels = bwlabel(BW, 4);
    
    regions = {};
    
    for row = 1:rows
        for col = 1:cols
    
            if region_labels(row,col) < 1
                continue;
            end
    
            % Check if the region label already exists as a cell
            if numel(regions) >= region_labels(row,col)
                % Append the current pixel coordinates to the existing cell
                regions{region_labels(row,col)} = [regions{region_labels(row,col)}; [row, col]];
            else
                % Create a new cell for the region label
                regions{region_labels(row,col)} = [row, col];
            end
        end
    end
end
