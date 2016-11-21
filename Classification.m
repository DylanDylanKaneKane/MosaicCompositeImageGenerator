function classification = Classification

        %---The code between these lines is from the tester, for use in
        %obtaining the most similar images, to determine natural vs
        %manmade---
        tic
        test_image_directory = 'Image\training\';
        test_image = 'Image\training\msun_aabghtsyctpcjvlc.jpg';
        most_close = 755;
        most_close_image = '';
        directory = dir('Image\training');
        
        test_img = imread(test_image);
        imshow(test_img)
        %the first two elements of the dir array(on windows) will be . and
        %.. this code willstrcat(test_image_directory, file.name)strcat(test_image_directory, file.name)strcat(test_image_directory, file.name)order to remove these values from the array.
        directory(1) = [];
        directory(1) = [];
        for file = directory'
            current_image = strcat(test_image_directory, file.name);
            current_img = imread(current_image);
            closeness = similarity(current_img, test_img);
            if closeness < most_close
                most_close = closeness;
                most_close_image = current_image;
            end
        end
        
        
    	most_close_image
        toc
        
        %------------------%
        
        createBagOfFeatures(test_img, test_image_directory)
        if is_natural(most_close_image) == true
            classification = 'natural';
        else 
            classification = 'manmade';
        end
    

end

