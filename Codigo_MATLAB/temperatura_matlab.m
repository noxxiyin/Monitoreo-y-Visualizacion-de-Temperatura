% Read temperature data from a ThingSpeak channel for three seperate days 
% and visualize the data in a single plot using the PLOT function. 

% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every minute. 
% Field 4 contains temperature data. 

% Channel ID to read data from 
readChannelID = 2455688; 
% Temperature Field ID 
myFieldID = 1; 
% One day date range
oneDay = [datetime('9-Mar-2024') datetime('10-Mar-2024')];

% Channel Read API Key 
% If your channel is private, then enter the read API key between the '' below: 
readAPIKey = 'JKWRWZENRBFH8XR2'; 

% Read Temperature Data. Learn more about the THINGSPEAKREAD function by 
% going to the Documentation tab on the right side pane of this page. 
temperatureDay1 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                 'dateRange',oneDay-days(1),'ReadKey',readAPIKey); 
temperatureDay2 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(2),'ReadKey',readAPIKey); 
temperatureDay3 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(3),'ReadKey',readAPIKey);
temperatureDay4 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(4),'ReadKey',readAPIKey);
temperatureDay5 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(5),'ReadKey',readAPIKey);                               

% Create array of durations 
myTimes1 = minutes(1:length(temperatureDay1));
myTimes2 = minutes(1:length(temperatureDay2));
myTimes3 = minutes(1:length(temperatureDay3));
myTimes4 = minutes(1:length(temperatureDay4));
myTimes5 = minutes(1:length(temperatureDay5));

% Visualize the data
plot(myTimes1,temperatureDay1, myTimes2,temperatureDay2, myTimes3, temperatureDay3, myTimes4, temperatureDay4, myTimes5, temperatureDay5);
legend({'Day1','Day2','Day3','Day4','Day5'});
xlabel('5 minute intervals');
ylabel('Temperature C');
title('5-Day Temperature Comparison');