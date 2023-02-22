This is my solution for the Screening Eagle coding challenge
---------------------------------------------------------------------------------------------------------

The app is connected to the [Open weather API] (https://openweathermap.org).
User can receive weather by entering Zip-Code or city name using search bar. After that the pin will be placed at the desired location. After user can tap on a pin and see the weather in locations which are 200 km north, east, south and west far from the original location. Also alert with the hottest weather, most mumility, rain, and wind speed will be displayed.

General technical info:
---------------

- Application was written using UIKit, Swift 5.7
- Minimum deployment target is iOS 16.0.
- Application uses MVVM+C Architecture.
- Network data receiving and error handling are written using Combine.
- For map implementation Apple's MapKit is used
- There is no third-party dependecies used

Testing
---------------
- Some of the application functionality is covered by unit tests.

CI
---------------
- Application is connected to a CI via GitHub actions to execute tests remotely after each push to always be sure that my code is working on different machines and everything is not broken by the last commit.

Core code overview:
---------------

1. **UI**  
The screen which contains map and search bar is called```MapViewController```. It is responsible to track user imput from the search bar and present map with markers. For better reusability and abstract setup of the annotation views ```PinAnnotation``` and ```PinView``` protocol are implemented.

2. **Network**  

For work with URLSession and server requests ```NetworkService``` and ```DataService``` protocol are implemented. Generics are used to make the code more abstract and not depend on any concrete type.
```WeatherRepository``` get the data from the network and gives it to the ```MapScreenViewModel```.

3. **View Model**

```MapScreenViewModel``` is responsible for interacting with repository and coordinator.

4. **Navigation**

```MapCoordinator``` is responsble for navigation inside map, placing the annotations and error presenting.
