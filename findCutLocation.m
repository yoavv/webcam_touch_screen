function [ precent ] = findCutLocation( skin,stats_skin,orientationLine,flag )
  precent=0;
    for i=1:10
           precent=precent+0.05;
           testLine = createPerpendicularLines( stats_skin,orientationLine,precent,flag );
           testSkinAmount=testLine.*skin;
           if(nnz(testSkinAmount>0))
               precent=precent+0.05;
               return;
           end
    end
end

