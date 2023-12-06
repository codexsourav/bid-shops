import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigateMe.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
        ),
        title: const Text("Settings"),
      ),
      body: const Column(children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: Icon(FontAwesomeIcons.solidUser),
          title: Text(
            "Update Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: Icon(FontAwesomeIcons.solidEnvelope),
          title: Text(
            "Update Email",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: Icon(FontAwesomeIcons.phone),
          title: Text(
            "Update Mobile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: Icon(FontAwesomeIcons.locationDot),
          title: Text(
            "Update Address",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: Icon(FontAwesomeIcons.lock),
          title: Text(
            "Chenge Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Spacer(),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: Icon(FontAwesomeIcons.rightFromBracket),
          title: Text(
            "Logout",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
