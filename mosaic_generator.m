function mosaic_generator(tiles_x, tiles_y, image, is_part_c, is_natural)
    
%This function create the composition image, based on the closest image
    tic
    image_directory = 'Image\training\';
    directory = dir(image_directory);
    directory(1) = [];
    directory(1) = [];

    tic
    test_image_colours = csvread('imagedata.txt');
    toc
    
    img = imread(image);
    pixels = size(img);
    %pixels = pixels(1) * pixels(2);
    
    section_width = pixels(1) / tiles_x;
    section_height = pixels(2) / tiles_y;
    
    section_width = floor(section_width);
    section_height = floor(section_height);
    
    img = imresize(img, [section_width*tiles_x section_height*tiles_y]);
    
    list_of_images = zeros([tiles_x tiles_y]);
    
    new_image = zeros(section_width * tiles_x, section_height * tiles_y, 3);
    for i = 0 : tiles_y - 1
        
        for j = 0 : tiles_x - 1
            x1 = 1 + (j*section_width);
            x2 = (j+1) * section_width;
            
            y1 = 1 + (i*section_height);
            y2 = (i+1) * section_height;
            
            tile = img(x1:x2, y1:y2, :);
            
            closest = 755;
            closest_image = '';
            [r,g,b] = average_image(tile);
            for avg = 1:3:length(test_image_colours)
                %sim = abs((r - test_image_colours(avg)) + abs(g - test_image_colours(avg+1)) + abs(b - test_image_colours(avg+2));
                sim = abs((r - test_image_colours(avg))) + abs((g - test_image_colours(avg+1))) + abs((b - test_image_colours(avg+2)));
                if sim < closest
                    if is_part_c == false
                        closest = sim;
                        closest_image = strcat(image_directory, directory(ceil(avg/3)).name);
                    elseif is_part_c == true && is_natural == true && strfind(directory(ceil(avg/3)).name, 'nsun')
                        closest = sim;
                        closest_image = strcat(image_directory, directory(ceil(avg/3)).name,'msun');
                    elseif is_part_c == true && is_natural == false && strfind(directory(cell(avg/3)).name, 'msun')
                        closest = sim;
                        closest_image = strcat(image_directory, directory(ceil(avg/3)).name);
                    end
                end
            end
            closest_img = imread(closest_image);
            closest_img = imresize(closest_img, [section_width section_height]);
            new_image(x1:x2, y1:y2, :) = closest_img;
        end
    end
    new_image = new_image/255;
    imshow(new_image);
    imwrite(new_image, 'testimage.png');
    toc
end