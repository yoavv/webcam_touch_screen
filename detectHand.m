function [ hand,StatsHand ] = detectHand( hsv )
    global mask;
    %Find the hand in the image
    
    %Find all the skin colored objects in the image
    skin=(hsv(:,:,1)*360<50 & hsv(:,:,2)>=0.23 &hsv(:,:,2)<=0.68);
    
    %Fill holes in the skin objects
    skin=imfill(skin,'holes');
    skin=skin.*mask;
    %Filter small skin objects
    skin = bwareaopen(skin,400);
    
    %Check if skin object exist
    if(nnz(skin)>0)
        
        %Keep the largest object only
        hand = bwpropfilt(logical(skin),'area',1);    
    else        
        hand=skin;
    end
    
    %Create skin object array of structs
    StatsHand = regionprops((hand), 'Extrema', 'Centroid','Orientation');

   
    
    
    
 

   
end

