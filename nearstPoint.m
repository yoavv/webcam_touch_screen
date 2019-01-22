function [ I ] = nearstPoint( stats,cent )
arr=zeros(8,1);
for i=1:8
    point=stats.Extrema(i,:);
    arr(i)=distance(point,cent);

end

[m , I]=min(arr);

end