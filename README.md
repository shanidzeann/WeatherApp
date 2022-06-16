# Clima

Weather app based on Clima from Complete iOS App Development Bootcamp by Dr. Angela Yu

Set your API key in WeatherViewController before running:
let APP_ID = "your key"

Clima:
- Get weather data (Alamofire)
- Parse JSON (SwiftyJSON)
- Get user location (CoreLocation)

![Image alt](https://github.com/shanidzeann/Screenshots/blob/master/Weather1.png)
![Image alt](https://github.com/shanidzeann/Screenshots/blob/master/Weather2.png)

What I've done on my own:
- Extract code from ViewControllers and place it into Network and Data managers
- Hide API key
- Add functionality for updating the background image according to the time of day
- Add functionality for updating weather icons (URLSession) according to https://openweathermap.org/weather-conditions
(these icons don't look really nice, but I suppose it's ok for testing)

![Image alt](https://github.com/shanidzeann/Screenshots/blob/master/Weather3.png)
![Image alt](https://github.com/shanidzeann/Screenshots/blob/master/Weather4.png)
