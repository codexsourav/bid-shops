import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    UseLocalStorage storage = UseLocalStorage(storage: localStorage);
    String? key = await storage.getStorage(key: "authKey");
    if (key == null || key.isEmpty) {
      router.push(LoginRoute());
    } else {
      resolver.next(true);
    }
  }
}
