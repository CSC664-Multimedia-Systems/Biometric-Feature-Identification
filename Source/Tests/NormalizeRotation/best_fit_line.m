function [left_singular_matrix, slope, intercept] = best_fit_line(data)
    x = data(:,2);
    y = data(:,1);

    realigned_data = [x, y];

    % Covariance matrix
    covMatrix = cov(realigned_data);
    [left_singular_matrix, ~, ~] = svd(covMatrix, 'econ');
    bestFitLine = left_singular_matrix(:, 1); 
    meanX = mean(x);  % Mean of x values
    meanY = mean(y);  % Mean of y values
    slope = bestFitLine(2) / bestFitLine(1);  % Calculate slope
    intercept = meanY - slope * meanX;  % Calculate y-intercept
end