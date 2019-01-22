function [same] = compare2Points(p1, p2, delta)
    same=1;
    c=abs(p1-p2);
    if(c(1)>delta || c(2)>delta)
        same=0;
    end
end

