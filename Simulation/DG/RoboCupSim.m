function RoboCupSim(cycles)
%randSim Simulates a RoboCup game
%   cycles  Number of simulation cycles

%-----Global variables-----%
%global r = [1,10];
global b;
global Pitch_l;
global Pitch_w;

Pitch_l = 6;
Pitch_w = 4;

%-----Creating the initial situation-----%
%Initialization Robots and ball
for i=1:10      %Anzahl Roboter
    r(i) = struct('x', (Pitch_l./2)*rand, 'y', Pitch_w*rand, 'phi', 2*pi*rand);
    %r(i+5) = struct('x', (Pitch_l./2)*rand+(Pitch_l./2), 'y', Pitch_w*rand, 'phi', 2*pi*rand);
    %b = struct('x', )
end
assignin('caller', 'r', r);

%Initialization-Plot
PlotNS;

%-----Simulation cycle-----%
for j=1:cycles
    for k=1:10
        %randRobot(k, Pitch_l, Pitch_w);
        randRobot(k);
    end
    %r(1).x
    %randBall(b, Pitch_l, Pitch_w);
    PlotNS;
end
    

end

