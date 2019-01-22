function [  ] = monitors( red,skin,mask,data,line1 )
    
    red = repmat(red,[1 1 3]);
    red=red*255;
    
    skin=repmat(skin,[1 1 3]);
    skin=uint8(skin);
    skin=skin.*data;
    
    line1=line1*255;
    line1=repmat(line1,[1 1 3]);
    
    skin=skin+uint8(line1);
    
    mask=repmat(mask,[1 1 3]);
    masked_data=uint8(mask).*data;

    img=[data red ;skin masked_data];
   
    imagesc(img);
    
    drawnow;
    
    

end

