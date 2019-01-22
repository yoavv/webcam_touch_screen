function [ p1,p2 ] = equatoinToPoints( m,b,imageSize )


x1=1;
y1=round(m*x1+b);

x2=imageSize(1);
y2=round(m*x2+b);

y3=1;
x3=round((y3-b)/m);

y4=imageSize(2);
x4=round((y4-b)/m);


point1=[x1 y1];
point2=[x2 y2];
point3=[x3 y3];
point4=[x4 y4];

a=inpolygon([x1 x2 x3 x4],[y1 y2 y3 y4],[1 1 imageSize(1) imageSize(1)]...
         ,[1 imageSize(2) imageSize(2) 1]);
arr=[point1; point2; point3; point4];

    aa=[a'.*arr(:,1) a'.*arr(:,2)];
    
    [row] = find(aa(:,1)>0);
    p1=arr(row(1),:);
    p2=arr(row(2),:);
    

    
end

