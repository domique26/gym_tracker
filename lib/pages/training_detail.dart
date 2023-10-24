import 'package:flutter/material.dart';
import 'package:gym_tracker/data/database.dart';
import 'package:gym_tracker/utils/add_button.dart';
import 'package:gym_tracker/models/workout_model.dart';

class TrainingDetail extends StatefulWidget {
  final Workout workout;

  const TrainingDetail({
    super.key,
    required this.workout,
  });

  @override
  State<TrainingDetail> createState() => _TrainingDetailState();
}

class _TrainingDetailState extends State<TrainingDetail> {
  Widget customBody(BuildContext context) {
    if (widget.workout.repsSetsWeights.isEmpty) {
      return Center(child: CustomAddButton(widget: widget));
    }
    return detailBody(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text(
          "Workout Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: customBody(context),
    );
  }

  Widget detailBody(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          ListView.builder(
            itemCount: widget.workout.repsSetsWeights.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: Colors.grey[900],
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  leading: const Icon(Icons.home, size: 40),
                  title: Text(
                    widget.workout.repsSetsWeights[index].exercise,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(
                    "${widget.workout.repsSetsWeights[index].reps} Reps    |   ${widget.workout.repsSetsWeights[index].sets} Sets    |   ${widget.workout.repsSetsWeights[index].weight} KG",
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.workout.repsSetsWeights.removeAt(index);
                      });
                      db.updateDatabase();
                    },
                  ),
                ),
              );
            },
          ),
          CustomAddButton(widget: widget),
        ],
      ),
    );
  }
}
