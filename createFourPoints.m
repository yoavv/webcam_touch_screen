function [ stats3] = createFourPoints( stats,red )

    global res_width;
    global res_height;
    threePoints=[stats(1).Centroid;stats(2).Centroid;stats(3).Centroid];
    [ missing,top_left,top_right,bottom_right,bottom_left ] = findMissingPoint( threePoints );

    if(missing==1)
        points1=[top_right bottom_right];
        direction_flag1=0;
        points2=[bottom_right bottom_left];
        direction_flag2=0;
    elseif(missing==2)
        points1=[bottom_left bottom_right];
        direction_flag1=1;
        points2=[top_left bottom_left];
        direction_flag2=0;
    elseif(missing==3)
        points1=[bottom_left top_left];
        direction_flag1=1;
        points2=[top_left top_right];
        direction_flag2=1;
    elseif(missing==4)
        points1=[ top_right bottom_right  ];
        direction_flag1=1;
        points2=[ top_right top_left];
        direction_flag2=0;
    end
    a=[top_left,top_right,bottom_right,bottom_left ];

    if(sum(a==0)>1)
        stats3=0;
        return;
    end
    
    img1=drawLineInMatrix([res_width res_height], points1(1:2),points1(3:4));
    stats1=regionprops(img1, 'Centroid','Extrema','Orientation');

    img2=drawLineInMatrix([res_width res_height], points2(1:2),points2(3:4));
    stats2=regionprops(img2, 'Centroid','Extrema','Orientation');

    line1  = createPerpendicularLines( stats1,img1,0,direction_flag1 );
    line2  = createPerpendicularLines( stats2,img2,0,direction_flag2 );
     

    line=(line1 & line2);
    stats3=regionprops((red | line),'Extrema','Centroid');

        
end

