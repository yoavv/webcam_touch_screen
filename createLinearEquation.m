function [ m,b ] = createLinearEquation( orientation,centroid,imageSize )

m=tan(degtorad(orientation));
y=centroid(1);
x=centroid(2);

b=round(y-(m*x));


end

