function [  flag,arrow] = checkHorizontalMovement(  )

    global lastMouseLocations;
    global frameTimer;
    
    minX=20;
    maxX=1000;
    maxY=300;
    arrow=0;
    flag=0;
    directions=zeros(1,frameTimer-1);
    
    y_max = max(lastMouseLocations(:,2));
    y_min = min(lastMouseLocations(:,2));
 
    for i=1:frameTimer-1        
        x1=lastMouseLocations(i,1);
        x2=lastMouseLocations(i+1,1); 
        
        if (abs((x1-x2))<minX || abs((x1-x2))>maxX || y_max-y_min>maxY)
            return;
        end

        if ((x1-x2)>0)
            directions(i)=1; %right
        elseif((x1-x2)<0)
            directions(i)=2; %left
        end                  
    end

    if (sum(directions)==(frameTimer-1)*2)
        arrow=1;
        flag=1;
    elseif(sum(directions)==(frameTimer-1))
        arrow=2;
        flag=1;
    end
       
end

