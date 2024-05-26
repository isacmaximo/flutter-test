import 'package:app_test1/app/shared/constants.dart';
import 'package:app_test1/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: HomeModule(),
      transition: TransitionType.leftToRight,
      duration: defaultTransition,
    );
  }
}
