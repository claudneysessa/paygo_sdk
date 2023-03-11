import 'package:get/get.dart';
import 'package:paygo_sdk_example/presentation/views/home_binding.dart';
import 'package:paygo_sdk_example/presentation/views/home_view.dart';

part 'routes.dart';

class Pages {
  static const initialRoute = Routes.home;

  static final data = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}
