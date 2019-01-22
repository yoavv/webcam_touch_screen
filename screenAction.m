function [] = screenAction(screenPoints, stats_skin,fingers,index)

        global frameTimer; 
        global lastMouseLocations;
        global previousNumFingers;
        global numFingers;
        event=0;
        previousNumFingers=numFingers;
        numFingers=fingers;
        
        if (numFingers==3 && previousNumFingers~=3 ) %keyboard
            keyboard();
            event=1;
        end
        
        if (length(stats_skin)==1 && numFingers~=3) % mouse
                     
            [mouseX, mouseY]=calcMouseLocation(screenPoints, stats_skin,index);
            mouseMove(mouseX, mouseY);      
                        
            for i=1:frameTimer-1
                lastMouseLocations(i,:)=lastMouseLocations(i+1,:);       
            end  
            lastMouseLocations(frameTimer,:)=[mouseX,mouseY];
            
            event=checkMouseMovement();  

        end
        
        if(event==1) %if click or keyboard event happened initialize lastMouseLocations
            lastMouseLocations=zeros(frameTimer,2);
        end 
end

