import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final String phone;
  SettingsScreen(this.phone);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.phone),
      )
    );
  }
}
