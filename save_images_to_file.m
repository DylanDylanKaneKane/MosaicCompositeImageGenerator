function save_images_to_file()
    image_directory = 'Image\training\';
    directory = dir(image_directory);
    directory(1) = [];
    directory(1) = [];
    RGBs = all_image_rgb(directory, image_directory);
    csvwrite('imagedata.txt', RGBs);
end