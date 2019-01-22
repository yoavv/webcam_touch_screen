function [  ] = mouseLeftClick(  )

    import java.awt.Robot;
    import java.awt.event.*;
    import java.awt.event.InputEvent;
    
    
    r = Robot; 
    r.mousePress(InputEvent.BUTTON1_DOWN_MASK);
    r.delay(0.1);
    r.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);    

   



end

