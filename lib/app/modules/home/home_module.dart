import 'package:app_test1/app/shared/constants.dart';
import 'package:app_test1/app/modules/home/components/custom_navigation_bar.dart';
import 'package:app_test1/app/modules/home/controllers/product_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/home_controller.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(() => HomeController());
    i.addLazySingleton(() => ProductController());
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => CustomNavigationBar(),
      transition: TransitionType.leftToRight,
      duration: defaultTransition,
    );
  }
}
