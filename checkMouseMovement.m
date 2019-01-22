function [ event ] = checkMouseMovement(  )
    event=1;
    [verticalFlag,verticalDirection]=checkVerticalMovement();

    [horizontalFlag,horizontalDirection]=checkHorizontalMovement();

    if(checkIfMouseMoved()==0)%mouse hasnt moved
            
        mouseLeftClick();
    
    elseif(horizontalFlag==1)%there has been a horizontal movement
            
        arrows( horizontalDirection );
    
    elseif(verticalFlag==1)%there has been a vertical movement
            
        arrows( verticalDirection );
        
    else
        event=0;
    end
    
    
end

