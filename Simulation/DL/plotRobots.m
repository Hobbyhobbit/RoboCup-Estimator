function plotRobots(RedRobots,BlueRobots,Ball)
%PLOTROBOTS

% Parameters
    robot_r = 0.15;
    ball_r = 0.05;
    
    for i=1:3
        draw_circle(RedRobots(i).X,RedRobots(i).Y,robot_r,'r',1);
        Xstep = RedRobots(i).X + robot_r * cos(RedRobots(i).Theta);
        Ystep = RedRobots(i).Y + robot_r * sin(RedRobots(i).Theta);
        line([RedRobots(i).X Xstep],[RedRobots(i).Y Ystep],'Color','k'); 
        draw_circle(BlueRobots(i).X,BlueRobots(i).Y,robot_r,'b',1);
        Xstep = BlueRobots(i).X + robot_r * cos(BlueRobots(i).Theta);
        Ystep = BlueRobots(i).Y + robot_r * sin(BlueRobots(i).Theta);
        line([BlueRobots(i).X Xstep],[BlueRobots(i).Y Ystep],'Color','k');
    end
    
    draw_circle(Ball.X,Ball.Y,ball_r,'g',1);

end

