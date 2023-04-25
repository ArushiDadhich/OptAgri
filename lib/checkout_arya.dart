import 'dart:convert';

import 'package:flutter/material.dart';
import 'function_dart.dart';

class checkoutArya extends StatefulWidget{
  _checkout createState()=> _checkout();
}

class _checkout extends State<checkoutArya> {
  String url = '';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crop Recommendation'),
          // theme: ThemeData(
          //     primarySwatch: Colors.green,
          // ),
          backgroundColor: Colors.green,
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
                TextButton(onPressed: () async {
                  data = await fetchdata(url);
                  var decoded = jsonDecode(data);
                  setState(() {
                    output = decoded['output'];
                  });
                }, child: Text(
                    'Get Reccomendation',
                     style: TextStyle(fontSize: 20),
                ))
              ],
            )
        )
        )
    );

  }

}

