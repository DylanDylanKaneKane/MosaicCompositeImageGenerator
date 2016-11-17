%calculates the similarity between the colour palletes of two images. 
%The minimum value of 0 means the colours used in the two images are 100% identical
%up to the last pixel. The maximum value of 765 means that the colours of
%the two images are 0% identical and are as far away from each as possible
function sim = similarity(first_image, second_image)

    [first_r,first_g, first_b] = average_image(first_image);
    [second_r,second_g, second_b] = average_image(second_image);
    
    sim = abs(first_r - second_r) + abs(first_g - second_g) + abs(first_b - second_b);
end