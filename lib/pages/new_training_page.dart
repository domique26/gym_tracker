import 'package:flutter/material.dart';
import 'package:gym_tracker/utils/workout.dart';

class NewTrainingPage extends StatefulWidget {
  final Workout workout;
  const NewTrainingPage({super.key, required this.workout});

  @override
  State<NewTrainingPage> createState() => _NewTrainingPageState();
}

class _NewTrainingPageState extends State<NewTrainingPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController cnt4 = TextEditingController();
    TextEditingController cnt1 = TextEditingController();
    TextEditingController cnt2 = TextEditingController();
    TextEditingController cnt3 = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (cnt1.text.isEmpty || cnt2.text.isEmpty || cnt3.text.isEmpty) {
            return;
          }

          setState(
            () {
              widget.workout.repsSetsWeights.add(
                RepsSetsWeights(
                    reps: cnt1.text,
                    sets: cnt2.text,
                    weight: cnt3.text,
                    exercise: cnt4.text),
              );
            },
          );
        },
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Exercise",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextField(cnt4),
                  const Text(
                    "Reps",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextField(cnt1),
                  const Text(
                    "Sets",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextField(cnt2),
                  const Text(
                    "Weight",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextField(cnt3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextField customTextField(TextEditingController controller) {
    return TextField(
      cursorColor: Colors.white,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "",
        border: inputBorder(),
        enabledBorder: inputBorder(),
      ),
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      borderSide: BorderSide(color: Colors.deepPurple.shade800, width: 2.0),
    );
  }
}
