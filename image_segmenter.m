%this function takes an image img and splits into n^2 sections by splitting
%it into n sections vertically and n sections horizontally.
function split = image_segmenter(pixels, n, x, y)
    split = zeros(pixels);
    
    x1 = 1 + (j*section_width); %first x-coordinate of this section
    x2 = (1+j) * section_width; %last x-coordinate of this section

    y1 = 1 + (i*section_height); %first y-coordinate of this section
    y2 = (1+i) * section_width; %last y-coordinate of this section

    image_tile = img(x1:x2, y1:y2, :);
    
    section_width = img_dim(1) / n;
    section_height = img_dim(2) / n;
    
    for i = 0:n
        
        for j = 0:n
            
        end
    end
end
