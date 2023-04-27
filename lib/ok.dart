import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'checkout_arya.dart';
import 'package:http/http.dart' as http;
import 'checkout_anvi.dart';

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

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("HI, OUR DEAR FARMERS!"),
        ),
        body: Container(
          height: 350,
          color: Colors.green[300],
        ),
        floatingActionButton: FloatingActionBubble(
          items: <Bubble>[
            Bubble(
              title: "Crop Recommendation",
              iconColor: Colors.white,
              bubbleColor: Colors.black,
              icon: Icons.water_drop,
              titleStyle: TextStyle(fontSize: 18, color: Colors.white),
              onPress: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context)
                  {
                    return checkoutArya();
                  },
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
                Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context)
                  {
                    return GalleryScreen();
                  },
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
                _animationController!.reverse();
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