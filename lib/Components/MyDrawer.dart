import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Screens/ComingSoon.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

Drawer myDrawer(context) {
  return Drawer(
    child: ListView(
      children: [
        Consumer<UserProfileProvider>(builder: (context, value, child) {
          return UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                backgroundImage: NetworkImage(
                  // ignore: prefer_interpolation_to_compose_strings
                  "${ApiRequest().endPoint}/" + value.userData!['profile'],
                ),
              ),
              accountName: Text(
                value.userData!['name'],
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              accountEmail: Text(
                value.userData!['email'],
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ));
        }),
        DrowerItem(
          icon: Icon(
            Icons.how_to_vote_rounded,
          ),
          text: "Top Bids",
        ),
        DrowerItem(
          icon: Icon(
            FontAwesomeIcons.tags,
            size: 18,
          ),
          text: "Top Deals",
        ),
        DrowerItem(
          icon: Icon(
            Icons.currency_rupee,
          ),
          text: "My Subscription",
        ),
        DrowerItem(
          onTap: () {
            NavigateMe.push(context, WishListRoute());
          },
          icon: Icon(
            FontAwesomeIcons.solidHeart,
            size: 18,
          ),
          text: "Wishlists",
        ),
        DrowerItem(
          icon: Icon(
            FontAwesomeIcons.user,
            size: 18,
          ),
          text: "Account",
        ),
        DrowerItem(
          onTap: () {
            NavigateMe.push(context, SettingsRoute());
          },
          icon: Icon(
            FontAwesomeIcons.gear,
            size: 18,
          ),
          text: "Settings",
        ),
        DrowerItem(
          icon: Icon(
            FontAwesomeIcons.lock,
            size: 18,
          ),
          text: "Terms and Conditions",
        ),
        DrowerItem(
          onTap: () {
            UseLocalStorage useLocalStorage =
                UseLocalStorage(storage: localStorage);
            useLocalStorage.cleanStorage();
            NavigateMe.replacePush(context, LoginRoute());
          },
          icon: Icon(
            Icons.exit_to_app_rounded,
          ),
          text: "Logout",
        ),
      ],
    ),
  );
}

class DrowerItem extends StatelessWidget {
  DrowerItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final Icon icon;
  final String text;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap != null
            ? onTap!()
            : Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ComingSoon(),
                ),
              );
      },
      leading: icon,
      title: Text(
        "$text",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    );
  }
}
