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
end

