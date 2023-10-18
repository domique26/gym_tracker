import 'package:flutter/material.dart';

class TrainingTile extends StatefulWidget {
  final VoidCallback viewDetail;
  final VoidCallback delete;
  final String weekday;
  final String date;
  final int duration;
  final int index;

  TrainingTile({
    super.key,
    required this.viewDetail,
    required this.delete,
    required this.weekday,
    required this.date,
    required this.duration,
    required this.index,
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
        title: Text(
          widget.weekday,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          widget.date,
          style: const TextStyle(color: Colors.white),
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
