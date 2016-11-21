%This function computes the average value of a given channel of an image.
%This function can be called on the red, green, and blue channels or the
%hue, saturation, and value channels to provide an average of the intensity
%of each channel.
function [first_channel, second_channel, third_channel] = average_image(image)
    
    incrementer = 8;
    %the following variables will hold the average value computed for each
    %channel of the image. 
    first_channel = int32(0); %average of (;,;,1)
    second_channel = int32(0); %average of (;,;,2)
    third_channel = int32(0); %average of (;,;,3)
    
    img_dim = size(image); %This gives the dimensions of the image
    pixels = img_dim(1) * img_dim(2); %Multiples the width by the height

    first_channel = avg(1, pixels, image) / pixels;
    second_channel = avg(pixels, pixels*2, image) / pixels;
    third_channel = avg(pixels*2, pixels*3, image) / pixels;
    
    %computes average of a given layer. Matlab matrices can be index using
    %one number, for a 5x5 image the first layer of the image will be found
    %in indexes 1 through 25, with index number 26 being exactly the same
    %syntax-wise as writing (1,1,2).
    function average = avg(first, last, image)
        average = int32(0);
        incrementer = 1;
        for i = first:incrementer:last
            average = average + int32(image(i));
        end
    