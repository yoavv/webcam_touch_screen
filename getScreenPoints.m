function [screenPoints] = getScreenPoints(stats)

    Centroids=zeros(length(stats),2);
    for i=1:length(stats)
        Centroids(i,:)=stats(i).Centroid;
    end
    
            [M,I] = max(Centroids(:,1));
            BottomRight=Centroids(I,:);
            Centroids(I,:)=[];
             [M,I] = max(Centroids(:,1));
             TopRight=Centroids(I,:);
            Centroids(I,:)=[];

            if(TopRight(2)>BottomRight(2))

                 temp=TopRight;
                 TopRight=BottomRight;
                 BottomRight=temp;
            end

            [M,I] = min(Centroids(:,1));
            BottomLeft=Centroids(I,:);
            Centroids(I,:)=[];
            [M,I] = min(Centroids(:,1));
            TopLeft=Centroids(I,:);
            Centroids(I,:)=[];

            if(TopLeft(2)>BottomLeft(2))
                 temp=TopLeft;
                 TopLeft=BottomLeft;
                 BottomLeft=temp;
            end
            
            screenPoints=zeros(4,4);     
            screenPoints(1,1:2)= TopLeft;
            screenPoints(2,1:2)= TopRight;
            screenPoints(3,1:2)= BottomRight;
            screenPoints(4,1:2)= BottomLeft;
            
            if(validateScreenPointsPos(screenPoints)==0)
                screenPoints=0;
                return;
            end
                
                
            for i=1:length(stats)
                
                    if(stats(i).Centroid==screenPoints(1,1:2))
                        screenPoints(1,3:4)=(stats(i).Extrema(4,:)+stats(i).Extrema(5,:))/2;
                    end
                    if(stats(i).Centroid==screenPoints(2,1:2))
                        screenPoints(2,3:4)=(stats(i).Extrema(6,:)+stats(i).Extrema(7,:))/2;
                     end
                    if(stats(i).Centroid==screenPoints(3,1:2))
                        screenPoints(3,3:4)=(stats(i).Extrema(1,:)+stats(i).Extrema(8,:))/2;
                     end
                    if(stats(i).Centroid==screenPoints(4,1:2))
                        screenPoints(4,3:4)=(stats(i).Extrema(2,:)+stats(i).Extrema(3,:))/2;
                    end
            end
end

