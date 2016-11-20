function is_natural = is_natural(image, image_directory)

TF = startsWith(image, 'Image\training\m');
if image_directory == 'Image\training\natural'
    is_natural = true;
elseif TF == true
    is_natural = true;
else
    is_natural = false;
    
    is_natural
end