function costmap=helperSLCreateCostmap()
mapLayers.StationaryObjects = imread('stationary.bmp');
mapLayers.RoadMarkings=imread('road_markings.bmp');
mapLayers.ParkedCars=imread('parked_cars.bmp');
combinedMap=mapLayers.StationaryObjects+mapLayers.RoadMarkings+mapLayers.ParkedCars;
combinedMap=im2single(combinedMap);
res=0.5;
costmap=vehicleCostmap(combinedMap, 'CellSize', res);
plot(costmap, 'Inflation', 'off')
legend off

costmap.MapExtent % [x, width, y, height] in meters
costmap.CellSize  % cell size in meters

scenario = drivingScenario('SampleTime',0.1','StopTime',60);
vc = vehicle(scenario);
vehicleDims      = vehicleDimensions;
maxSteeringAngle = 35; % in degrees
costmap.CollisionChecker.VehicleDimensions = vehicleDims;
currentPose = [4, 12, 0]; % [x, y, theta]
data = load('routePlan.mat');
routePlan = data.routePlan;
behavioralPlanner = HelperBehavioralPlanner(routePlan, maxSteeringAngle);
end
function HelperBehavioralPlanner(routePlan, maxSteeringAngle)

% Plot vehicle at current pose
hold on
helperPlotVehicle(currentPose, vehicleDims, 'DisplayName', 'Current Pose')
legend off

for n = 1 : height(routePlan)
    % Extract the goal waypoint
    vehiclePose = routePlan{n, 'EndPose'};

    % Plot the pose
    legendEntry = sprintf('Goal %i', n);
    helperPlotVehicle(vehiclePose, vehicleDims, 'DisplayName', legendEntry);
end
hold off
end
