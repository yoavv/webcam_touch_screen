function [ mouseX, mouseY ] = calcMouseLocation(screen_points, mouse,index)
    Pix_SS = get(0,'screensize');
    res_width=Pix_SS(3);
    res_height=Pix_SS(4);


    
    p=mouse.Extrema(index,:);
    
    a=screen_points(1,3:4);
    b=screen_points(2,3:4);
    c=screen_points(3,3:4);
    d=screen_points(4,3:4);

    C=(a(2)-p(2))*(d(1)-p(1))-(a(1)-p(1))*(d(2)-p(2));
	B=(a(2)-p(2))*(c(1)-d(1))+(b(2)-a(2))*(d(1)-p(1))-(a(1)-p(1))*(c(2)-d(2))-(b(1)-a(1))*(d(2)-p(2));
	A=(b(2)-a(2))*(c(1)-d(1))-(b(1)-a(1))*(c(2)-d(2));

	D=B*B-4*A*C;

	u=(-B-(D)^0.5)/(2*A);
	p1x=a(1)+(b(1)-a(1))*u;
	p2x=d(1)+(c(1)-d(1))*u;
	px=p(1);

	v=(px-p1x)/(p2x-p1x);
                      
    mouseX=u*res_width; 
    mouseY=v*res_height;                        
end