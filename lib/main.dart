import 'package:cricket_tutorial/widgets/score.dart';
import 'package:flutter/material.dart';

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
  var data = [
    {
      'team1': {
        'teamName': 'IND',
        'teamFlag':
            "https://flagsimages.s3.ap-northeast-1.amazonaws.com/IND.png",
        'teamRuns': '120',
        'teamWickets': '2',
        'teamOvers': '15'
      },
      'team2': {
        'teamName': 'PAK',
        'teamFlag':
            "https://flagsimages.s3.ap-northeast-1.amazonaws.com/PAK.png",
        'teamRuns': '0',
        'teamWickets': '0',
        'teamOvers': '0'
      }
    },
    {
      'team1': {
        'teamName': 'AUS',
        'teamFlag':
            "https://flagsimages.s3.ap-northeast-1.amazonaws.com/AUS.png",
        'teamRuns': '180',
        'teamWickets': '2',
        'teamOvers': '20'
      },
      'team2': {
        'teamName': 'ENG',
        'teamFlag':
            "https://flagsimages.s3.ap-northeast-1.amazonaws.com/ENG.png",
        'teamRuns': '10',
        'teamWickets': '0',
        'teamOvers': '1'
      }
    },
    {
      'team1': {
        'teamName': 'SCO',
        'teamFlag':
            "https://flagsimages.s3.ap-northeast-1.amazonaws.com/SCO.png",
        'teamRuns': '0',
        'teamWickets': '0',
        'teamOvers': '0'
      },
      'team2': {
        'teamName': 'UAE',
        'teamFlag':
            "https://flagsimages.s3.ap-northeast-1.amazonaws.com/UAE.png",
        'teamRuns': '10',
        'teamWickets': '0',
        'teamOvers': '1'
      }
    }
  ];

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
          Expanded(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ],
      ),
    );
  }
}
