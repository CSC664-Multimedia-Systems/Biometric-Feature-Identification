function orientation = region_orientation(bw)
    list = region_list(bw);
    
    new_image = zeros(size(bw));
    
    % Show purposes
    % TODO loop through each region
    % Draw the specific region
    [~, region_size] = size(list);
    
    imshow(bw)
    hold on
    for current_region_index = 1:region_size
        regions = list{1,current_region_index};
        [rows, cols] = size(regions);
        for row = 1:rows
            for col = 1:cols
                x = regions(row,1);
                y = regions(row,2);
                new_image(x,y) = 255;
            end
        end
        
        % Build a covariance matrix
        [region_size,~] = size(regions);
        if region_size == 1
            continue;
        end
        
        x = regions(:,2);
        
        % Best_fit_line(regions)
        % Builds a covariance matrix
        % Apply SVD and calculates for the slope and y-intercept
        [~,slope, intercept] = best_fit_line(regions);
        
        x1 = min(x);  % Minimum x value
        x2 = max(x);  % Maximum x value
        y1 = intercept + slope * x1;  % Calculate y value for the minimum x value
        y2 = intercept + slope * x2;  % Calculate y value for the maximum x value
        plot([x1, x2], [y1, y2], 'r', 'LineWidth', 2);
    end
    hold off
end