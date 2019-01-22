function [  ] = arrows( direction )
        import java.awt.Robot
        import java.awt.event.*
        
        keys = Robot;
        robot = java.awt.Robot;
        if(direction==1)%right
            keys.keyPress(java.awt.event.KeyEvent.VK_RIGHT); 
        elseif(direction==2)
            keys.keyPress(java.awt.event.KeyEvent.VK_LEFT);
        
        elseif(direction==3)%down
            for i=1:5
                javaMethod('mouseWheel',robot,1);
                pause(0.02);
            end
            
        elseif(direction==4)%up
            for i=1:5
                javaMethod('mouseWheel',robot,-1);
                pause(0.02);
            end
        end

end

