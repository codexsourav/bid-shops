import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Screens/ComingSoon.dart';
import 'package:bid_and_shops/Screens/Order/myOrders/ViewOrders.dart';
import 'package:bid_and_shops/Screens/Pages/ProfilePage.dart';
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
          icon: const Icon(
            Icons.how_to_vote_rounded,
          ),
          onTap: () {
            NavigateMe.push(context, const BidShop());
          },
          text: "New Bids",
        ),
        // DrowerItem(
        //   icon: Icon(
        //     FontAwesomeIcons.tags,
        //     size: 18,
        //   ),
        //   text: "Top Deals",
        // ),
        // DrowerItem(
        //   icon: Icon(
        //     Icons.currency_rupee,
        //   ),
        //   text: "My Subscription",
        // ),
        DrowerItem(
          icon: const Icon(
            Icons.shopping_basket_rounded,
          ),
          text: "My Orders",
          onTap: () {
            Navigation.push(context, page: const ViewOrders());
          },
        ),
        DrowerItem(
          onTap: () {
            NavigateMe.push(context, const WishListRoute());
          },
          icon: const Icon(
            FontAwesomeIcons.solidHeart,
            size: 18,
          ),
          text: "Wishlists",
        ),
        DrowerItem(
          onTap: () {
            NavigateMe.push(context, const CartRoute());
          },
          icon: const Icon(
            FontAwesomeIcons.cartShopping,
            size: 18,
          ),
          text: "Cart",
        ),
        DrowerItem(
          onTap: () {
            Navigation.push(context, page: const ProfilePage());
          },
          icon: const Icon(
            FontAwesomeIcons.userAlt,
            size: 18,
          ),
          text: "Account",
        ),
        DrowerItem(
          onTap: () {
            NavigateMe.push(context, const SettingsRoute());
          },
          icon: const Icon(
            FontAwesomeIcons.gear,
            size: 18,
          ),
          text: "Settings",
        ),
        DrowerItem(
          icon: const Icon(
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
          icon: const Icon(
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
                  builder: (context) => const ComingSoon(),
                ),
              );
      },
      leading: icon,
      title: Text(
        "$text",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    );
  }
}
