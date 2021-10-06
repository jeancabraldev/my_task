import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/applications/ui/theme_app.dart';
import 'package:my_task/components/menu/pages/menu_page.dart';
import 'package:my_task/services/theme_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: headingStyle,
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.close),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Alteralçao da cor do tema'),
              ),
              const SizedBox(height: 5),
              const Divider(),
              MenuPages(
                icon: Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                title: 'Tema',
                subtitle: Get.isDarkMode
                    ? 'Tema escuro ativado'
                    : 'Tema claro ativado',
                onTap: () {
                  ThemeService().switchTheme();
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
