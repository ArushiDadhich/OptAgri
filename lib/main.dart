import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crop Recommendation'),
          // theme: ThemeData(
          //     primarySwatch: Colors.green,
          // ),
          backgroundColor: Colors.green,
          //home: MyApp(),





          //primarySwatch:
        ),
        body: Center(child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        //border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                              color: Colors.green,
                              width: 2
                          )
                      ),
                      hintText: "Enter the value of Nitrogen"
                  )
              ),
                Container(height: 11,),
                TextField(
                    decoration: InputDecoration(
                        focusedBorder:OutlineInputBorder (
                          //border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 2
                            )
                        ),
                        hintText: "Enter the value of Phosphorous"
                    )
                ),
                Container(height: 11,),

                TextField(
                    decoration: InputDecoration(
                        focusedBorder:OutlineInputBorder (
                          //border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 2
                            )
                        ),
                        hintText: "Enter the value of Potassium"
                    )
                ),
                Container(height: 11,),
                TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          //border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 2
                            )
                        ),
                        hintText: "Enter the value of Temperature"
                    )
                ),
                Container(height: 11,),
                TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          //border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 2
                            )
                        ),
                        hintText: "Enter the value of Rainfall"
                    )
                ),
              ],
            )))
    );

  }

}

