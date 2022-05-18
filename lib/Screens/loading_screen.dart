import 'package:flutter/material.dart';
import 'package:weather/Services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weathermodel = WeatherModel();
    var weatherData = await weathermodel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitRotatingPlain(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
