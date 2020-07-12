import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'WeatherModel.dart';
import 'SecondScreen.dart';

Future<WeatherModel> getWeather(String city) async
{
  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=fd095b0e6a1957495fffd599f7160050&units=metric');
  if(response.statusCode== 200)
  {
    var result = json.decode(response.body);
    var model = WeatherModel.fromJson(result);
    return model;
  }
  else
    throw Exception('Failed to load weather information');
}
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Miles Weather App',
  home: WeatherApp(),
));

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}
String city;

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        leading: Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: Text(
          'Miles Weather',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,
              color: Colors.white,),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CitySelection()),
              );
            },
          ),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
        ),
        child: FutureBuilder<WeatherModel>(
            future: getWeather(city),
            builder: (context, snapshot) {
              if(snapshot.hasError)
              {
                return Center(
                  child: Container(
                    child: Text(
                      'Error! failed to load the weather of $city. Please check your connection or the spelling of the city entered',
                      style: TextStyle( fontSize: 30.0,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                );
              }
              else if(snapshot.hasData) {
                WeatherModel model  = snapshot.data;
                //var fm = new DateFormat('HH:mm dd EEE MM yyyy');
                //var fm_hour = new DateFormat.Hm();
                var description = model.weather[0].main;
                var icon = model.weather[0].icon;
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 45.0,
                            ),
                            Text(
                              '${model.name}, ',
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent,
                              ),
                            ),
                            Text(
                              '${model.sys.country}',
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  '${ model.weather[0].main}',
                                  style: TextStyle(
                                    fontSize: 55.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Current Weather',
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 20.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              child: image(description, icon)
                          ),
                          SizedBox(width: 15.0),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset('assets/temperature.png',height: 40, width: 40),
                              Container(
                                child: Text(
                                  '${model.main.temp}°C',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Image.asset('assets/humidity.png', height: 40, width: 40),
                                  ),
                                  Container(
                                    child: Text(
                                      '${model.main.humidity}%',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),
                          Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Image.asset('assets/description.png',height: 40, width: 40),
                                  ),
                                  Container(
                                    child: Text(
                                      '${model.weather[0].description}',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset('assets/wind.png', height: 40, width: 40),
                                Text(
                                  'Wind(sp/dg)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                      fontSize: 20.0
                                  ),
                                ),
                                Text(
                                  '${model.wind.speed}/${model.wind.deg}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15.0
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset('assets/pressures.png', height: 40, width: 40),
                                Text(
                                  'Pressure',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                      fontSize: 20.0
                                  ),
                                ),
                                Text(
                                  '${model.main.pressure}hpa',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15.0
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset('assets/thermometer.png', height: 40, width: 40),
                                Text(
                                  'Max & Min',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                      fontSize: 20.0
                                  ),
                                ),
                                Text(
                                  '${model.main.temp_max}°C & ${model.main.temp_min}°C',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15.0
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  ],
                );
              }
              return Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              );
              //return Image.asset('assets/cloudy.png');
            }
        ),
      ),
    );
  }
  Widget image (description,icon) {
    Image miles;
    switch (description) {
      case 'Clear':
      case 'LightCloud':
        miles = Image.asset('assets/sunny.png');
        break;
      case 'Sail':
      case 'Snow':
      case 'Sleet':
        miles = Image.asset('assets/snow.png');
        break;
      case 'HeavyCloud':
      case 'Clouds':
        miles = Image.asset('assets/cloudy.png');
        break;
      case 'HeavyRain':
      case 'LightRain':
      case 'Rain':
      case 'Showers':
        miles = Image.asset('assets/rainy.png');
        break;
      case 'Thunderstorm':
        miles = Image.asset('assets/thunderstorm.png');
        break;
      case 'Fog':
      case 'Haze':
        miles = Image.asset('assets/haze.png');
        break;
      case 'Unknown':
        miles = Image.asset('assets/sunny.png');
        break;
      default:
        miles  = Image.network('https://openweathermap.org/img/w/$icon.png');
    }
    return miles;
  }
}