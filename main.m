imaqreset
clear all;

global lastMouseLocations;
global frameTimer;
global previousNumFingers;
global numFingers;
global keyboardFlag;
global res_width;
global res_height;
global red;
global mask;
global checkInterval;
global framecounter;
res_width=320;
res_height=180;
checkInterval=1;
res=strcat('MJPG_',int2str(res_width),'x',int2str(res_height));

frameTimer=6;
lastMouseLocations=zeros(frameTimer,2);
previousNumFingers=0;
numFingers=0;
keyboardFlag=0;
framecounter=0;

screenPoints=0;
global detected;

detected=0;
red=zeros(res_height,res_width);
mask=zeros(res_height,res_width);
vid=initCam(2, 'rgb', 1, res);
warning off;
start(vid);
i=0;

while(true)
    
    edgeLines=zeros(res_height,res_width);
    hand=zeros(res_height,res_width);
    fingers=0;
    framecounter=framecounter+1;
    
    data = getsnapshot(vid);
   
    hsv=rgb2hsv(data);
    
    if (detected==1)
    
        [hand,StatsHand ]=detectHand(hsv);

        %check if hand object exist.  
        if(nnz(hand)>0)
            [ fingerTip,edgeLines,fingers ] = handAnalysis( hand,StatsHand );
            screenAction(screenPoints, StatsHand,fingers,1); 
        else
            edgeLines=hand;  
        end
        
    end
    %show camera
	monitors( red,hand,mask,data,edgeLines );
    
    %check if cam moved but after every a number of frames
    if (mod(framecounter,checkInterval)==0)
        [StatsRed]=detectRedObjects(hsv);
        
        if (detected==0) 
            screenPoints=screenDetect(StatsRed);
            if (detected==0)
                mask=zeros(res_height,res_width);
                continue;
            else    
               mask=poly2mask(screenPoints(:,3),screenPoints(:,4),res_height,res_width);
            end   
        end 
    
        if (changedPosition(screenPoints, StatsRed)==1)
            detected=0;
            mask=zeros(res_height,res_width);
            lastMouseLocations=zeros(frameTimer,2);        
            continue;
        end
    end
    
    
    
end

stop(vid);
flushdata(vid);










