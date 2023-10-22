import 'package:flutter/material.dart';

class NewTrainingPage extends StatefulWidget {
  const NewTrainingPage({super.key});

  @override
  State<NewTrainingPage> createState() => _NewTrainingPageState();
}

class _NewTrainingPageState extends State<NewTrainingPage> {
  @override
  Widget build(BuildContext context) {
    return const NewTrainingsPageWidget();
  }
}

class NewTrainingsPageWidget extends StatelessWidget {
  const NewTrainingsPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Row(
          children: [Text("Add "), Icon(Icons.add)],
        ),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Container(
        color: Colors.grey[800],
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Twoja Stara",
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                        color: Colors.deepPurple.shade800, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                        color: Colors.deepPurple.shade800, width: 2.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
