import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_task/applications/modules/module.dart';
import 'package:my_task/modules/home/home_page.dart';

class HomeModule implements Modules {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
    ),
  ];
}