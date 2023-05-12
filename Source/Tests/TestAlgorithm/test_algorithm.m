function [precision,recall, labelImg] = test_algorithm(heads_mask, relevant_mask)
    [image_height, image_width] = size(heads_mask);

    % 4 Connectivity Region Processing
    [labelImg, numRegions] = bwlabel(relevant_mask, 4);

    region_map = containers.Map('KeyType', 'int32', 'ValueType', 'logical');

    for i = 1: numRegions
        region_map(i) = true;
    end

    relevant_total = numRegions;
    retrieved = 0;
    retrieved_total = 0;
    % Loop over each pixel in the image
    for row = 1:image_height
        for col = 1:image_width
            if heads_mask(row, col) > 0
                retrieved_total = retrieved_total + 1;
            end
            if heads_mask(row, col) > 0 && relevant_mask(row, col) > 0 && region_map(relevant_mask(row, col))
                retrieved = retrieved + 1;
                region_map(relevant_mask(row, col)) = false;
            end
        end
    end

    recall = retrieved / relevant_total;
    precision = retrieved / retrieved_total;

    fprintf('Debug');
    fprintf('number of regions: %d\n', numRegions);
    fprintf('recall: %f\n', recall);
    fprintf('precision: %f\n', precision);
end

