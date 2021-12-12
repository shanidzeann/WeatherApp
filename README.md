# Clima

Weather app based on Clima from Complete iOS App Development Bootcamp by Dr. Angela Yu

Set your API key in WeatherViewController before running:
let APP_ID = "your key"

Clima:
- Get weather data (Alamofire)
- Parse JSON (SwiftyJSON)
- Get user location (CoreLocation)

![Image alt](https://github.com/shanidzeann/Screenshots/blob/main/Weather1.png)
![Image alt](https://github.com/shanidzeann/Screenshots/blob/main/Weather2.png)

What I've added:
- Extracte code from ViewControllers and place it into Network and Data managers
- Hide API key
- Update the background image according to the time of day
- Update weather icons (URLSession) according to https://openweathermap.org/weather-conditions
(these icons don't look really nice, but I suppose it's ok for testing)

![Image alt](https://github.com/shanidzeann/Screenshots/blob/main/Weather3.png)
![Image alt](https://github.com/shanidzeann/Screenshots/blob/main/Weather4.png)
