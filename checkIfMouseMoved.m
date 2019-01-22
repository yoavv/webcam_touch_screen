function [ moved ] = checkIfMouseMoved()
         
    global lastMouseLocations;
          
    delta=30;
    moved=1;  
    x_max = max(lastMouseLocations(:,1));
    x_min = min(lastMouseLocations(:,1));
    y_max = max(lastMouseLocations(:,2));
    y_min = min(lastMouseLocations(:,2));
          
    if (x_max-x_min<delta && y_max-y_min<delta && x_min>0 && y_min>0)
        moved=0;  
    end
end

