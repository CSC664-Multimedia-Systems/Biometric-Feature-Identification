function result = edge_linking(image)
    % NOTE: Unfinished
    % Currently, the algorithm tells a pixel how many neighbors it has.
    % 8 Connectivity
    [image_height, image_width] = size(image);
    
    result = zeros(image_height, image_width);
    count = 0;
    for row = 3:image_height-3
        for col = 3:image_width-3
            % Center
            if image(row,col) == 0
                continue
            end
            %count = count+1;
            % Top Left
            if image(row-1,col-1) ~= 0
                count = count+1;
            end
            % Top
            if image(row-1,col) ~= 0
                count = count+1;
            end
            % Top Right
            if image(row-1,col+1) ~= 0
                count = count+1;
            end
            % Center Left
            if image(row,col-1) ~= 0
                count = count+1;
            end
            % Center Right
            if image(row,col+1) ~= 0
                count = count+1;
            end
            % Bottom Left
            if image(row+1, col-1) ~= 0
                count = count+1;
            end
            % Bottom
            if image(row+1, col) ~= 0
                count = count+1;
            end
            % Bottom Right
            if image(row+1, col+1) ~= 0
                count = count+1;
            end
            
            %if count == 1
                result(row, col) = count;
            %end
            count = 0;
        end
    end
end