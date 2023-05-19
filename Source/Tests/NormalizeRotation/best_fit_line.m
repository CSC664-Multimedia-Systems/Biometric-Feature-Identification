function [slope, intercept] = best_fit_line(data)
%     x = regions(:,2);
%     y = regions(:,1);
    x = data(:,2);
    y = data(:,1);

    realigned_data = [x, y];

    covMatrix = cov(realigned_data);
    [U, ~, ~] = svd(covMatrix, 'econ');
    bestFitLine = U(:, 1); 
    meanX = mean(x);  % Mean of x values
    meanY = mean(y);  % Mean of y values
    slope = bestFitLine(2) / bestFitLine(1);  % Calculate slope
    intercept = meanY - slope * meanX;  % Calculate y-intercept
    
%     imshow(rice)
%     hold on
%     x1 = min(x);  % Minimum x value
%     x2 = max(x);  % Maximum x value
%     y1 = intercept + slope * x1;  % Calculate y value for the minimum x value
%     y2 = intercept + slope * x2;  % Calculate y value for the maximum x value
%     plot([x1, x2], [y1, y2], 'r', 'LineWidth', 2);
%     hold off
end