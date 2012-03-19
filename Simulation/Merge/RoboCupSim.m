%    ___         __        _____          
%   / _ \ ___   / /  ___  / ___/__ __ ___ 
%  / , _// _ \ / _ \/ _ \/ /__ / // // _ \
% /_/|_| \___//_.__/\___/\___/ \_,_// .__/ Simulation
%                                  /_/    

% SETTINGS

clear all;
global dt;

steps = 2e3;
dt = 0.1; %[s/step]

% Field Parameter (Rules2011.pdf)
global Field;
    Field.width = 6; %[m]
    Field.height = 4; %[m]
    Field.penaltyAreaWidth = 0.6; %[m]
    Field.penaltyAreaHeight = 2.2; %[m]
    Field.goalHeight = 1.4; %[m]
    Field.goalWidth = 0.02; %[m]
    Field.centerCircleRadius = 0.6; %[m]
    Field.pointRadius = 0.05; %[m]
    Field.penaltyPointLocation = 1.8; %[m]
    
    
global Noise;
    Noise.process.pos = 1e-2 *dt; % [m/step]
    Noise.process.dir = 1e-2 * 2*pi *dt; %[rad/step]
    
    Noise.measure.pos = 1e-1; %[m]

%% - - - - - Initalization - - - - - %
figure('units','normalized','position',[0.1,0,0.4,0.9]);
colorcode;

global RobotParam;
global BallParam;
global Score;
    Score.blue = 0;
    Score.pink = 0;
    
    Robot = dummy_init();
    Ball = ball_init();

%% - - - - - Loop - - - - - %
for s = 1:steps
    Robot = dummy_step(Robot);
    Ball = ball_step(Ball,Robot);
    Robot_m = dummy_measure(Robot);
    
    clf
    subplot(2,1,1)
    visualize(Robot,Robot_m,Ball);      % Ich habe die Funktion jetzt trotzdem
                                        % als einzelne gelassen - aber
                                        % daf�r innerhalb viele Funktionen,
                                        % hat jemand eine sch�nere L�sung?
                                        % (DL)
                                        % Kann man mit MATLAB noch anders 
                                        % kommentieren?
    subplot(2,1,2)
    visualize(Robot_m,Robot_m,Ball);
    
    pause(0.001);
end