import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Screens/Order/AddressPage.dart';
import 'package:bid_and_shops/Screens/settings/UpdateEmail.dart';
import 'package:bid_and_shops/Screens/settings/UpdateMobile.dart';
import 'package:bid_and_shops/Screens/settings/UpdatePassword.dart';
import 'package:bid_and_shops/Screens/settings/UpdateProfile.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';
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
      body: Column(children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: const Icon(FontAwesomeIcons.solidUser),
          title: const Text(
            "Update Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.push(context, page: const UpdateProfile());
          },
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: const Icon(FontAwesomeIcons.solidEnvelope),
          title: const Text(
            "Update Email",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.push(context, page: const UpdateEmail());
          },
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: const Icon(FontAwesomeIcons.phone),
          title: const Text(
            "Update Mobile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.push(context, page: const UpdateMobile());
          },
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: const Icon(FontAwesomeIcons.locationDot),
          title: const Text(
            "Update Address",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.push(context,
                page: const AddressPage(
                  forUpdate: true,
                ));
          },
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: const Icon(FontAwesomeIcons.lock),
          title: const Text(
            "Chenge Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigation.push(context, page: const UpdatePassword());
          },
        ),
        const Spacer(),
        ListTile(
          onTap: () {
            UseLocalStorage useLocalStorage =
                UseLocalStorage(storage: localStorage);
            useLocalStorage.cleanStorage();
            NavigateMe.replacePush(context, LoginRoute());
          },
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          leading: const Icon(FontAwesomeIcons.rightFromBracket),
          title: const Text(
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
