function [ line1 ] = createPerpendicularLines( stats_skin,line0,precent,flag )
            [ height,width ] = calc_height_width( stats_skin );

            right_top=stats_skin.Extrema(3,1);
            left_top=stats_skin.Extrema(8,1);
            top_left=stats_skin.Extrema(1,2);
            botom_left=stats_skin.Extrema(6,2);
            
            if(abs(stats_skin.Orientation)<45)
                if(flag==0)
                    x1=round(left_top(1)+width*precent+1);
                else
                    x1=round(right_top(1)+width*precent*(-1)-1);
                end

                [v i1]=max(line0(:,x1));
                y1=i1;


            else
                if(flag==0)
                    y1=round(top_left+height*precent+1);
                else
                    y1=round(botom_left+height*precent*(-1)-1);
                end
                
                [v i1]=max(line0(y1,:));
                x1=i1;


            end
            
            line1 =orientationLine( stats_skin.Orientation+90,[x1 y1] );

end

