import 'package:flutter/material.dart';

class BaseAlertDialog extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.amberAccent,
        child: AlertDialog(
          title: Text(title),
          content: Text(content),
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: <Widget>[
            FloatingActionButton(
              foregroundColor: Colors.greenAccent,
              child: Text(yes),
              onPressed: () {
                yesOnPressed();
            },
            ),
            FloatingActionButton(
              foregroundColor: Colors.redAccent,
              child: Text(no),
              onPressed: () {
                noOnPressed();
              },
            ),
          ],
        ),
      ),
    );
  }
}
