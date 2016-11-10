%This function computes the average value of a given channel of an image.
%This function can be called on the red, green, and blue channels or the
%hue, saturation, and value channels to provide an average of the intensity
%of each channel.
function [first_channel, second_channel, third_channel] = average_image(image)
    img = imread(image); %read image
    
    %the following variables will hold the average value computed for each
    %channel of the image. 
    first_channel = uint32(0); %average of (;,;,1)
    second_channel = uint32(0); %average of (;,;,2)
    third_channel = uint32(0); %average of (;,;,3)
    
    img_dim = size(img); %This gives the dimensions of the image
    pixels = img_dim(1) * img_dim(2); %Multiples the width by the height

    first_channel = avg(1, pixels, img) / uint32(pixels)
    second_channel = avg(pixels, pixels*2, img) / uint32(pixels)
    third_channel = avg(pixels*2, pixels*3, img) / uint32(pixels)
    
    %computes average of a given layer. Matlab matrices can be index using
    %one number, for a 5x5 image the first layer of the image will be found
    %in indexes 1 through 25, with index number 26 being exactly the same
    %syntax-wise as writing (1,1,2).
    function average = avg(first, last, image)
        average = uint32(0);
        
        for i = first:last 
            average = average + uint32(image(i));
        end
    