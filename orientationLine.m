function [ img ] = orientationLine( orientation,centroid )
    global res_height;
    global res_width;
     

    imageSize=[res_width res_height ];
    orientation=-1*orientation;
    temp=centroid(1);
    centroid(1)=centroid(2);
    centroid(2)=temp;
    [ m,b ] = createLinearEquation( orientation,centroid,imageSize );
    
    [ point1,point2 ] = equatoinToPoints( m,b,imageSize );

    
    img=drawLineInMatrix(imageSize, point1, point2);
    
    img(centroid(1):centroid(1),centroid(2):centroid(2))=120;
end

