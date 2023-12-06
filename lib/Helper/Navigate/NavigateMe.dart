import 'package:auto_route/auto_route.dart';

abstract class NavigateMe {
  static bool canGoBAck(context) {
    return AutoRouter.of(context).canPop();
  }

  static void pop(context) {
    AutoRouter.of(context).pop();
  }

  static void push(context, PageRouteInfo page) {
    AutoRouter.of(context).push(page);
  }

  static void pushNamed(context, String pageName) {
    AutoRouter.of(context).pushNamed(pageName);
  }

  static void replacePush(context, PageRouteInfo page) async {
    await AutoRouter.of(context).pushAndPopUntil(
      page,
      predicate: (_) => false,
    );
  }
}
