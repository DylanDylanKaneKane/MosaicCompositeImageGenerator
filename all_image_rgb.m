%this function gets all of the average values for each of the three
%channels of all images in the training/test set.
function RGBs = all_image_rgb(directory, test_image_directory)
    tic
    
    no_files = size(directory);
    %RGBs = zeros(no_files(1) * 3);
    RGBs = [];
    for file = directory'
        img = imread(strcat(test_image_directory, file.name));
        [r, g, b] = average_image(img);
        RGBs(end+1) = r;
        RGBs(end+1) = g;
        RGBs(end+1) = b;
        
    end
    toc
end