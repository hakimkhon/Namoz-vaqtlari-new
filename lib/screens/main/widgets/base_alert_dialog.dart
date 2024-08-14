import 'package:flutter/material.dart';

class BaseAlertDialog extends StatefulWidget {
  const BaseAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.yes,
    required this.no,
    required this.noOnPressed,
    required this.yesOnPressed,
    this.color = const Color.fromARGB(220, 117, 218, 255),
  });
  final String title;
  final String content;
  final String yes;
  final String no;
  final Function yesOnPressed;
  final Function noOnPressed;
  final Color color;

  @override
  State<BaseAlertDialog> createState() => _BaseAlertDialogState();
}

class _BaseAlertDialogState extends State<BaseAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.amberAccent,
        child: AlertDialog(
          title: Text(widget.title),
          content: Text(widget.content),
          backgroundColor: widget.color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: <Widget>[
            FloatingActionButton(
              foregroundColor: Colors.greenAccent,
              child: Text(widget.yes),
              onPressed: () {
                widget.yesOnPressed();
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2030),
                );
              },
            ),
            FloatingActionButton(
              foregroundColor: Colors.redAccent,
              child: Text(widget.no),
              onPressed: () {
                widget.noOnPressed();
              },
            ),
          ],
        ),
      ),
    );
  }
}
