function [ numFingers] = fingersCounter(skin,stats_skin,line0,flag)
numFingers=0;
precent=0.05;
for i=1:3
    
    line1 = createPerpendicularLines( stats_skin,line0,precent,flag);
    a = bwlabel((line1.*skin), 8);
    a = bwareaopen(a,10);  
    stats1 = regionprops(logical(a));

    num=max(length(stats1));
    if(num>numFingers)
        numFingers=num;
    end
    precent=precent+0.1;
end


end

