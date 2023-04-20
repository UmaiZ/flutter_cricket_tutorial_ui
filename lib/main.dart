import 'dart:convert';

import 'package:cricket_tutorial/widgets/score.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const homeScreen(),
    );
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  //We already have an ui and mock data let integrate with help of ChatGPT :D

  List data = [];
  getData() async {
    var response = await http.get(
        Uri.parse("https://mocki.io/v1/c967245d-4639-4e0b-aa90-18fa8d14254f"));
    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata;
    });
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffecf1f3),
      body: Column(
        children: [
          Container(
            height: res_height * 0.35,
            child: Stack(
              children: [
                Positioned(
                  top: res_height * 0.075,
                  left: 20,
                  child: Image.asset(
                    'assets/images/dots-menu.png',
                    width: 25,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    color: Color(0xffee233c),
                    height: res_height * 0.275,
                    width: res_width * 0.75,
                  ),
                ),
                Positioned(
                  top: res_height * 0.075,
                  right: 20,
                  child: Image.asset(
                    'assets/images/notification.png',
                    color: Colors.white,
                    width: 30,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: res_height * 0.145,
                  child: SizedBox(
                    height: res_height * 0.2,
                    width: res_width * 0.85,
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LIVE MATCH UPDATES",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: res_height * 0.015,
                            ),
                            Text(
                              "With Quick Score!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          data.length > 0
              ? Expanded(
                  child: SizedBox(
                    width: res_width * 0.925,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 0),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              width: res_width * 0.95,
                              height: res_height * 0.2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Live Match",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffedf2f4),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                size: 15,
                                                color: Color(0xffee233c),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Live",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ScoreCard(
                                        data: data[index]['team1'],
                                      ),
                                      Image.asset(
                                        'assets/images/versus.png',
                                        width: 50,
                                      ),
                                      ScoreCard(
                                        data: data[index]['team2'],
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          );
                        }),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
        ],
      ),
    );
  }
}
