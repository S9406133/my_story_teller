import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (route)
      {String _text = route.toString();
      Navigator.pushNamedAndRemoveUntil(
          context, _text, (Route<dynamic> route) => false); },
      icon: const Icon(Icons.logout, size: 30),
      itemBuilder: (context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: '/login',
          child: Text('Logout'),
        ),
      ],
    );
  }
}
