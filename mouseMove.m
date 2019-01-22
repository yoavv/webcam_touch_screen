function [] = mouseMove(screen_x, screen_y)

    import java.awt.Robot; 
     
     Pix_SS = get(0,'screensize');
    res_width=Pix_SS(3);
    res_height=Pix_SS(4);
    
    mouse = Robot;
    if(screen_x>0 && screen_y>0 && screen_y<=res_height && screen_x<= res_width)
        mouse.mouseMove(screen_x, screen_y);
        pause(0.00001);
    end
end

