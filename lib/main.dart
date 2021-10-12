import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_task/applications/ui/theme_app.dart';
import 'package:my_task/modules/setting/settings_module.dart';
import 'package:my_task/services/theme_service.dart';

import 'modules/home/home_module.dart';
import 'modules/task/add_task_module.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Task',
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      themeMode: ThemeService().theme,
      getPages: [
        ...HomeModule().routers,
        ...SettingsModule().routers,
        ...AddTaskModule().routers,
      ],
    );
  }
}
