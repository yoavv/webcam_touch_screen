function [ orientationLine,fingerTip,smallerEdgeFlag,edgeLine ] = fingerTipDetection( skin,stats_skin )
            
             orientationLine  = createOrientationLine( stats_skin.Orientation,stats_skin.Centroid );
             
         
           cutPrecent1=findCutLocation( skin,stats_skin,orientationLine,0 );
           cutPrecent2=findCutLocation( skin,stats_skin,orientationLine,1 );
           edgeLine1 = createPerpendicularLines( stats_skin,orientationLine,cutPrecent1,0 );
           edgeLine2 = createPerpendicularLines( stats_skin,orientationLine,cutPrecent2,1 );
           
           
           
           skinAmount1=edgeLine1.*skin;
           skinAmount2=edgeLine2.*skin;
           if(sum(sum(skinAmount1))>0)
                   skinAmount1 = bwpropfilt(logical(skinAmount1),'area',1);    
           end
           
           if(sum(sum(skinAmount2))>0)
                   skinAmount2 = bwpropfilt(logical(skinAmount2),'area',1);    
           end
            if(sum(sum(skinAmount1))>sum(sum(skinAmount2)))
                smallerEdgeFlag=1;
                stats = regionprops(edgeLine2,  'Centroid');
            else
                smallerEdgeFlag=0;
                stats = regionprops(edgeLine1,  'Centroid');
            end
            edgeLine=edgeLine1+edgeLine2 ;
            p=stats.Centroid;
            
            fingerTip=nearstPoint(stats_skin,p);
            
        

end

