function [ valid ] = validateScreenPointsPos( screenPoints )
    n=3;    
    global res_width;
    global res_height;
    if(screenPoints(1,1) > res_width/n || (screenPoints(1,2) > res_height/n))
         valid=0;
         return;
    end
    if((screenPoints(2,1) < ((n-1)/n)*res_width) ) || (screenPoints(2,2) > ((res_height/n)))
         valid=0;
         return;
    end
    if(screenPoints(3,1) < ((n-1)/n)*res_width) || (screenPoints(3,2) < (((n-1)/n)*res_height))
         valid=0;
         return;
    end
    if(screenPoints(4,1) > (res_width/n)) || (screenPoints(4,2) < (((n-1)/n)*res_height))
         valid=0;
         return;
    end
    valid=1;
end

