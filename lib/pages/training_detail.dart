import 'package:flutter/material.dart';

class TrainingDetail extends StatelessWidget {
  final String weekday;
  final String date;

  const TrainingDetail({
    super.key,
    required this.weekday,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("$weekday $date"),
        backgroundColor: Colors.grey[900],
      ),
      body: detailBody(context),
    );
  }

  Column detailBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [Text('$weekday')],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            height: MediaQuery.of(context).size.width * 1.15,
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
