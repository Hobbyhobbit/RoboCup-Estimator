function Robot = dummy_init()
%DUMMY_INIT

    global RobotParam;
    RobotParam.radius = 0.15; %[m]
    RobotParam.velocity = 1; %[]

    Robot(1) = struct('color', 3, 'x', -1, 'y', -1, 'dir', 0);
    Robot(2) = struct('color', 3, 'x', -1, 'y', 0, 'dir', 0);
    Robot(3) = struct('color', 3, 'x', -1, 'y', 1, 'dir', 0);
    Robot(4) = struct('color', 3, 'x', -2.5, 'y', 0, 'dir', 0);
    Robot(5) = struct('color', 4, 'x', 1, 'y', -1, 'dir', pi);
    Robot(6) = struct('color', 4, 'x', 1, 'y', 0, 'dir', pi);
    Robot(7) = struct('color', 4, 'x', 1, 'y', 1, 'dir', pi);
    Robot(8) = struct('color', 4, 'x', 2.5, 'y', 0, 'dir', pi);

end

