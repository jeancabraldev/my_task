import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_task/applications/modules/module.dart';

import 'add_task_page.dart';

class AddTaskModule extends Modules {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/add_task',
      page: () => const AddTaskPage(),
    ),
  ];
}
