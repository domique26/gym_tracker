import 'package:flutter/material.dart';

class WeekdaysTile extends StatelessWidget {
  const WeekdaysTile({
    super.key,
    required this.trainigs,
    required this.add,
  });

  final List<dynamic> trainigs;
  final void Function(int) add;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: weekdaysTile(index, context),
          );
        },
      ),
    );
  }

  Container weekdaysTile(int index, BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey[900],
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            trainigs[index].day,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.underline),
          ),
        ),
        subtitle: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Text(
              trainigs[index].trainigsType,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 23.0),
            child: addButton(trainigs, index, context),
          ),
        ),
      ),
    );
  }

  Widget addButton(List<dynamic> trainings, int index, BuildContext context) {
    if (trainigs[index] == "Restday") {
      return FilledButton(
        onPressed: null,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.grey[800],
          ),
        ),
        child: const Text("Add"),
      );
    } else {
      return FilledButton(
        onPressed: () {
          add(index);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.deepPurple[800],
          ),
        ),
        child: const Text("Add"),
      );
    }
  }
}
