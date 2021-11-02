import 'package:flutter/material.dart';

/* Creates a custom text field with the passed label as a hint
  and returns the on changed input */
class InputLine extends StatefulWidget {
  // Required to pass text input back to calling widget
  final ValueChanged<String> onChanged;
  final String label;
  const InputLine({Key? key, required this.label, required this.onChanged}) : super(key: key);

  @override
  State<InputLine> createState() => _InputLineState(label);
}

class _InputLineState extends State<InputLine> {
  String newText = '';
  String label;
  final bgColor = Colors.blueGrey;

  _InputLineState(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: 300,
      child: TextField(
        onChanged: (text) {
          newText = text;
          widget.onChanged(text);
        },
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          hintText: widget.label,
          filled: true,
          fillColor: bgColor[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

/* Creates a custom text field with obscured text,
  the passed label as a hint and returns the on changed input */
class ObscuredInputLine extends StatefulWidget {
  // Required to pass text input back to calling widget
  final ValueChanged<String> onChanged;
  final String label;
  const ObscuredInputLine(
      {Key? key, required this.label, required this.onChanged}) : super(key: key);

  @override
  State<ObscuredInputLine> createState() => _ObscuredInputLineState(label);
}

class _ObscuredInputLineState extends State<ObscuredInputLine> {
  String newText = '';
  String label;
  final bgColor = Colors.blueGrey;

  _ObscuredInputLineState(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: 300,
      child: TextField(
        onChanged: (text) {
          newText = text;
          widget.onChanged(text);
        },
        obscureText: true,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          hintText: widget.label,
          filled: true,
          fillColor: bgColor[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}