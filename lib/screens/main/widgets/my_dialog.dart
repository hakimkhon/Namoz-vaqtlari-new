import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
    required this.title,
    required this.content,
    required this.yesBtn,
    required this.noBtn,
    required this.noBtnOnPressed,
    required this.yesBtnOnPressed,
    this.color = const Color.fromARGB(220, 117, 218, 255),
  });
  final String title;
  final String content;
  final String yesBtn;
  final String noBtn;
  final Function yesBtnOnPressed;
  final Function noBtnOnPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future showMyDialog(BuildContext context, String title, String content,
      String yesBtn, String noBtn, Function yes, Function no, Color color) {
    return showDialog(
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          FloatingActionButton(
            onPressed: () {
              yesBtnOnPressed();
            },
            foregroundColor: Colors.greenAccent,
            child: Text(yesBtn),
          ),
          FloatingActionButton(
            onPressed: () {
              noBtnOnPressed();
            },
            foregroundColor: Colors.red,
            child: Text(noBtn),
          ),
        ],
      ),
      context: context,
    );
  }



}
