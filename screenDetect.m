function [screenPoints] = screenDetect(stats)
    global detected;
    detected=0;
    screenPoints=0;          
        if(~(isempty(stats)))
            if(length(stats)>=4)
                screenPoints=getScreenPoints(stats);
                if(screenPoints~=0)
                    detected=1;
                end
            end
        end               
end


