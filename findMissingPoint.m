function [ missing,top_left,top_right,bottom_right,bottom_left ] = findMissingPoint( screenPoints )
    n=2;    
    imageWidth=432;
    imageHeight=240;
    
    top_left=0;
    top_right=0;
    bottom_right=0;
    bottom_left=0;
    
    for i=1:3
        if(((screenPoints(i,1) < imageWidth/n && (screenPoints(i,2) < imageHeight/n))))
            top_left=screenPoints(i,:);
        end
    end
    for i=1:3
        if(((screenPoints(i,1) > ((n-1)/n)*imageWidth) ) && (screenPoints(i,2) < ((imageHeight/n))))
        	top_right=screenPoints(i,:);
        end
  
    end
    for i=1:3
        if((screenPoints(i,1) > ((n-1)/n)*imageWidth) && (screenPoints(i,2) > (((n-1)/n)*imageHeight)))
            bottom_right=screenPoints(i,:);
        end
    end
    for i=1:3
        if((screenPoints(i,1) < (imageWidth/n)) && (screenPoints(i,2) > (((n-1)/n)*imageHeight)))
           bottom_left=screenPoints(i,:);
        end
    end

    if(top_left==0)
        missing=1;
    elseif(top_right==0)
        missing=2;
    elseif(bottom_right==0)
        missing=3;
    else
        missing=4;
    end
end
