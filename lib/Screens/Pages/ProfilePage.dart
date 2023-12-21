import 'package:bid_and_shops/Components/MyDrawer.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Screens/Order/myOrders/ViewOrders.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Consumer<UserProfileProvider>(builder: (context, value, child) {
            return UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                backgroundImage: NetworkImage(
                  // ignore: prefer_interpolation_to_compose_strings
                  "${ApiRequest().endPoint}/" + value.userData!['profile'],
                ),
              ),
              accountName: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  value.userData!['name'],
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              accountEmail: Text(
                value.userData!['email'],
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              otherAccountsPictures: [
                IconButton(
                  onPressed: () {
                    NavigateMe.push(context, const SettingsRoute());
                  },
                  icon: const Icon(Icons.settings),
                ),
              ],
            );
          }),
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
          const Spacer(),
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
}
