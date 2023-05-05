function color_image = color_display_region(region)
    [image_height, image_width] = size(region);
    color_image = uint8(zeros(size(region, 1), size(region, 2), 3));

    % Generates random color based on region
    for row = 2:image_height
        for col = 2:image_width
            if(region(row, col) == 0)
                continue;
            end
            red = 255 - mod(region(row,col)*50, 128);
            green = 255 - mod(region(row,col)*100, 128);
            blue = 255 - mod(region(row,col)*25, 128);
            color_image(row, col, :) = [red, green, blue];
        end
    end
end

