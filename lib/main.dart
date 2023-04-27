import 'dart:convert';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'checkout_arya.dart';
import 'checkout_anvi.dart';
import 'schemes.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;

  String? _temperature;
  String? _description;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    _getCurrentWeatherData();

    super.initState();
  }

  void _getCurrentWeatherData() async {
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?appid=d340a8db04c835a58b4efbb015d4883c&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _temperature = data['main']['temp'].toString();
        _description = data['weather'][0]['description'].toString();
      });
    } else {
      print('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text("HI, OUR DEAR FARMERS!"),
    ),
    body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (_temperature != null && _description != null)
        Column(
    children: [
      Text('Temperature: $_temperature\u00B0C',
      style: TextStyle(fontSize: 24),
    ),
    Text('Description: $_description',
    style: TextStyle(fontSize: 18),
    ),
    ],
    ),
    if (_temperature == null || _description == null)
      const CircularProgressIndicator(),
    ],
    ),
    floatingActionButton: FloatingActionBubble(items: <Bubble>[
      Bubble(title: "Crop Recommendation",
    iconColor: Colors.white,
    bubbleColor: Colors.black,
    icon: Icons.water_drop,
    titleStyle: TextStyle(fontSize: 18, color: Colors.white),
    onPress: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (BuildContext context) {
      return checkoutArya();
    }
      ),
    );
    //_animationController!.reverse();
    },
    ),
    Bubble(
    title: "Disease Prediction",
    iconColor: Colors.white,
    bubbleColor: Colors.black,
    icon: Icons.add_a_photo,
    titleStyle: TextStyle(fontSize: 18, color: Colors.white),
    onPress: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) {
      return GalleryScreen();
    }
  ),
  );
  //_animationController!.reverse();
  },
  ),
  Bubble(
  title: "Beneficiary Schemes",
  iconColor: Colors.white,
  bubbleColor: Colors.black,
  icon: Icons.favorite,
  titleStyle: TextStyle(fontSize: 18, color: Colors.white),
  onPress: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (BuildContext context) {
    return checkoutSchemes();
    }
    )
    );
  },
  ),
  Bubble(
  title: "Yield Prediction",
  iconColor: Colors.white,
  bubbleColor: Colors.black,
  icon: Icons.home,
  titleStyle: TextStyle(fontSize: 18, color: Colors.white),
  onPress: () {
  _animationController!.reverse();
  },
  ),
  ],
  animation: _animation!,
  onPress: () => _animationController!.isCompleted
  ? _animationController!.reverse()
      : _animationController!.forward(),
  backGroundColor: Colors.amberAccent,
  iconColor: Colors.white,
  iconData: Icons.menu,
  )
  );
}
}

//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:geolocator/geolocator.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Weather App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String _cityName = "Loading...";
//   double _temperature = 0;
//   String _weatherDescription = "";
//   String _weatherIconCode = "";
//
//   @override
//   void initState() {
//     super.initState();
//     getLocationWeather();
//   }
//
//   Future<void> getLocationWeather() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//
//     //String url = 'https://api.weatherapi.com/v1/current.json?key=TdEjBLNaseSDINEEc0QGtfi3f2Rxervz&q=${position.latitude},${position.longitude}';
//     String url = 'https://api.weatherapi.com/v1/current.json?key=TdEjBLNaseSDINEEc0QGtfi3f2Rxervz&q=${position.latitude},${position.longitude}';
//
//     http.Response response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       var result = jsonDecode(response.body);
//       setState(() {
//         _cityName = result['location']['name'];
//         _temperature = result['current']['temp_c'];
//         _weatherDescription = result['current']['condition']['text'];
//         _weatherIconCode = result['current']['condition']['icon'];
//       });
//     } else {
//       setState(() {
//         _cityName = "Failed to load data";
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Weather App"),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               _cityName,
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             Image.network(
//               "https:${_weatherIconCode}",
//               scale: 0.5,
//             ),
//             SizedBox(height: 16),
//             Text(
//               "${_temperature.toStringAsFixed(1)}°C",
//               style: TextStyle(
//                 fontSize: 48,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               _weatherDescription,
//               style: TextStyle(
//                 fontSize: 24,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
