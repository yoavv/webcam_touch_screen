function [ StatsRed ] = detectRedObjects( hsv )
    %Finding large red objects in an image
    global red;
    
    %Find all the red objects
    red=((hsv(:,:,1)*360<20 | hsv(:,:,1)*360>340) & hsv(:,:,2)>0.6 & hsv(:,:,3)>0.3 );
    %Filter small red objects
    red= bwareaopen(red,30); 
    %Create red object array of structs
    StatsRed = regionprops(logical(red), 'Extrema', 'Centroid');

end

