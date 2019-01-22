function [  ] = keyboard(  )
    global keyboardFlag;

    if(keyboardFlag==0)
        system('aa.lnk');   %open keyboard
        keyboardFlag=1;
    else
        dos ('taskkill /f /IM tabTip.exe'); %close keyboard
        keyboardFlag=0;
    end
end

