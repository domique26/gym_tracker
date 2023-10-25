import 'package:flutter/material.dart';
import 'package:gym_tracker/models/workout_model.dart';

class TrainingTile extends StatefulWidget {
  final VoidCallback viewDetail;
  final VoidCallback delete;
  final Workout workout;

  const TrainingTile({
    super.key,
    required this.viewDetail,
    required this.delete,
    required this.workout,
  });
  @override
  State<TrainingTile> createState() => _TrainingTileState();
}

class _TrainingTileState extends State<TrainingTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: widget.viewDetail,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.grey[900],
        title: const Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '${widget.workout.date}       |        ${widget.workout.time}',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: widget.delete,
        ),
      ),
    );
  }
}
