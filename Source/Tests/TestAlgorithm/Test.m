source_image_path = "../Data/frames_grey/";
source_image_extension = ".png";
relevant_data_root_path = "../Relevant_Data/";
relevant_data_extension = ".mat";

test_cases = ["0001", "0010", "0020", "0030", "0040", "0050", "0060", "0070", "0080", "0090", "0100", "0110", "0120", "0130", "0140", "0150", "0160", "0170", "0180", "0190"];
[~, num_of_test_cases] = size(test_cases);

fprintf("Size: %d\n", num_of_test_cases);

% First column is the retrieved data
% Second column is the total retrieved
% Third column is the total relevant of the sample
% sample_data = zeros(num_of_test_cases, 3);

% First column is the precision
% Second column is the recall
sample_data = zeros(num_of_test_cases, 2);

for i = 1:num_of_test_cases
    relevant_path = relevant_data_root_path + test_cases(i) + relevant_data_extension;
%     fprintf("current path: %s\n", relevant_path);
    current_relevant_sample_struct = load(relevant_path, "BW");
    current_relevant_sample = current_relevant_sample_struct.BW;

    current_source_image_path = source_image_path + test_cases(i) + source_image_extension;
    current_source_image = imread(current_source_image_path);
%     fprintf("source image path: %s\n", current_source_image_path);
    

    algorithm_result = naive_detection_algorithm(current_source_image); % TODO use the actual algorithm
    
    img_show = uint8(current_source_image) .* uint8(current_relevant_sample);

    [rows,cols] = size(current_relevant_sample);
    image_centers = zeros(rows, cols,3);
    color_of_centers = [255,0,0];
    for row = 1:rows
        for col = 1:cols
            if algorithm_result(row, col) < 1
                continue
            end
            x = row;
            y = col;
    
            red = color_of_centers(1);
            green = color_of_centers(2);
            blue = color_of_centers(3);
            image_centers(x,y,1) = red;
            image_centers(x,y,2) = green;
            image_centers(x,y,3) = blue;
        end
    end
%     fprintf("-------------------\n");
    [precision, recall, ~] = test_algorithm(algorithm_result, current_relevant_sample);

    % This was meant for calculating the sum of sample data
%     sample_data(i, 1) = data(1);
%     sample_data(i, 2) = data(2);
%     sample_data(i, 3) = data(3);
    
    % Used for calculating the average percentage of precision and recall
    sample_data(i, 1) = precision;
    sample_data(i, 2) = recall;

    if i == 5
        break
    end
end
img = imfuse(current_relevant_sample, image_centers, 'blend');
imshow(img);

[precision, recall, img] = test_algorithm(algorithm_result, current_relevant_sample);
% fprintf("---- Sample %d ----\n", i);
% fprintf("Precision: %.2f\n", precision);
% fprintf("Recall: %.2f\n", recall);
% fprintf("\n");

fprintf("---- Sample Summary ----\n");
fprintf("Sample size = %d\n", num_of_test_cases);

mean_precision = mean(sample_data(:,1));
std_precision = std(sample_data(:,1));
mean_recall = mean(sample_data(:,2));
std_recall = std(sample_data(:,2));

fprintf("(Mean) Precision: %.2f%%\n", mean_precision * 100);
fprintf("(Standard Deviation) Precision: %.2f%%\n", std_precision * 100);
fprintf("(Mean) Recall: %.2f%%\n", mean_recall * 100);
fprintf("(Standard Deviation) Recall: %.2f%%\n", std_recall * 100);

% fprintf("%.2f\n%.2f\n", sample_data(i,1)/sample_data(i,2), sample_data(i,1)/sample_data(i,3));