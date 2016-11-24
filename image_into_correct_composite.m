function image_into_correct_composite (tiles_x, tiles_y, image)
%Gets the natural/manmade type (from Part B code)
test_natural = is_natural(image, 'C:\Users\Ross\Documents\GitHub\MosaicCompositeImageGenerator-master\MosaicCompositeImageGenerator\Image\test');
%Gets the composition of images of the correct type (from Part A code)

if test_natural == true
    mosaic_generator(tiles_x, tiles_y, image, true, true);
else 
    mosaic_generator(tiles_x, tiles_y, image, true, false);
end
end