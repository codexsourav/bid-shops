import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Screens/ComingSoon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Drawer myDrawer(context) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ),
            accountName: Text(
              "Jone Doe",
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            accountEmail: Text(
              "jonedoe@gmail.com",
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            )),
        DrowerItem(
          icon: Icon(
            Icons.wallet,
          ),
          text: "My Wallet",
        ),
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
