% Read humidity data from a ThingSpeak channel for three seperate days 
% and visualize the data in a single plot using the PLOT function. 

% Channel ID to read data from 
readChannelID = 2455688; 
% Temperature Field ID 
myFieldID = 2; 
% One day date range
oneDay = [datetime('9-Mar-2024') datetime('10-Mar-2024')];

% Channel Read API Key 
readAPIKey = 'JKWRWZENRBFH8XR2'; 

% Read Temperature Data. Learn more about the THINGSPEAKREAD function by 
% going to the Documentation tab on the right side pane of this page. 
humidityDay1 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                 'dateRange',oneDay-days(1),'ReadKey',readAPIKey); 
humidityDay2 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(2),'ReadKey',readAPIKey); 
humidityDay3 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(3),'ReadKey',readAPIKey);
humidityDay4 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(4),'ReadKey',readAPIKey);
humidityDay5 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(5),'ReadKey',readAPIKey);                               

% Create array of durations 
myTimes1 = minutes(1:length(humidityDay1));
myTimes2 = minutes(1:length(humidityDay2));
myTimes3 = minutes(1:length(humidityDay3));
myTimes4 = minutes(1:length(humidityDay4));
myTimes5 = minutes(1:length(humidityDay5));

% Visualize the data
plot(myTimes1,humidityDay1, myTimes2,humidityDay2, myTimes3, humidityDay3, myTimes4, humidityDay4, myTimes5, humidityDay5);
legend({'Day1','Day2','Day3','Day4','Day5'});
xlabel('5 minute intervals');
ylabel('Humidity %');
title('5-Day Humidity Comparison');