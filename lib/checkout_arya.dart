import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'function_dart.dart';

class checkoutArya extends StatefulWidget{
  _checkout createState()=> _checkout();
}


class _checkout extends State<checkoutArya> {

  String url = '';
  static int t1= 0;
  static int t2= 0;
  static int t3= 0;
  static int t4= 0;
  static int t5= 0;
  static int t6= 0;
  static int t7= 0;
  // List<int> track = [t1, t2, t3, t4, t5, t6, t7];
  var data;
  String output = '';
  bool check = false;
  late Map<String, dynamic> json;
  Future<String> fetchdata() async {
    String help;
    final response = await http.post(
      Uri.parse(
          'http://10.12.35.204:5000/predict'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "key": t1,
        "key": t2,
        "key": t3,
        "key": t4,
        "key": t5,
        "key": t6,
        "key": t7,
      }),
    );


    print(response.body);
    json = jsonDecode(response.body);
    help = json['crop_recommendation'].toString();
    print(json['crop_recommendation'].toString());
    return help;
  }
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
              children: [
                TextField(
                    onSubmitted: (String value){
                      setState(() {
                        t1 = int.parse(value);
                      });
                    },
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
                    onSubmitted: (String value){
                      setState(() {
                        t2 = int.parse(value);
                      });
                    },
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
                  onSubmitted: (String value){
                    setState(() {
                      t3 = int.parse(value);
                    });
                  },
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
                    onSubmitted: (String value){
                      setState(() {
                        t4 = int.parse(value);
                      });
                    },
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
                    onSubmitted: (String value){
                      setState(() {
                        t5 = int.parse(value);
                      });
                    },
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
                    onSubmitted: (String value){
                      setState(() {
                        t6 = int.parse(value);
                      });
                    },
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
                    onSubmitted: (String value){
                      setState(() {
                        t7 = int.parse(value);
                      });
                    },
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
                  data = await fetchdata();
                  setState(() {
                    output = data;
                    check = true;
                  });
                }, child: Text(
                    'Get Reccomendation',
                     style: TextStyle(fontSize: 20),
                )),
                SizedBox(height: 11,),
                check?Text(output):SizedBox()
              ],
            )
        )
        )
    );

  }

}

