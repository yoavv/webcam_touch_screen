function [ height,width ] = calc_height_width( stats )


top_left=stats.Extrema(1,2);
botom_left=stats.Extrema(6,2);
right_top=stats.Extrema(3,1);
left_top=stats.Extrema(8,1);

height=botom_left-top_left;
width=right_top-left_top;
end

