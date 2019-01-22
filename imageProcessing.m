function [ stats_red, stats_skin, skin ] = imageProcessing( data )

    hsv=rgb2hsv(data);
    detectRedObjects(hsv);
    detectHand(hsv);


end

