function [  flag,arrow] = checkVerticalMovement(  )

    global lastMouseLocations;
    global frameTimer;
    
    
    maxX=300;
    minY=20;
    maxY=1000;
    arrow=0;
    flag=0;
    
    directions=zeros(1,frameTimer-1);

    x_max = max(lastMouseLocations(:,1));
    x_min = min(lastMouseLocations(:,1));
 
    for i=1:frameTimer-1        
        y1=lastMouseLocations(i,2);
        y2=lastMouseLocations(i+1,2); 
        
        if (abs((y1-y2))<minY || abs((y1-y2))>maxY || x_max-x_min>maxX)
            return;
        end
                    
        if ((y1-y2)>0)
            directions(i)=1; %up
        elseif((y1-y2)<0)
            directions(i)=2; %down
        end                  
    end

    if (sum(directions)==(frameTimer-1)*2)
        arrow=3;
        flag=1;
    elseif(sum(directions)==(frameTimer-1))
        arrow=4;
        flag=1;
    end
end

