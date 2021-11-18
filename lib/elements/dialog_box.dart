import 'package:flutter/material.dart';

/* Shows a dialog box with title and OK button
   Use this code to implement:
import 'package:my_story_teller/elements/dialog_box.dart';

  showDialog<String>(
  context: context,
  builder: (BuildContext context) => const OKDialog(
  title: '*string*'));
 */

class OKDialog extends StatelessWidget {
  final String title;
  const OKDialog({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
