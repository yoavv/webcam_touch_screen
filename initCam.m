function [ vid ] = initCam(camNum, ReturnedColorspace, FrameGrabInterval, res)
    
    vid = videoinput('winvideo', camNum,res);
    set(vid, 'FramesPerTrigger', Inf);
    set(vid, 'ReturnedColorspace', ReturnedColorspace)
    triggerconfig(vid, 'manual');
    vid.FrameGrabInterval = FrameGrabInterval;
   
end

