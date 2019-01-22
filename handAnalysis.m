 function [ fingerTip,edgeLines,fingers ] = handAnalysis( hand,StatsHand )
	global checkInterval;
    global framecounter;
    global numFingers;

    
    [ orientationLine,fingerTip,smallerEdgeFlag,edgeLines ]= fingerTipDetection( hand,StatsHand );
    
    %count fingers but after every a number of frames
	if (mod(framecounter,checkInterval)==0)
        fingers=fingersCounter(hand,StatsHand,orientationLine,smallerEdgeFlag);
        
    else
        fingers=numFingers;
        
	end
            
end

