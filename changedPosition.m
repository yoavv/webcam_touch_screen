function [changed] = changedPosition(currentScreenPoints, stats)
    changed=0;
    count=0;
    delta=5;
    for i=1:length(stats)       
        for j=1:4           
            if (compare2Points(stats(i).Centroid, currentScreenPoints(j, 1:2), delta)==1)

                count=count+1;     
                break;
            end   
        end
    end
    
    if (count<1)
        changed=1;

    end
end