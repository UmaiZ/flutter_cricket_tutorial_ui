import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final data;
  const ScoreCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          data['teamFlag'],
          width: 50,
        ),
        SizedBox(
          height: 7,
        ),
        Text(data['teamName'],
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text("${data['teamRuns']}/${data['teamWickets']} ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.normal)),
            Text(" (${data['teamOvers']} Overs)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ],
    );
  }
}
