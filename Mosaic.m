function [mosaic_ready_image] = Mosaic(image, size_x, size_y)

image = smoother(image, size_x, size_y);
mosaic_ready_image = cropper(image, size_x, size_y);
end

function [cropped_image] = cropper(image, size_x, size_y)

[x,y] = size(image);
cropped_image = imcrop(image, [x/2, y/2, size_x, size_y]);
end

function [smoothed_image] = smoother(image, size_x, size_y)
[a,b] = size(image);
smoothed_image = imgaussfilt(image, [a/size_x, b/size_y]);
end



