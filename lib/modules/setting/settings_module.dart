import 'package:get/get.dart';
import 'package:my_task/applications/modules/module.dart';

import 'settings_page.dart';

class SettingsModule implements Modules {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/settings',
      page: () => const SettingsPage(),
    ),
  ];
}
